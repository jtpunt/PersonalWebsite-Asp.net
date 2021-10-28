<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Example1.master" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="Welcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="wrapper">
	<div id="three-column" class="container">
    	<div class="banner">
            <p><br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </p>
   <br />
   </asp:Repeater>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="Email" DataSourceID="SqlDataSource1" Width="1196px">
            <ItemTemplate>
                Here is the information we have on file: <br />
                Email:
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' /> 
                <br />
                Year of Birth:
                <asp:Label ID="YoBLabel" runat="server" Text='<%# Eval("YoB") %>' /></p>
                <br />
                <br />
                </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Student4720ConnectionString %>" SelectCommand="SELECT [Email], [YoB] FROM [User] WHERE ([Email] = @Email)">
            <SelectParameters>
                <asp:SessionParameter Name="Email" SessionField="UserEmail" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
   
            </div>
        </div>
        </div>
</asp:Content>

