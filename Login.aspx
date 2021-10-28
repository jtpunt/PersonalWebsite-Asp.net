<%@ Page Title="Login" Language="C#" MasterPageFile="~/Example1.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="wrapper">
	<div id="three-column" class="container">
    	<div class="banner">             
     <h2>Please Login</h2>
     <p>
         <strong>User Name:</strong>
         <asp:TextBox ID="txtUserName" runat="server" Width="200px"></asp:TextBox>
    </p>
    <p>
        <strong>Password: &nbsp;
         <asp:TextBox ID="txtPassword" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
         </strong></p>
    <p> 
         <asp:Button ID="btnSubmit" runat="server" BackColor="#006600" Font-Bold="True" 
             Font-Names="Verdana" Font-Size="Medium" ForeColor="White" 
             onclick="btnSubmit_Click" Text="Submit" />
        <asp:Button ID="btnRegister" runat="server" BackColor="#006600" Font-Bold="True" 
             Font-Names="Verdana" Font-Size="Medium" ForeColor="White" 
             onclick="btnRegister_Click" Text="Register" />
        <asp:Button ID="btnUpdate" runat="server" BackColor="#006600" Font-Bold="True" 
             Font-Names="Verdana" Font-Size="Medium" ForeColor="White" 
             onclick="btnUpdate_Click" Text="Update" />
    </p>
    <p>
         <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Names="Verdana" 
             Font-Size="Medium" ForeColor="#CC0000"></asp:Label>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Student4720ConnectionString %>" SelectCommand="SELECT * FROM [User] WHERE (([Email] = @Email) AND ([Password] = @Password))">
             <SelectParameters>
                 <asp:ControlParameter ControlID="txtUserName" DefaultValue="" Name="Email" PropertyName="Text" />
                 <asp:ControlParameter ControlID="txtPassword" Name="Password" PropertyName="Text" />
             </SelectParameters>
         </asp:SqlDataSource>
         <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
             <series>
                 <asp:Series ChartType="Bar" Name="Series1">
                 </asp:Series>
             </series>
             <chartareas>
                 <asp:ChartArea Name="ChartArea1">
                 </asp:ChartArea>
             </chartareas>
         </asp:Chart>
    </p>
    </div>
          </div>
    </div>
</asp:Content>

