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
  
    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs)

    End Sub
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Manager Commission Report</title>
    <link href="EmployeeReport2.css" rel="stylesheet" type="text/css" />



    </script>
    <style type="text/css">
        header, body, form
        {
            display: block;
        }

        header
        {
            width: 1700px;
            height: 200px;
            background-color: #BE9D80;
        }

        body
        {
            margin: 4em auto;
            width: auto;
            height: auto;
            background-color: #A99583;
            font-family: Verdana, Arial, Helvetica, sans-serif;
        }

        form
        {
            margin: auto;
            width: 1300px;
            height: 1000px;
            border: 3px solid black;
            box-shadow: 4px 4px 6px 0 black;
            background-color: #7a695a;
            font-family: Verdana, Arial, Helvetica, sans-serif;
        }

        .container1
        {
            width: 1300px;
            height: 115px;
            background-color: #43382e;
        }

        .contaier2
        {
            width: 1300px;
            height: auto;
        }

        .container
        {
            width: 1300px;
            height: 115px;
            background-color: #43382e;
        }

        /* the styles for the div tags that divide the page into sections */
        #logo
        {
            float: left;
            padding-left: 30px;
            padding-top: 25px;
        }

        #title
        {
            width: auto;
            padding-top: 35px;
            padding-right: 15px;
            padding-bottom: 10px;
        }

        #logoutbutton
        {
            float: right;
            padding-top: 25px;
            padding-right: 140px;
            padding-bottom: 20px;
        }



        #ListView1_itemPlaceholderContainer
        {
            width: 800px;
            margin: auto auto;
        }

            #ListView1_itemPlaceholderContainer td, #ListView2_itemPlaceholderContainer td
            {
                padding: .5em;
                text-align: left;
            }

        #ListView2_itemPlaceholderContainer
        {
            width: 350px;
        }


        #report
        {
            margin: auto auto;
            text-align: center;
        }




        #total
        {
            margin-left: 400px;
        }
    </style>


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

        <table style="width: 96%; text-align: center;" id="report">

                <tr>
                <td colspan="4">

                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Height="50px" Text="Manager Commission Report" Width="400px"></asp:Label>
                    <br />
                </td>

            </tr>

            <tr>
                <td>

                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                        TargetControlID="StartTextBox" PopupButtonID="StartTextBox">
                    </ajaxToolkit:CalendarExtender>

                </td>

                <td style="text-align: right; padding-right: 15px;">

                    <asp:Label ID="Label2" runat="server" Text="Start Date:" Style="font-weight: 700"></asp:Label>

                    <asp:TextBox ID="StartTextBox" runat="server" AutoPostBack="false" AutoComplete="false" />
                </td>

                <td style="text-align: left;">

                    <asp:Label ID="Label3" runat="server" Text="End Date:" Style="font-weight: 700"></asp:Label>

                    <asp:TextBox ID="EndTextBox" runat="server" AutoPostBack="True" AutoComplete="false" />
                </td>

                    <td>
                                    <asp:Label ID="EntNameLabel" runat="server" Font-Size="X-Large" Text="Commission Reports" Font-Bold="True" Width="350px"></asp:Label>
                </td>
						</tr>

         </table>
               
        <div id="listview1">
            <table style="margin: auto;">
                              <tr>
                                  <td> 
                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource3">
                            <AlternatingItemTemplate>
                                <tr style="background-color: #E6D9CC;">
                                    <td>
                                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total", "{0:c}")%>' />
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                         
                        <table id="table13" style="width: 100%;">
                                      <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Start Date" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="StartTextBox" runat="server" AutoComplete="false" AutoPostBack="false" BackColor="#F3EDE7" />
                                    <asp:CalendarExtender ID="StartTextBox_CalendarExtender" runat="server" BehaviorID="StartTextBox_CalendarExtender" TargetControlID="StartTextBox" PopupPosition="BottomRight" />
                          
                            <ItemTemplate>
                                <tr style="background-color: #A99583; color: #000000;">
                                    <td>
                                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total", "{0:c}")%>' />
                                      </td>
                                  </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #A99583; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr runat="server" style="">
                                                    <th runat="server">Name</th>
                                                    <th runat="server">Total</th>
                                                </tr>
                                                <tr id="itemPlaceholder" runat="server">
                                                </tr>
                                              </table>
                                          </td>
                                      </tr>
                                    <tr runat="server">
                                        <td runat="server" style="text-align: center; background-color: black; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;"></td>
                                    </tr>
                                  </table>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <tr style="background-color: #A99583; font-weight: bold; color: #FFFFFF;">
                                    <td>
                                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total""{0:c}")%>' />
                                    </td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>
                    </td>
                    <td>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">

                            <AlternatingItemTemplate>
                                <tr style="background-color: #E6D9CC;">
                                    <td>
                                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="ItemLabel" runat="server" Text='<%# Eval("Item") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price", "{0:c}")%>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="QtyLabel" runat="server" Text='<%# Eval("Qty") %>' />
                                    </td>
                                    <td>
                        <table id="table6" style="width: 100%;">
                                    <tr>
                                <td>
                                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
                                        AutoGenerateColumns="False" DataSourceID="SqlDataSource3"
                                        Width="600px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                                        CellPadding="4" ForeColor="Black" GridLines="Vertical" Font-Size="Small" PageSize="25" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                        <AlternatingRowStyle BackColor="#A99583" />
                                        <Columns>
                                            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                                            <asp:TemplateField HeaderText="Total" SortExpression="Total">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Total", "{0:c}")%>'></asp:Label>
                                                </EditItemTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #A99583; color: #000000;">
                                    <td>
                                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="ItemLabel" runat="server" Text='<%# Eval("Item") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price", "{0:c}")%>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="QtyLabel" runat="server" Text='<%# Eval("Qty") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total", "{0:c}")%>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #A99583; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr runat="server" style="background-color: #E6D9CC; color: #000000;">
                                                    <th runat="server">Name</th>
                                                    <th runat="server">Item</th>
                                                    <th runat="server">Price</th>
                                                    <th runat="server">Qty</th>
                                                    <th runat="server">Total</th>
                                                </tr>
                                                <tr id="itemPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style="text-align: center; background-color: black; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                                            <asp:DataPager ID="DataPager1" runat="server" PageSize="20">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <tr style="background-color: #A99583; font-weight: bold; color: #FFFFFF;">
                                    <td>
                                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="ItemLabel" runat="server" Text='<%# Eval("Item") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price", "{0:c}")%>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="QtyLabel" runat="server" Text='<%# Eval("Qty") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total","{0:c}") %>' />
                                    </td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>

                        <div id="total">
                            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="Label4" runat="server" Style="font-weight: 700" Text="Total Commission Earned"></asp:Label>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Total", "{0:c}")%>' ReadOnly="true"></asp:TextBox>
      
        
    </div>

                                
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>"
                SelectCommand="


        <!--DataSource 3 For GridView -->
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
            SelectCommand="SELECT Employees.Fname + ' ' + Employees.Lname AS Name, sum(  (SalesTicketDetails.UnitPrice*(commissionrate/100)) * SalesTicketDetails.qty) AS Total
                         FROM Employees INNER JOIN
                         SalesTicket ON Employees.EmpID = SalesTicket.EmpID INNER JOIN
                         SalesTicketDetails ON SalesTicket.ticketID = SalesTicketDetails.ticketID INNER JOIN
                         Items ON SalesTicketDetails.itemID = Items.itemID
