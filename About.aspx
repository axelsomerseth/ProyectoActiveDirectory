<%@ Page Title="Acerca de" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ActiveDirectory.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>&nbsp;</h2>
    <h1><%: Title %>:</h1>
     <section class="h3 strong">
        <p>Este es un sitio web que se conecta a un Active Directory Domain Services por medio del protocolo LDAP. </p>
        <p>El sitio fue construido con tecnología ASP .NET .</p>
        <p>Proyecto de la clase Sistemas Operativos II, sección 1500, Ingeniería en Sistemas, UNAH CU. I PAC 2016.</p>
    </section>
    <div style="text-align: center">
         <asp:Image ID="Image1" runat="server" ImageUrl="is-unah.jpg" CssClass="img-responsive"/>
    </div>
   
    
</asp:Content>
