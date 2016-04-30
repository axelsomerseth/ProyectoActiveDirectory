<%@ Page Title="Administrar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Administrar.aspx.cs" Inherits="ActiveDirectory.Account.Administrar" Async="true" %>

<%@ PreviousPageType VirtualPath="~/Account/Login.aspx" %>

<asp:Content runat="server" ID="BodyContent1" ContentPlaceHolderID="MainContent">


    <h2>Administrar: </h2>
    
    
    <div class="row">
        <div class="col-md-8">
            <section>
                <div class="form-horizontal">
                        <h4>Usuario(s) </h4>
                        <hr />
                        <div class="form-group col-md-10">
                            <asp:DropDownList ID="downListUsuarios" runat="server" Width="357px" Height="20px"></asp:DropDownList>
                        </div>
                </div>
            </section>
        </div>


        <div class="col-md-8">
            <section>
                <div class="form-horizontal">
                        <h4>General </h4>
                        <hr />
                        <div class="form-group">
                            <asp:Label runat="server" CssClass="col-md-2 control-label">Nombre: </asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" id="Nombre2" CssClass="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" CssClass="col-md-2 control-label">Apellido: </asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" id="Apellido2" CssClass="form-control" AutoPostBack="true"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" CssClass="col-md-2 control-label">Nombre para mostrar: </asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" id="Apodo2" CssClass="form-control" AutoPostBack="true" />
                            </div>
                        </div>
                </div>
                <div class="form-group">
                <section >
                    <br /><br /><br />
                    <h4>Miembro de </h4>
                    <hr />
                    <asp:ListBox ID="lstGrupos" runat="server" Width="357px" CssClass="ListBox" Height="123px"></asp:ListBox>
                </section>
            </div>
            </section>

            




            <div class="form-horizontal">
                <br /><br /><br />
                <h4>Cambiar contraseña </h4>
                <hr />
                <asp:ValidationSummary runat="server" CssClass="text-danger" />
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Antigua contraseña</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="OldPassword" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                            CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Nueva contraseña</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                            CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirmar nueva contraseña</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="El campo de confirmación de contraseña es obligatorio." />
                        <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="Las contraseñas no coinciden." />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" OnClick="cambiarContrasenia" Text="Cambiar" CssClass="btn btn-default" Height="40px" Width="142px" Font-Size="Medium" style="font-weight: bold"/>
                    </div>
                </div>
                <div class="form-group col-md-10">
                    <asp:Label runat="server" CssClass="">*Es necesario que la contraseña tenga más de 8 caracteres y que contenga al menos un número y un símbolo.</asp:Label>
                    <section style="font-weight: bolder; font-size: large">
                        <br /><br /><br /><br />
                        <asp:label id="lblErrorPassword" runat="server" class="text-danger"/>
                    </section>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
