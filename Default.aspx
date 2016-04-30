<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ActiveDirectory._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Proyecto Sistemas Operativos II</h1>
        <p class="lead">Bienvenido a la página de inicio de este sitio.</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>AWS</h2>
            <p>
                Esta aplicación está alojada en un servidor de Amazon Web Services.</p>
        </div>
        <div class="col-md-4">
            <h2>LDAP</h2>
            <p>
                Se conecta a Active Directory utilizando el Protocolo LDAP.
            </p>
        </div>
        <div class="col-md-4">
            <h2>ASP .NET</h2>
            <p>
                Está hecha con tecnología ASP .NET por medio del lenguaje C#.</p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
