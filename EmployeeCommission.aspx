<%@ Page Language="VB" AutoEventWireup="true" %>
<%@ Import Namespace="System.Web.UI.ScriptManager " %>


<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="main.css" rel="stylesheet" type="text/css" />
    <link href="EmployeeReport.css" rel="stylesheet" type="text/css" />
    <script runat="server">
        Protected Sub Page_Load(sender As Object, e As EventArgs)
            'If Session("user") IsNot "employee" Then
            'Response.Redirect("login.aspx")
            'End If
        End Sub


        Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
            Session.RemoveAll()
            Response.Redirect("login.aspx")
        End Sub

        Protected Sub ObjectDataSource1_Selecting(sender As Object, e As ObjectDataSourceSelectingEventArgs)

        End Sub
</script>

    </head>
<body>
    <form id="form1" runat="server">

    
        <div id="logo">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/twoRiversLogo.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
         <div id="logoutbutton">
            <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" Width="50px" ImageUrl="~/logoutbutton1.fw.png" BorderStyle="Outset" OnClick="ImageButton1_Click" />
        </div>
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
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
            <br />  
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="150%" Height="100px">
            <LocalReport ReportPath="Report1.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OnSelecting="ObjectDataSource1_Selecting" SelectMethod="GetData" TypeName="DataSetTableAdapters.DataTable1TableAdapter" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
    </form>
</body>
</html>
