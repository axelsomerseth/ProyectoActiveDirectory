using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using ActiveDirectory.Models;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.DirectoryServices;


namespace ActiveDirectory.Account
{
    public partial class Login : Page
    {
        protected DirectoryEntry acceso;

        public string Dominio
        {
            get
            {
                return Domain.Text.Trim();
            }
        }
        public string Usuario
        {
            get
            {
                return Username.Text.Trim();
            }
        }
        public string Contrasenia
        {
            get
            {
                return Password.Text.Trim();
            }
        }





        protected void ingresar(object sender, EventArgs e)
        {

            Session["dominio"] = Domain.Text.Trim();
            Session["usuario"] = Username.Text.Trim();
            Session["contrasenia"] = Password.Text.Trim();


            this.acceso = new DirectoryEntry("LDAP://" + Domain.Text.Trim(),
                                                         Username.Text.Trim(),
                                                         Password.Text.Trim(),
                                                         AuthenticationTypes.Secure); //AuthenticationTypes.Secure como 4to parámetro

            try
            {
                DirectorySearcher existe = new DirectorySearcher(acceso);
                SearchResult resultado = existe.FindOne(); //Devuelve el primero que encuentra


                if (resultado != null)
               {
                    lblError.Text = "Usted ha sido autenticado";
                    Server.Transfer("Administrar.aspx", true);
                    //Response.Redirect("Administrar.aspx");
                }


            }
            catch
            {
                lblError.Text = "Error:     Disculpe, usted no ha sido autenticado. \n Por favor, verifique sus datos.";
            }

            
        }

        //fin de ingresar




        /*protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            // Habilite esta opción una vez tenga la confirmación de la cuenta habilitada para la funcionalidad de restablecimiento de contraseña
            //ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }*/


        /*
        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Validar la contraseña del usuario
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

                // Esto no cuenta los errores de inicio de sesión hacia el bloqueo de cuenta
                // Para habilitar los errores de contraseña para desencadenar el bloqueo, cambie a shouldLockout: true
                var result = signinManager.PasswordSignIn(Domain.Text + Username.Text, Password.Text, RememberMe.Checked, shouldLockout: false);

                switch (result)
                {
                    case SignInStatus.Success:
                        IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                        break;
                    case SignInStatus.LockedOut:
                        Response.Redirect("/Account/Lockout");
                        break;
                    case SignInStatus.RequiresVerification:
                        Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}", 
                                                        Request.QueryString["ReturnUrl"],
                                                        RememberMe.Checked),
                                          true);
                        break;
                    case SignInStatus.Failure:
                    default:
                        FailureText.Text = "Intento de inicio de sesión no válido";
                        ErrorMessage.Visible = true;
                        break;
                }
            }
        }
        */



    }
}