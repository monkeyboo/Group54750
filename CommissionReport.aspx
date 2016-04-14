<%@ Page Language="VB" AutoEventWireup="false"  %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>
<script runat="server">

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)

    End Sub

</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/vbscript">



    </script>
    <style type="text/css">
header, body, form {
	display:block;
}

header {
    width: 1700px;
    height: 200px;
    background-color: #BE9D80 ;
}

body {
   margin: 4em auto;
    width: auto;
    height: 1000px;
	background-color: #A99583;
    font-family: Verdana, Arial, Helvetica, sans-serif;
}
form {
    margin: auto;
    width: 1300px;
    height: 1000px;
    border: 3px solid black;
    box-shadow: 4px 4px 6px 0 black;
	background-color: #7a695a;
    font-family: Verdana, Arial, Helvetica, sans-serif;
}
.container1 {
    width: 1300px;
    height: 115px;
    background-color: #43382e;
}
.contaier2 {
    width: 1300px;
    height: auto;
}
.container {
    width: 1300px;
    height: 115px;
    background-color: #43382e;

}

/* the styles for the div tags that divide the page into sections */
#logo {
    float: left;
    padding-left: 30px;
    padding-top: 25px;
}
#title {
    width: auto;
    padding-top: 35px;
    padding-right: 15px;
    padding-bottom: 10px;
}
#logoutbutton {
    float: right;
    padding-top: 25px;
    padding-right: 140px;
    padding-bottom: 20px;
    }
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container1">

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
   </div> 
     
            <table style="width: 96%;" align="center" id="report">
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Height="50px" Text="Commission Report" Width="400px"></asp:Label>
                        <br />
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="750px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%" BackColor="#43382E" HeaderColor="white" AsyncRendering="true" BorderColor="Black">
            <LocalReport ReportPath="Commission Report.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DataSetTableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="DataSetTableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource></td>
                    
                </tr>
              
               
            </table>
        
    </form>
</body>
</html>