where salesticket.date between @state and @end
group by fname, lname
                                                    order by employees.lname

                                                    ">
                <SelectParameters>

                    <asp:ControlParameter ControlID="StartTextBox" Name="state" PropertyName="Text" />
                    <asp:ControlParameter ControlID="EndTextBox" Name="end" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>



        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>"
            SelectCommand="

SELECT        Employees.Fname + ' ' + Employees.Lname AS Name, Items.ItemName AS Item, SalesTicketDetails.UnitPrice AS Price, SalesTicketDetails.qty AS Qty, 
                         (SalesTicketDetails.UnitPrice*(commissionrate/100)) * SalesTicketDetails.qty AS Total
FROM            Employees INNER JOIN
                         SalesTicket ON Employees.EmpID = SalesTicket.EmpID INNER JOIN
                         SalesTicketDetails ON SalesTicket.ticketID = SalesTicketDetails.ticketID INNER JOIN
                         Items ON SalesTicketDetails.itemID = Items.itemID

WHERE        (Employees.EmpID = @empid) and  salesticket.date between @state and @end">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="x" SessionField="user" />
                <asp:SessionParameter DefaultValue="" Name="empid" SessionField="id" />
                <asp:ControlParameter ControlID="StartTextBox" Name="state" PropertyName="Text" />
                <asp:ControlParameter ControlID="EndTextBox" Name="end" PropertyName="Text" />
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
                <asp:ControlParameter ControlID="StartTextBox" Name="state" PropertyName="Text" />
                <asp:ControlParameter ControlID="EndTextBox" Name="end" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
               

        <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajax:ToolkitScriptManager>



    </form>
    </body>
</html>



