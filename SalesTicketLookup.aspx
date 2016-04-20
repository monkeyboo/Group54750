<%@ Page Language="VB" AutoEventWireup="false" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>

<!DOCTYPE html>
<script runat="server">

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)

    End Sub
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
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
            height: 1000px;
            background-color: #A99583;
            font-family: Verdana, Arial, Helvetica, sans-serif;
        }

        form
        {
            margin: auto;
            width: 1300px;
            height: auto;
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
            width: 700px;
        }

            #ListView1_itemPlaceholderContainer td
            {
                padding: .5em;
                text-align: left;
            }

        .auto-style2
        {
            text-align: center;
        }

        th
        {
            text-align: center;
        }

        #totals
        {
            width: 700px;
            margin: auto;
            border: solid black;
        }

            #totals .aligntotals
            {
                text-align: right;
            }

        .textbox
        {
            width: 150px;
            text-align: right;
            background: transparent;
            border: none;
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-weight: 700;
            font-size: 125%;
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


        <table style="width: 96%; text-align: center;" id="Table1">

            <tr>
                <td colspan="4">

                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" Height="50px" Text="Sales Ticket Lookup" Width="400px"></asp:Label>
                    <br />
                </td>

            </tr>

            <tr>
                <td></td>

                <td style="text-align: center; padding-right: 15px;">

                    <asp:Label ID="Label3" runat="server" Text="Ticket ID:" Style="font-weight: 700"></asp:Label>

                    <asp:TextBox ID="ticketIDTXT" runat="server" AutoPostBack="true" AutoComplete="false" />



                </td>

                <td style="text-align: left;"></td>

                <td></td>

            </tr>













        </table>
        <table style="text-align: center; margin: auto;" id="report">
            <tr>
                <td class="auto-style2" style="text-align: right;">

                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="itemid">



                        <AlternatingItemTemplate>
                            <tr style="background-color: #E6D9CC;">
                                <td>
                                    <asp:Label ID="empidLabel" runat="server" Text='<%# Eval("itemid")%>' />
                                </td>
                                <td>
                                    <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("itemname")%>' />
                                </td>
                                <td>
                                    <asp:Label ID="Total_SalesLabel" runat="server" Text='<%# Eval("qty")%>' />
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("unitprice", "{0:c}")%>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Item Total", "{0:c}")%>' />
                                    </td>
                            </tr>
                        </AlternatingItemTemplate>

                        <EmptyDataTemplate>
                            <table id="Table2" runat="server" style="">
                                <tr>
                                    <td>No Products/Services sold for the selected timeframe.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <ItemTemplate>



                            <tr style="background-color: #A99583; color: #000000;">
                                <td>
                                    <asp:Label ID="empidLabel" runat="server" Text='<%# Eval("itemid")%>' />
                                </td>
                                <td>
                                    <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("itemname")%>' />
                                </td>
                                <td>
                                    <asp:Label ID="Total_SalesLabel" runat="server" Text='<%# Eval("qty")%>' />
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("unitprice", "{0:c}")%>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Item Total", "{0:c}")%>' />
                                    </td>
                                </td>
                            </tr>



                        </ItemTemplate>
                        <LayoutTemplate>
                            <table id="Table3" runat="server" style="margin: auto auto;">
                                <tr id="Tr1" runat="server">
                                    <td id="Td1" runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr id="Tr2" runat="server" style="background-color: #E6D9CC; color: #000000;">
                                                <th id="Th1" runat="server">Item ID</th>
                                                <th id="Th2" runat="server">Name</th>
                                                <th id="Th4" runat="server">Qty</th>
                                                <th id="Th5" runat="server">Price</th>
                                                <th id="Th3" runat="server">Item Total</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr id="Tr3" runat="server">
                                    <td id="Td2" runat="server" style="text-align: center; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;"></td>
                                </tr>
                                <tr>
                                </tr>



                            </table>


                            <table style="width: 700px; margin: auto;">
                                <tr>
                                    <td>
                                        <div style="float: right;">
                                            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2">
                                                <ItemTemplate>
                                                    <div>
                                                        <asp:Label ID="Label4" runat="server" Style="" Text="Subtotal"></asp:Label>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Subtotal", "{0:c}")%>' ReadOnly="true" CssClass="textbox"></asp:TextBox>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:FormView>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="float: right;">
                                            <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource3">
                                                <ItemTemplate>
                                                    <div>
                                                        <asp:Label ID="Label1" runat="server" Style="" Text="Discount"></asp:Label>
                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("discount")%>' ReadOnly="true" CssClass="textbox"></asp:TextBox>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:FormView>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="float: right;">
                                            <asp:FormView ID="FormView3" runat="server" DataSourceID="SqlDataSource4">
                                                <ItemTemplate>
                                                    <div>
                                                        <asp:Label ID="Label2" runat="server" Style="" Text="Discount Amount"></asp:Label>
                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("discountamount", "{0:c}")%>' ReadOnly="true" CssClass="textbox"></asp:TextBox>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:FormView>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="float: right;">
                                            <asp:FormView ID="FormView4" runat="server" DataSourceID="SqlDataSource5">
                                                <ItemTemplate>
                                                    <div>
                                                        <asp:Label ID="Label3" runat="server" Style="" Text="Total"></asp:Label>
                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("total", "{0:c}")%>' ReadOnly="true" CssClass="textbox"></asp:TextBox>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:FormView>
                                        </div>
                                    </td>
                                </tr>
                            </table>

                        </LayoutTemplate>

                    </asp:ListView>




                </td>
            </tr>



        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>"
            SelectCommand="select salesticketdetails.itemid, items.itemname, salesticketdetails.qty, salesticketdetails.unitprice, (salesticketdetails.qty*salesticketdetails.unitprice) as [Item Total]
  From salesticketdetails, items
  where items.itemid = salesticketdetails.itemid
and salesticketdetails.ticketid = @ticketid
">
            <SelectParameters>
                <asp:ControlParameter ControlID="ticketIDTXT" Name="ticketid" PropertyName="Text" />
            </SelectParameters>

        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>"
            SelectCommand="select sum((salesticketdetails.qty*salesticketdetails.unitprice)) as subtotal
  from salesticketdetails
  where ticketid = @ticketid">
            <SelectParameters>
                <asp:ControlParameter ControlID="ticketIDTXT" Name="ticketid" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>"
            SelectCommand="   if (select discountid from salesticket where ticketid = @ticketid) is null
                                       select 'No Discount' as discount
                                       if exists(select discountid from salesticket where ticketid = @ticketid) 
                                       select (cast(salesticket.discountid as nvarchar) + ' - ' + discription) as discount 
                                       from salesticket, discounts where salesticket.discountid = discounts.discountid and ticketid = @ticketid">
            <SelectParameters>
                <asp:ControlParameter ControlID="ticketIDTXT" Name="ticketid" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>"
            SelectCommand="   select case
  when (select type from salesticket, discounts where discounts.discountid = salesticket.discountid and salesticket.ticketid = @ticketid) = 1 then
  (select (sum((salesticketdetails.qty*salesticketdetails.unitprice)-discounts.amount)) from salesticketdetails, discounts, salesticket where salesticket.discountid = discounts.discountid and salesticket.ticketid = salesticketdetails.ticketid and salesticketdetails.ticketid = @ticketid)
  when (select type from salesticket, discounts where discounts.discountid = salesticket.discountid and salesticket.ticketid = @ticketid) = 0 then
   (select (sum(salesticketdetails.qty*salesticketdetails.unitprice)-(sum(salesticketdetails.qty*salesticketdetails.unitprice)*sum(discounts.amount/100))) from salesticket, discounts, salesticketdetails where salesticket.discountid = discounts.discountid and salesticket.ticketid = salesticketdetails.ticketid and salesticketdetails.ticketid = @ticketid)
   when (select type from salesticket, discounts where discounts.discountid = salesticket.discountid and salesticket.ticketid = @ticketid) is null then
   (select '$0.00') end as discountamount">
            <SelectParameters>
                <asp:ControlParameter ControlID="ticketIDTXT" Name="ticketid" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>"
            SelectCommand="   select
(select sum((salesticketdetails.qty*salesticketdetails.unitprice)) as subtotal
  from salesticketdetails
  where ticketid = @ticketid)
  -
  (  select case
  when (select type from salesticket, discounts where discounts.discountid = salesticket.discountid and salesticket.ticketid = @ticketid) = 1 then
  (select (sum((salesticketdetails.qty*salesticketdetails.unitprice)-discounts.amount)) from salesticketdetails, discounts, salesticket where salesticket.discountid = discounts.discountid and salesticket.ticketid = salesticketdetails.ticketid and salesticketdetails.ticketid = @ticketid)
  when (select type from salesticket, discounts where discounts.discountid = salesticket.discountid and salesticket.ticketid = @ticketid) = 0 then
   (select (sum(salesticketdetails.qty*salesticketdetails.unitprice)-(sum(salesticketdetails.qty*salesticketdetails.unitprice)*sum(discounts.amount/100))) from salesticket, discounts, salesticketdetails where salesticket.discountid = discounts.discountid and salesticket.ticketid = salesticketdetails.ticketid and salesticketdetails.ticketid = @ticketid)
   when (select type from salesticket, discounts where discounts.discountid = salesticket.discountid and salesticket.ticketid = @ticketid) is null then
   (select '$0.00') end
) as total">
            <SelectParameters>
                <asp:ControlParameter ControlID="ticketIDTXT" Name="ticketid" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
