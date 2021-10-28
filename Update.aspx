<%@ Page Title="Update" Language="C#" MasterPageFile="~/Example1.master" AutoEventWireup="true" CodeFile="Update.aspx.cs" Inherits="Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="wrapper">
	<div id="three-column" class="container">
    	<div class="banner">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Student4720ConnectionString %>"
           SelectCommand="SELECT Email, Password, FName, LName, YoB FROM [User] WHERE (Email = @Email)"
            UpdateCommand="UPDATE [User] SET Password = @Password, FName = @FName, LName = @LName, YoB = @YoB WHERE (Email = @Email)" 
            DeleteCommand="DELETE FROM [User] WHERE (Email = @Email)" 
            InsertCommand="INSERT INTO [User](Email, Password, FName, LName, YoB) VALUES (@Email, @Password, @FName, @LName, @YoB)">
            <UpdateParameters>
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="FName" Type="String" />
                <asp:Parameter Name="LName" Type="String" />
                <asp:Parameter Name="YoB" Type="Int32" />
                <asp:Parameter Name="Email" Type="String" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="Email" QueryStringField="Email" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Email" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Email" />
                <asp:Parameter Name="Password" />
                <asp:Parameter Name="FName" />
                <asp:Parameter Name="LName" />
                <asp:Parameter Name="YoB" />
            </InsertParameters>
        </asp:SqlDataSource>
    <br />
    <strong>Please Change Your Information
        Now.<br />Current Values Appear Above Entry Boxes. <br />
        <br />
    </strong>First Name: &nbsp;<asp:Label ID="lblFirstName"
        runat="server" Font-Names="Verdana" Font-Size="14pt"></asp:Label><br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:TextBox ID="txtFName" runat="server" BackColor="White" Font-Names="Bookman Old Style"
            Font-Size="Medium" Width="250px"></asp:TextBox><br />
        <br />
        Last Name: &nbsp;
        <asp:Label ID="lblLastName" runat="server" Font-Names="Verdana" Font-Size="14pt"></asp:Label><br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:TextBox ID="txtLName" runat="server" Font-Names="Bookman Old Style" Font-Size="Medium"
            Width="250px"></asp:TextBox><br />
        <br />
        Password: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="lblPassword" runat="server" Font-Names="Verdana" Font-Size="14pt" Visible="False"></asp:Label><br />
        New Password: &nbsp; &nbsp; &nbsp;
        <asp:TextBox ID="txtPassword" runat="server" Font-Names="Bookman Old Style" Font-Size="Medium"
            TextMode="Password" Width="175px"></asp:TextBox><br />
        Confirm Password:&nbsp;
        <asp:TextBox ID="txtPass2" runat="server" Font-Names="Bookman Old Style" Font-Size="Medium"
            TextMode="Password" Width="175px"></asp:TextBox><br />
        <br />
        Email Address:&nbsp;
        <asp:Label ID="lblEmail" runat="server" Font-Names="Verdana" Font-Size="14pt" Width="250px"></asp:Label><br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:TextBox ID="txtEmail" runat="server" Font-Names="Bookman Old Style" Font-Size="Medium"
            Width="300px"></asp:TextBox><br />
        <br />
        Year of Birth: &nbsp;
        <asp:Label ID="lblYoB" runat="server" Font-Names="Verdana" Font-Size="14pt"></asp:Label><br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:TextBox ID="txtYear" runat="server" Font-Names="Bookman Old Style" Font-Size="Medium"
            Width="100px"></asp:TextBox><br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Button ID="btnSubmit" runat="server" BackColor="#000066" Font-Bold="True"
            Font-Names="Verdana" Font-Size="Large" ForeColor="White" Text="Submit" 
            onclick="btnSubmit_Click" /><br />
        <br />
        &nbsp;<br />
              </div>
          </div>
    </div>
</asp:Content>

