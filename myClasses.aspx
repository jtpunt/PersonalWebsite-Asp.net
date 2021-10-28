<%@ Page Title = "My Classes" Language="C#" MasterPageFile="~/Example1.master" AutoEventWireup="true" CodeFile="myClasses.aspx.cs" Inherits="myClasses" %>

<%@ Register assembly="System.Web.DynamicData, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="wrapper">
	<div id="three-column" class="container">
    	<div class="banner">  
            <h1>
                View My Classes</h1>
             <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/classes db.accdb" SelectCommand="SELECT [Class_ID] FROM [Classes] ORDER BY [Class_ID]">
                    </asp:AccessDataSource>
                <br />

                    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" DataSourceID="AccessDataSource1" DataTextField="Class_ID" DataValueField="Class_ID" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="0">--Select a Class--</asp:ListItem>
                    </asp:DropDownList>

             <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/classes db.accdb" SelectCommand="SELECT Classes.Class_ID, Classes.Class_Name, Classes.Class_Description, Classes.Semester_Taken, Classes.SyllabusFilePath, Classes.ProjectFile, Classes.FinalGrade, Professors.Prof_FName + '  '  + Professors.Prof_LName AS Professor FROM (Classes INNER JOIN Professors ON Classes.Prof_ID = Professors.Prof_ID) WHERE (Classes.Class_ID = ?)">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="DropDownList1" Name="Class_ID" PropertyName="SelectedValue" Type="String" />
                 </SelectParameters>
                    </asp:AccessDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource2" CellPadding="4" ForeColor="#333333" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" EnableModelValidation="True">
                    <AlternatingRowStyle BackColor="Gainsboro" />
                    <Columns>
                        <asp:BoundField DataField="Class_Name" HeaderText="Class Name" SortExpression="Class_Name" />
                        <asp:BoundField DataField="Class_Description" HeaderText="Description" SortExpression="Class_Description" />
                        <asp:BoundField DataField="Professor" HeaderText="Professor" SortExpression="Professor" ReadOnly="True" />
                        <asp:BoundField DataField="FinalGrade" HeaderText="Final Grade" />
                        <asp:BoundField DataField="Semester_Taken" HeaderText="Semester Taken" SortExpression="Semester_Taken" />
                        <asp:HyperLinkField HeaderText="Syllabus" NavigateUrl="Syllabus.aspx" SortExpression="SyllabusFilePath" Text="View Syllabus" />
                        <asp:HyperLinkField HeaderText="Project" NavigateUrl="Projects.aspx" Text="View Project" InsertVisible="True" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#3CA0CE" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:Button ID="btnUpdate" runat="server" BackColor="#336699" Font-Bold="True"
            Font-Names="Verdana" Font-Size="Large" ForeColor="White" 
            Text="Update Database" onclick="btnSubmit_Click" /><br />
                </div>
          </div>
    </div>
</asp:Content>