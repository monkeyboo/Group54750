<%@ Page Language="VB" AutoEventWireup="false" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Web.Services" %>
<%@ Import Namespace="System.Drawing.Printing"%>

<!DOCTYPE html>
<script runat="server">
    Protected Sub Page_Load(sender As Object, e As EventArgs)
       
    End Sub
       
   
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Availability</title>
    <link href="Report.css" rel="stylesheet" type="text/css" />

<!--Auto Styles for table cells -->
    <style type="text/css">
        .auto-style60 {
            height: auto;
        }
        .auto-style102 {
            text-align: left;
            width: 735px;
        }
        </style>
</head>
<body>
<!--Focus cursor to textbox and button-->
    <form id="form1" runat="server" defaultfocus="PhoneTextBox" defaultbutton="reportButton">
    
<!--Page Header Logo-->
    <div class="container">
        <div id="logo">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/twoRiversLogo.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    
<!--Logout Button-->
    <div id="logoutbutton">
            <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" Width="50px" ImageUrl="~/logoutbutton1.fw.png" BorderStyle="Outset" />
        </div>

<!--SiteMap-->
        <div id="title">
            <br />
            <asp:SiteMapPath ID="SiteMapPath1" runat="server" Font-Names="Verdana" Font-Size="Large" ForeColor="Black" Font-Bold="True" Font-Italic="False">
                <CurrentNodeStyle ForeColor="#E6D9CC" />
                <NodeStyle Font-Bold="True" ForeColor="#A99583" />
                <PathSeparatorStyle Font-Bold="True" ForeColor="#E6D9CC" />
                <RootNodeStyle Font-Bold="True" ForeColor="#7A695A" />
            </asp:SiteMapPath>
        <br />
        </div>
        </div>

<!--Top Navigation Buttons-->
        <div id="tableId" class="auto-style60">

<!--Search Controls-->

<!--Details View For Customer Search-->
            <table align="center" class="auto-style73">
                <tr>
                    <td class="auto-style102">
                        <asp:Login ID="Login1" runat="server">
                        </asp:Login>
                        <br />
                    </td>                    
                </tr>               
                </table>
        </div>

<!--DataSource 1 For DropDownList Control-->
        <br />
    </form>
</body>
</html>


        

