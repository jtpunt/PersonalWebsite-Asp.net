<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Example1.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="wrapper"> 
        <div id="colorTest">
    <h2>Please Register Now</h2><br />
  
    <h3>First Name:
        <asp:TextBox ID="txtFName" runat="server" Font-Names="Bookman Old Style" Font-Size="Medium"
            Width="250px" BackColor="White"></asp:TextBox>*required
        <asp:RequiredFieldValidator ID="rfvFName" runat="server" ControlToValidate="txtFName"
            ErrorMessage=" (Please enter your full name)"></asp:RequiredFieldValidator>
     <br /><br />
        <h3>Last Name:
        <asp:TextBox ID="txtLName" runat="server" Font-Names="Bookman Old Style" Font-Size="Medium"
            Width="250px" BackColor="White"></asp:TextBox>*required
        <asp:RequiredFieldValidator ID="rfvLName" runat="server" ControlToValidate="txtLName"
            ErrorMessage=" (Please enter your last name)"></asp:RequiredFieldValidator>
     <br /><br />
        Password: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtPassword" runat="server" Font-Names="Bookman Old Style" Font-Size="Medium"
            TextMode="Password" Width="175px"></asp:TextBox>*required
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
            ErrorMessage=" (Please enter your password)"></asp:RequiredFieldValidator>
     <br />
        Confirm Password:
        <asp:TextBox ID="txtPassword2" runat="server" Font-Names="Bookman Old Style" Font-Size="Medium"
            TextMode="Password" Width="175px"></asp:TextBox>*required
        <asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="txtPassword"
            ControlToValidate="txtPassword2" ErrorMessage=" (Passwords do not match)"></asp:CompareValidator>
     <br /><br />
        Email Address:
        <asp:TextBox ID="txtEmail" runat="server" Font-Names="Bookman Old Style" Font-Size="Medium"
            Width="300px"></asp:TextBox>*required
        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
            ErrorMessage=" (Please enter a valid address)" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
     <br /><br />
        Year of Birth: 
        <asp:TextBox ID="txtYear" runat="server" Font-Names="Bookman Old Style" Font-Size="Medium"
            Width="100px"></asp:TextBox>
       <asp:RangeValidator ID="rvYoB" runat="server" ControlToValidate="txtYear" ErrorMessage=" (Must be over 18 years old, or under 112 years old)"
          MaximumValue="1997" MinimumValue= "1903"></asp:RangeValidator>
    </h3>
    
    <br /><br />
        <asp:Button ID="btnSubmit" runat="server" BackColor="#336699" Font-Bold="True"
            Font-Names="Verdana" Font-Size="Large" ForeColor="White" 
        Text="Submit" onclick="btnSubmit_Click" /><br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
            
        ConnectionString="<%$ ConnectionStrings:Student4720ConnectionString %>" InsertCommand="INSERT INTO [User] (Email, Password, FName, LName, YoB) VALUES (@Email, @Password, @FName, @LName, @Yob)"
            OldValuesParameterFormatString="original_{0}" 
        
        ProviderName="<%$ ConnectionStrings:Student4720ConnectionString %>">
            <InsertParameters>
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="FName" Type="String" />
                <asp:Parameter Name="LName" Type="String" />
                <asp:Parameter Name="YoB" />
            </InsertParameters>
        </asp:SqlDataSource>
            </div>
        </div>
</asp:Content>

