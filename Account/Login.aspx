<%@ Page Title="Iniciar sesión" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"  CodeBehind="Login.aspx.cs" Inherits="ActiveDirectory.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %></h2>

    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Utilice una cuenta de Active Directory para iniciar sesión.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Domain" CssClass="col-md-2 control-label">Dominio: </asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Domain" CssClass="form-control" TextMode="SingleLine" placeholder="cordova.com"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Domain" CssClass="text-danger" ErrorMessage="El dominio es obligatorio." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Username" CssClass="col-md-2 control-label">Usuario: </asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Username" CssClass="form-control" TextMode="SingleLine"  placeholder="escriba aquí su nombre de usuario"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Username" CssClass="text-danger" ErrorMessage="El nombre de usuario es obligatorio." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Contraseña: </asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="La contraseña es obligatoria." />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" Visible="false"/>
                                <asp:Label runat="server" AssociatedControlID="RememberMe" Visible="false">¿Recordar cuenta?</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="ingresar" Text="Acceder" CssClass="btn btn-default" Height="40px" Width="142px" Font-Size="Larger" style="font-weight: bold"/>
                        </div>
                    </div>
                </div>
                <%--
                <p>
                    NO QUIERO REGISTRAR USUARIOS NUEVOS
                        <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Registrarse como usuario nuevo</asp:HyperLink>
                    
                </p>
                --%>
                <%--<p>
                     Habilite esta opción cuando haya habilitado la confirmación de cuentas para la funcionalidad de restablecimiento de contraseña 
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled" class="col-md-offset-2 col-md-10">Recuperar contraseña</asp:HyperLink>
                    
                </p>--%>
            </section>
        </div>

        <div class="col-md-4">
            <section id="socialLoginForm" style="font-weight: bold; font-size: x-large">
                <br /><br /><br /><br />
                <asp:label id="lblError" runat="server" class="text-danger"/>
            </section>
        </div>
    </div>
</asp:Content>
