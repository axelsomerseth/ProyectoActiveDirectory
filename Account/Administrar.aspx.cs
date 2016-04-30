using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using ActiveDirectory.Models;
using System.DirectoryServices;
using System.DirectoryServices.AccountManagement;
using System.Web.UI.WebControls;
using System.Collections.Generic;

namespace ActiveDirectory.Account
{
    public partial class Administrar : Page
    {
        protected PrincipalContext contexto;
        protected UserPrincipal usuario;
        protected string Dominio;
        protected string Usuario;
        protected string Contrasenia;
        protected string ContraseniaNueva;
        protected string ContraseniaPrevia;


        private void Page_Load(object sender, System.EventArgs e)
        {
            if (Contrasenia == null)
            {
                Dominio = (string)Session["dominio"];
                Usuario = (string)Session["usuario"];
                Contrasenia = (string)Session["contrasenia"];
            }
            GetInfo(sender, e);
        }

        protected void GetInfo(object sender, EventArgs e)
        {
            try
            {
                this.contexto = new PrincipalContext(
                                                         ContextType.Domain,
                                                         Dominio,
                                                         Usuario,
                                                         Contrasenia
                                                     );
                if (this.contexto.ValidateCredentials(Usuario, Contrasenia))
                {
                    this.usuario = UserPrincipal.FindByIdentity(contexto, Usuario);

                    Nombre2.Text = usuario.GivenName;
                    Apellido2.Text = usuario.Surname;
                    Apodo2.Text = usuario.DisplayName;
                    getGrupos(usuario);
                    getUsuarios(contexto);
                }
                //contexto.Dispose();
            }
            catch
            {
                Nombre2.Text = "Disculpe, hubo un error al cargar la página.";
            }
        }


        protected void cambiarContrasenia(object sender, EventArgs e)
        {
            String strUsuario = downListUsuarios.SelectedItem.ToString().Trim();
            try
            {
                this.contexto = new PrincipalContext(
                                                         ContextType.Domain,
                                                         Dominio,
                                                         strUsuario,
                                                         OldPassword.Text.Trim()

                                                     );
                if (this.contexto.ValidateCredentials(strUsuario, OldPassword.Text.Trim()))
                {
                    this.usuario = UserPrincipal.FindByIdentity(contexto, strUsuario);
                    administrarContrasenia(usuario);
                }
                //contexto.Dispose();
            }
            catch
            {
                Apodo2.Text = "Disculpe, hubo un error al cargar la página.";
            }
        }


        protected void administrarContrasenia(UserPrincipal usuario)
        {
            try
            {
                usuario.ChangePassword(OldPassword.Text.Trim(), ConfirmPassword.Text.Trim());
            }
            catch (InvalidOperationException ioe)
            {
                lblErrorPassword.Text = ioe.Message;
                //lblErrorPassword.Text = "No se ha conservado la entidad de seguridad.";
            }
            catch (PasswordException pe)
            {
                lblErrorPassword.Text = pe.Message;
                //lblErrorPassword.Text = "La nueva contraseña no cumple los requisitos de complejidad.";
            }
            catch (NotSupportedException nse)
            {
                lblErrorPassword.Text = nse.Message;
                //lblErrorPassword.Text = "La entidad de seguridad no es un usuario.";
            }
            catch
            {
                lblErrorPassword.Text = "Disculpe, la contraseña no cumple con las directivas.";
            }
            
            
        }



        protected void getGrupos(UserPrincipal usuario)
        {
            PrincipalSearchResult<Principal> coleccionGrupos = usuario.GetGroups();

            var enumerador = coleccionGrupos.GetEnumerator();
            {
                lstGrupos.Items.Clear();
                while (enumerador.MoveNext())
                {
                    lstGrupos.Items.Add(new ListItem(enumerador.Current.ToString()));
                }
            }

        }



        protected void getUsuarios(PrincipalContext contexto)
        {
            if (usuario.Name.Trim() == "Administrator")
            {
                UserPrincipal usuario = new UserPrincipal(contexto);
                PrincipalSearcher buscador = new PrincipalSearcher(usuario);
                PrincipalSearchResult<Principal> coleccionUsuarios = buscador.FindAll();
                Apodo2.Text = "Usted es el Administrator";
                var enumerador = coleccionUsuarios.GetEnumerator();
                {
                    downListUsuarios.Items.Clear();
                    while (enumerador.MoveNext())
                    {
                        downListUsuarios.Items.Add(new ListItem(enumerador.Current.ToString()));
                    }
                }
            }
            else
            {
                downListUsuarios.Items.Clear();
                downListUsuarios.Items.Add(this.usuario.DisplayName.ToString());
            }

        }
    }
}