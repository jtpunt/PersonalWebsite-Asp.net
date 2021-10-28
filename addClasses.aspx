 <%@ Page Title = "Add Classes" Language="C#" MasterPageFile="~/Example1.master" AutoEventWireup="true" CodeFile="addClasses.aspx.cs" Inherits="addClasses" %>

<%@ Register assembly="System.Web.DynamicData, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .entry {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="wrapper">
	<div id="three-column" class="container">
    	<div class="banner"> 

            <h1>Add New Classes</h1>
                <br />
             <p>
                 Please enter the following information:</p><br />

            <label>Class ID</label>
            <asp:TextBox ID="txtClassID" runat="server" Width="150px" MaxLength="9" CssClass="entry"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtClassID"
                    ErrorMessage="Class ID is a required field." CssClass="validator"></asp:RequiredFieldValidator><br /><br />

            <label>Class Name</label>
            <asp:TextBox ID="txtClassName" runat="server" Width="150px" MaxLength="50" CssClass="entry"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtClassName"
                    ErrorMessage="Class name is a required field." CssClass="validator"></asp:RequiredFieldValidator><br /><br />

            <label>Class Description</label>
            <asp:TextBox ID="txtClassDesc" runat="server" Width="330px" MaxLength="1000" CssClass="entry" Height="45px" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtClassDesc"
                    ErrorMessage="Class description is a required field." CssClass="validator"></asp:RequiredFieldValidator><br /><br />

            <label>Semester Taken</label>
            <asp:TextBox ID="txtSemesterTaken" runat="server" Width="150px" MaxLength="50" CssClass="entry"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtSemesterTaken"
                    ErrorMessage="Semester taken is a required field." CssClass="validator"></asp:RequiredFieldValidator><br /><br />

            <label>Syllabus File</label>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br /><br />

            <label>Project File</label>
            <asp:FileUpload ID="FileUpload2" runat="server" />
            <br /><br />

            <label>Professor First Name</label>
            <asp:TextBox ID="txtProfFName" runat="server" Width="130px" MaxLength="25" CssClass="entry" Height="16px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFinalGrade"
                    ErrorMessage="First name is a required field." CssClass="validator"></asp:RequiredFieldValidator><br /><br />

            <label>Professor Last Name</label>
            <asp:TextBox ID="txtProfLName" runat="server" Width="130px" MaxLength="40" CssClass="entry"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFinalGrade"
                    ErrorMessage="Last name is a required field." CssClass="validator"></asp:RequiredFieldValidator><br /><br />

            <label>Final Grade</label>
            <asp:TextBox ID="txtFinalGrade" runat="server" Width="25px" MaxLength="1" CssClass="entry"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtFinalGrade"
                    ErrorMessage="Final grade required." CssClass="validator"></asp:RequiredFieldValidator><br /><br />

            <asp:Button ID="btnSubmit" runat="server" BackColor="#336699" Font-Bold="True"
            Font-Names="Verdana" Font-Size="Large" ForeColor="White" 
            Text="Submit" onclick="btnSubmit_Click" /><br />

            <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Names="Verdana" 
             Font-Size="Medium" ForeColor="#CC0000"></asp:Label>

                </div>
          </div>
    </div>
</asp:Content>