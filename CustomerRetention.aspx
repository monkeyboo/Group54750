<%@ Page Language="VB" AutoEventWireup="true" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Web.Services" %>
<%@ Import Namespace="System.Drawing.Printing" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>
<script runat="server">
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        ' If Session("user") IsNot "employee" Then
        'Response.Redirect("login.aspx")
        'End If
    End Sub


    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        Session.RemoveAll()
        Response.Redirect("login.aspx")
    End Sub

</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Customers</title>
    <link href="EmployeeReport2.css" rel="stylesheet" type="text/css" />


</head>
<body>
    <!--Focus cursor to textbox and button-->
    <form id="form1" runat="server" defaultfocus="ComboBox1">

        <!--Page Header Logo-->
        <div class="container1">
           <div id="logo">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/twoRiversLogo.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>

            <!--Logout Button-->
         <div id="logoutbutton">
            <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" Width="50px" ImageUrl="~/logoutbutton1.fw.png" BorderStyle="Outset" OnClick="ImageButton1_Click" />
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
     
        <div id="main" class="container2">

            <!--Search Controls-->
            <table id="tableErrorMessage">
                <tr>
                    <td>
                        <table id="tableErrorMessage2" style="width: 100%;">
                <tr>
                                    <td>
                                    <asp:Label ID="EntNameLabel" runat="server" Font-Size="X-Large" Text="Customer Retention" Font-Bold="True" Width="350px"></asp:Label>
                                    </td>
                                </tr>
                        </table>
                    </td>
                                    </tr>
                                </table>
                              
                                  
            <!--Details View For Customer Search-->
            <!--Details View For New Customer Insert-->
            <table id="table9">
                <tr>
                                            <td>
                        <table id="table6" style="width: 100%;">
                            <tr>
                                            <td>
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                                        AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                                        Width="800px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Font-Size="Small" PageSize="25">
                                        <AlternatingRowStyle BackColor="#A99583" />
                                        <Columns>
                                            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID"></asp:BoundField>
                                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True"></asp:BoundField>
                                            <asp:BoundField DataField="Visits" HeaderText="Visits" SortExpression="Visits" ReadOnly="True"></asp:BoundField>
                                        </Columns>
                                        <FooterStyle BackColor="#43382E" />
                                        <HeaderStyle BackColor="#A99583" Font-Bold="True" ForeColor="Black" Width="10px" />
                                        <PagerStyle BackColor="#E6D9CC" ForeColor="Black" HorizontalAlign="Right" />
                                        <RowStyle BackColor="#E6D9CC" />
                                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                        <SortedAscendingHeaderStyle BackColor="#848384" />
                                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                        <SortedDescendingHeaderStyle BackColor="#575357" />
                                    </asp:GridView>
                                            </td>
                                        </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>

                            
            <!--GridView For View All Customers-->
        </div>
                           
   
        <!--DataSource 1 For DropDownList Control-->
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
              
        <!--DataSource 2 For Both Details View (Customer Report and Insert)-->
               
        <!--DataSource 3 For GridView View All Customers-->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT SALESTICKET.CUSTID as CustomerID, (FNAME + ' ' + LNAME) as Name, COUNT(SALESTICKET.CUSTID) as Visits
FROM SALESTICKET, CUSTOMERS
WHERE SALESTICKET.CUSTID = CUSTOMERS.CUSTID
                    GROUP BY SALESTICKET.CUSTID, FNAME, LNAME"></asp:SqlDataSource>
        <br />
        <br />
    </form>
</body>
</html>
              
               
        
