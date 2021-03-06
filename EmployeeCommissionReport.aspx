﻿<%@ Page Language="VB" AutoEventWireup="true" %>

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
   
    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs)

    End Sub
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MyDetails</title>
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
                        <asp:Label ID="EntNameLabel" runat="server" Font-Size="X-Large" Text="My Details" Font-Bold="True" Width="350px"></asp:Label>
                    </td>
                </tr>
            </table>


            <table id="table12">
                <tr>
                    <td>

                        <table id="table13" style="width: 100%;">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Start Date" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="StartTextBox" runat="server" AutoComplete="false" AutoPostBack="false" BackColor="#F3EDE7" />
                                    <asp:CalendarExtender ID="StartTextBox_CalendarExtender" runat="server" BehaviorID="StartTextBox_CalendarExtender" TargetControlID="StartTextBox" PopupPosition="BottomRight" />

                                    <asp:Label ID="Label2" runat="server" Text="End Date" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="EndTextBox" runat="server" AutoComplete="false" AutoPostBack="True" BackColor="#F3EDE7" />
                                    <asp:CalendarExtender ID="EndTextbox_CalendarExtender" runat="server" BehaviorID="EndTextBox_CalendarExtender" TargetControlID="EndTextBox" PopupPosition="BottomRight" />

                                    <br />

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <!--Details View For New Customer Insert-->
            <table id="table9">
                <tr>
                    <td>
                        <table id="table6" style="width: 100%;">
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
                                        AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                                        Width="850px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Font-Size="Small" PageSize="25" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                        <AlternatingRowStyle BackColor="#A99583" />
                                        <Columns>
                                            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                                            <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                                            <asp:TemplateField HeaderText="Price" SortExpression="Price">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Price", "{0:c}")%>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Price", "{0:c}")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                                            <asp:TemplateField HeaderText="Total" SortExpression="Total">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Total", "{0:c}")%>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Total", "{0:c}")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
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
                <tr>
                    <td>


                        <asp:FormView ID="CommFormview" runat="server" DataSourceID="SqlDataSource2">
                            <ItemTemplate>
                                <div>
                                    <asp:Label ID="Label4" runat="server" Style="font-weight: 700" Text="Total Commission Earned"></asp:Label>
                                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="true" Text='<%# Eval("Total", "{0:c}")%>'></asp:TextBox>
                                </div>
                            </ItemTemplate>
                        </asp:FormView>

                    </td>
                </tr>
            </table>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
        </div>


        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <!--DataSource 2 For total textbox-->

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>"
            SelectCommand="SELECT  Employees.Fname + ' ' + Employees.Lname AS Name, Items.ItemName AS Item, SalesTicketDetails.UnitPrice AS Price, SalesTicketDetails.qty AS Qty, 
                          (SalesTicketDetails.UnitPrice*(commissionrate/100)) * SalesTicketDetails.qty AS Total
FROM            Employees INNER JOIN
                         SalesTicket ON Employees.EmpID = SalesTicket.EmpID INNER JOIN
                         SalesTicketDetails ON SalesTicket.ticketID = SalesTicketDetails.ticketID INNER JOIN
                         Items ON SalesTicketDetails.itemID = Items.itemID

WHERE        (Employees.EmpID = @empid) and  salesticket.[date] between @start and @end">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="empid" SessionField="id" />
                <asp:ControlParameter ControlID="StartTextBox" Name="start" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="EndTextBox" Name="end" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>"
            SelectCommand="SELECT  sum(  (SalesTicketDetails.UnitPrice*(commissionrate/100)) * SalesTicketDetails.qty) AS Total
                         FROM  Employees INNER JOIN
                         SalesTicket ON Employees.EmpID = SalesTicket.EmpID INNER JOIN
                         SalesTicketDetails ON SalesTicket.ticketID = SalesTicketDetails.ticketID INNER JOIN
                         Items ON SalesTicketDetails.itemID = Items.itemID

WHERE        (Employees.EmpID = @empid) and  salesticket.date between @state and @end
">
            <SelectParameters>
                <asp:SessionParameter Name="empid" SessionField="id" />
                <asp:ControlParameter ControlID="StartTextBox" Name="state" PropertyName="Text" />
                <asp:ControlParameter ControlID="EndTextBox" Name="end" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>


        <br />
        <br />
    </form>
</body>
</html>



