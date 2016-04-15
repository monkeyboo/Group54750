<%@ Page Language="VB" AutoEventWireup="false"  %>


<!DOCTYPE html>
<script runat="server">

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        Session.RemoveAll()
        Response.Redirect("login.aspx")
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs)

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

      #ListView1_itemPlaceholderContainer
         {
             width:1000px;
             margin:auto auto;
         }
             #ListView1_itemPlaceholderContainer td
             {
                 padding:.5em;
                 text-align: left;
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
     
            <table style="margin:auto auto;margin-left:150px;" id="report">
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Height="50px" Text="Commission Report" Width="400px"></asp:Label>
                        <br />
                        </td>
                    
						</tr>
                <tr>
                    <td class="auto-style1">
               
                       <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
						
                            <AlternatingItemTemplate>
                                <tr style="background-color:#E6D9CC;">
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
                            </AlternatingItemTemplate>
                     
                            <EmptyDataTemplate>
                                <table runat="server" style="">
                                    <tr>
                                        <td>No data was returned.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                           
                            <ItemTemplate>
                                <tr style="background-color:#A99583; color: #000000;">
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
                                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #A99583; border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr runat="server" style="background-color:#E6D9CC; color: #000000;">
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
                                        <td runat="server" style="text-align: center;background-color:black; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <tr style="background-color:#A99583; font-weight: bold;color: #FFFFFF;">
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
                    
                        </td>
                    
						</tr>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="if (@x = 'employee')
begin

SELECT        Employees.Fname + ' ' + Employees.Lname AS Name, Items.ItemName AS Item, SalesTicketDetails.UnitPrice AS Price, SalesTicketDetails.qty AS Qty, 
                         SalesTicketDetails.UnitPrice * SalesTicketDetails.qty AS Total
FROM            Employees INNER JOIN
                         SalesTicket ON Employees.EmpID = SalesTicket.EmpID INNER JOIN
                         SalesTicketDetails ON SalesTicket.ticketID = SalesTicketDetails.ticketID INNER JOIN
                         Items ON SalesTicketDetails.itemID = Items.itemID
WHERE        (Employees.EmpID = @empid)

end
if (@x = 'manager')
begin
SELECT        Employees.Fname + ' ' + Employees.Lname AS Name, Items.ItemName AS Item, SalesTicketDetails.UnitPrice AS Price, SalesTicketDetails.qty AS Qty, 
                         SalesTicketDetails.UnitPrice * SalesTicketDetails.qty AS Total
FROM            Employees INNER JOIN
                         SalesTicket ON Employees.EmpID = SalesTicket.EmpID INNER JOIN
                         SalesTicketDetails ON SalesTicket.ticketID = SalesTicketDetails.ticketID INNER JOIN
                         Items ON SalesTicketDetails.itemID = Items.itemID
end">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="" Name="x" SessionField="user" />
                                <asp:SessionParameter DefaultValue="" Name="empid" SessionField="id" />
                            </SelectParameters>
                        </asp:SqlDataSource>
              
               
         </table>
        
    </form>
</body>
</html>
