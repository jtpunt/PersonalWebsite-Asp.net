<%@ Page Title="Home" Language="C#" MasterPageFile="~/Example1.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style1 {
        width: 1198px;
        height: 438px;
    }</style></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="wrapper">
	<div id="three-column" class="container">
    	<div class="banner">
<h2> This webpage was originally created for my Web Based Information Systems class 
            <p>at the University of North Texas in Denton</p>
            <p><img class="auto-style1" src="Images/UNTongreen.png" /></p>	</h2>
             <p><asp:Button ID="btnSubmit" runat="server" BackColor="#006600" Font-Bold="True" 
             Font-Names="Verdana" Font-Size="Medium" ForeColor="White" 
             onclick="btnSubmit_Click" Text="Days Until Fall Graduation" /></p>
            <p><asp:Label ID="lblDays" runat="server"></asp:Label></p>
            </div>
        </div>
        </div>

</asp:Content>

