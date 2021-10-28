<%@ Page Title="Projects" Language="C#" MasterPageFile="~/Example1.master" AutoEventWireup="true" CodeFile="Projects.aspx.cs" Inherits="Projects" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="wrapper">
	<div id="three-column" class="container">
    	<div class="banner">
<h2> 
                 <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/classes db.accdb" SelectCommand="SELECT [ProjectFile] FROM [Classes] WHERE ([Class_ID] = ?)">
                 <SelectParameters>
                     <asp:SessionParameter Name="Class_ID" SessionField="ProjectPDF" Type="String" />
                 </SelectParameters>
                    </asp:AccessDataSource>
                 My Project for <%= Session["ProjectPDF"] %>
            </h2>
            <embed src="Documents/Project/<%=firstVariable %>" width="814" style="height: 1029px">> 
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
 </div>
</asp:Content>
