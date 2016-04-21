<%@ Page Language="VB" AutoEventWireup="false" CodeFile="schd.aspx.vb" Inherits="schd" %>

>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Web.Services" %>
<%@ Import Namespace="System.Drawing.Printing" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- date dropdown -->
        <asp:TextBox ID="datecombo" runat="server" AutoPostBack="false" AutoComplete="false" />
        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
            TargetControlID="datecombo" PopupButtonID="datecombo">
        </ajaxToolkit:CalendarExtender>

        <!-- combobox for customers -->
        <div id="combo">
            <asp:Label ID="EntNameLabel" runat="server" Font-Size="Medium" Text="Name" Font-Bold="True"></asp:Label>
            <ajax:ComboBox ID="ComboBox1" runat="server" AppendDataBoundItems="True"
                AutoCompleteMode="SuggestAppend" DataSourceID="SqlDataSource1"
                DataTextField="name" DataValueField="custid" MaxLength="0" Style="display: inline;"
                AutoPostBack="True" Width="200px" BackColor="#F3EDE7">
            </ajax:ComboBox>
            <br />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
            SelectCommand="select custid, (fname + ' ' + lname) as name from customers">

        </asp:SqlDataSource>

        <!-- combobox for employees -->
        <div id="Div1">
            <asp:Label ID="Label1" runat="server" Font-Size="Medium" Text="Name" Font-Bold="True"></asp:Label>
            <ajax:ComboBox ID="ComboBox2" runat="server" AppendDataBoundItems="True"
                AutoCompleteMode="SuggestAppend" DataSourceID="SqlDataSource1"
                DataTextField="name" DataValueField="name" MaxLength="0" Style="display: inline;"
                AutoPostBack="True" Width="200px" BackColor="#F3EDE7">
            </ajax:ComboBox>
            <br />
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
        <!-- dropdown for times -->
        <div id="Div2">
            <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text="Name" Font-Bold="True"></asp:Label>
            <ajax:ComboBox ID="ComboBox3" runat="server" AppendDataBoundItems="True"
                AutoCompleteMode="SuggestAppend" DataSourceID="SqlDataSource1"
                DataTextField="name" DataValueField="name" MaxLength="0" Style="display: inline;"
                AutoPostBack="True" Width="200px" BackColor="#F3EDE7">
            </ajax:ComboBox>
            <br />
        </div>

        <!-- dropdown for services -->
        <div id="Div3">
            <asp:Label ID="Label3" runat="server" Font-Size="Medium" Text="Name" Font-Bold="True"></asp:Label>
            <ajax:ComboBox ID="ComboBox4" runat="server" AppendDataBoundItems="True"
                AutoCompleteMode="SuggestAppend" DataSourceID="SqlDataSource1"
                DataTextField="name" DataValueField="name" MaxLength="0" Style="display: inline;"
                AutoPostBack="True" Width="200px" BackColor="#F3EDE7">
            </ajax:ComboBox>
            <br />
        </div>
        <!-- textbox for notes -->
        <div id="Div4">
            <asp:Label ID="Label4" runat="server" Font-Size="Medium" Text="Name" Font-Bold="True"></asp:Label>
            <ajax:ComboBox ID="ComboBox5" runat="server" AppendDataBoundItems="True"
                AutoCompleteMode="SuggestAppend" DataSourceID="SqlDataSource1"
                DataTextField="name" DataValueField="name" MaxLength="0" Style="display: inline;"
                AutoPostBack="True" Width="200px" BackColor="#F3EDE7">
            </ajax:ComboBox>
            <br />
        </div>



        <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajax:ToolkitScriptManager>
    </form>
</body>
</html>
