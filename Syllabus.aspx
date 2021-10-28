<%@ Page Title="Syllabus" Language="C#" MasterPageFile="~/Example1.master" AutoEventWireup="true" CodeFile="Syllabus.aspx.cs" Inherits="Syllabus" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="wrapper">
	<div id="three-column" class="container">
    	<div class="banner">
<h2> 
                 <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/classes db.accdb" SelectCommand="SELECT [SyllabusFilePath] FROM [Classes] WHERE ([Class_ID] = ?)">
                 <SelectParameters>
                     <asp:SessionParameter Name="Class_ID" SessionField="ProjectPDF" Type="String" />
                 </SelectParameters>
                    </asp:AccessDataSource>
                 Syllabus
            </h2>
            <embed src="Documents/Syllabus/<%=firstVariable %>" width="814" style="height: 1029px">> 
            </div>
        </div>
 </div>
</asp:Content>
