<%@ Page Language="VB" AutoEventWireup="false" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>

<!DOCTYPE html>
<script runat="server">

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)

    End Sub
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
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
    height: 1200px;
	background-color: #A99583;
    font-family: Verdana, Arial, Helvetica, sans-serif;
}
form {
    margin: auto;
    width: 1300px;
    height: auto;
    padding-bottom:1.5em;
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

         #ListView1_itemPlaceholderContainer
         {
             width:700px;
         }
             #ListView1_itemPlaceholderContainer td
             {
                 padding:.5em;
                 text-align:right;
             }
         .auto-style2 {
             text-align: center;
         }

         th
         {
             text-align:center;
         }

         #total
         {
             margin-left:425px;
         }
         </style>

   


</head>
<body>
   <form id="form2" runat="server">
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
     
                     
      
       <table style="width: 96%; text-align:center;" id="Table1">

                <tr>
                    <td colspan="4">
                        
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" Height="50px" Text="Sales Report" Width="400px"></asp:Label>
                        <br />
                </td>
                    
						</tr>

                <tr>
                    <td >
                        
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                            TargetControlID="StartTextBox" PopupButtonID="StartTextBox">
                        </ajaxToolkit:CalendarExtender> 

                </td>
                    
                    <td style="text-align:right; padding-right:15px;">
                        
                        <asp:Label ID="Label3" runat="server" Text="Start Date:" style="font-weight: 700"></asp:Label>
                        
                        <asp:TextBox ID="StartTextBox" runat="server"  AutoPostBack="false" AutoComplete="false"/>

                                      
                    
                </td>
                    
                    <td  style="text-align:left;">
                        
                         <asp:Label ID="Label4" runat="server" Text="End Date:" style="font-weight: 700"></asp:Label>
                        
                         <asp:TextBox ID="EndTextBox" runat="server"  AutoPostBack="True" AutoComplete="false"/>
                </td>
                    
                    <td>
                        
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server"
                            TargetControlID="EndTextBox" PopupButtonID="EndTextBox">
                        </ajaxToolkit:CalendarExtender> 
                </td>
                    
						</tr>
                                  
                
           
                    
               
          
                    
                        
                    
					
                  
                
               
         </table>
            <table style="text-align:center; margin:auto;" id="report">
                <tr>
                    <td class="auto-style2" style="text-align:right;">
                        
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="ticketid" >
                            
                          
                            
                            <AlternatingItemTemplate>
                                <tr style="background-color:#E6D9CC;">
                                    <td>
                                        <asp:Label ID="empidLabel" runat="server" Text='<%# Eval("ticketid")%>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("total", "{0:c}")%>' />
                                    </td>
                                    
                                </tr>
                            </AlternatingItemTemplate>
                            
                            <EmptyDataTemplate>
                                <table id="Table2" runat="server" style="">
                                    <tr>
                                        <td>No data was returned.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>   
                            <ItemTemplate>
                             
                              
                                  
                                        <tr style="background-color:#A99583; color: #000000;">
                                            <td>
                                                <asp:Label ID="empidLabel" runat="server" Text='<%# Eval("ticketid")%>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("total", "{0:c}")%>' />
                                            </td>
                                          
                                        </tr>
                                  
                                
                               
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table id="Table3" runat="server" style="margin:auto auto;">
                                    <tr id="Tr1" runat="server">
                                        <td id="Td1" runat="server">
                                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                                <tr id="Tr2" runat="server" style="background-color:#E6D9CC; color: #000000;">
                                                    <th id="Th1" runat="server">Ticket ID</th>
                                                    <th id="Th2" runat="server">Total</th>
                                                   
                                                </tr>
                                                <tr id="itemPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr id="Tr3" runat="server">
                                        <td id="Td2" runat="server" style="text-align: center; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="20">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                        </asp:ListView>
   
  <div id="total">   <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource2">
        <ItemTemplate>
        <div>
    <asp:Label ID="Label4" runat="server" style="font-weight: 700" Text="Total Sales:"></asp:Label>
             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Total", "{0:c}")%>' ReadOnly="true"></asp:TextBox>
      
        
    </div>
        </ItemTemplate>
        </asp:FormView>
              </div>
              
            
                    
               </td>
</tr>
              
             
                        
            </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
            SelectCommand="select salesticketdetails.ticketid, 
sum (
case when salesticket.discountid is null then unitprice*qty
	when salesticket.discountid is not null and type = 0 then (unitprice*qty)-((unitprice*qty)*(discounts.amount/100))
	when salesticket.discountid is not null and type = 1 then (unitprice*qty)-amount


	end ) as Total
from salesticketdetails, discounts, salesticket
where salesticketdetails.ticketid = salesticket.ticketid and salesticket.discountid = discounts.discountid
and salesticket.date between @start and @end
group by salesticketdetails.ticketid
">
            <SelectParameters>
                <asp:ControlParameter ControlID="StartTextBox" Name="start" PropertyName="Text" />
                <asp:ControlParameter ControlID="EndTextBox" Name="end" PropertyName="Text" />
            </SelectParameters>

                        </asp:SqlDataSource>
              <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajax:ToolkitScriptManager>
               
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="select  
sum (
case when salesticket.discountid is null then unitprice*qty
	when salesticket.discountid is not null and type = 0 then (unitprice*qty)-((unitprice*qty)*(discounts.amount/100))
	when salesticket.discountid is not null and type = 1 then (unitprice*qty)-amount


	end ) as [Total]
from salesticketdetails, discounts, salesticket
where salesticketdetails.ticketid = salesticket.ticketid and salesticket.discountid = discounts.discountid
and salesticket.date between @start and @end
">
           <SelectParameters>
               <asp:ControlParameter ControlID="StartTextBox" Name="start" PropertyName="Text" />
               <asp:ControlParameter ControlID="EndTextBox" Name="end" PropertyName="Text" />
           </SelectParameters>
       </asp:SqlDataSource>
               
    </form>
</body>
</html>
