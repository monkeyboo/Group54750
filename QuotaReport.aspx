<%@ Page Language="VB" AutoEventWireup="false" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

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
             width:700px;
         }
             #ListView1_itemPlaceholderContainer td
             {
                 padding:.5em;
                 text-align: left;
             }
         .auto-style2 {
             text-align: center;
         }
         .auto-style3 {
             width: 317px;
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
     
            <table style="text-align:center; margin:auto auto;" id="report">
                <tr>
                    <td class="auto-style1" colspan="4">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Height="50px" Text="Quota Report" Width="400px"></asp:Label>
                        <br />
                        </td>
</tr>
                <tr>
                    <td class="auto-style2" style="text-align:right;">
                        &nbsp;</td>
                    <td class="auto-style2" style="text-align:right;">
                        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                        </td>
                    <td class="auto-style2" style="text-align:right;">
                        <asp:Calendar ID="Calendar2" runat="server" DataSourceID="SqlDataSource3" DataTextField="enddate" DataValueField="enddate"></asp:Calendar>
                        </td>
                    <td class="auto-style1" style="text-align:left;">
                        &nbsp;</td>
</tr>
                <tr>
                    <td class="auto-style2" style="text-align:right;" colspan="3">
                        
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="empid" >
                            
                          
                            
                            <AlternatingItemTemplate>
                                <tr style="background-color:#E6D9CC;">
                                    <td>
                                        <asp:Label ID="empidLabel" runat="server" Text='<%# Eval("empid") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Total_SalesLabel" runat="server" Text='<%# Eval("[Total Sales]", "{0:c}")%>' />
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
                                                <asp:Label ID="empidLabel" runat="server" Text='<%# Eval("empid") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="Total_SalesLabel" runat="server" Text='<%# Eval("[Total Sales]", "{0:c}")%>' />
                                            </td>
                                        </tr>
                                  
                                
                               
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server" style="margin:auto auto;">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                                <tr runat="server" style="background-color:#E6D9CC; color: #000000;">
                                                    <th runat="server">Employee ID</th>
                                                    <th runat="server">Name</th>
                                                    <th runat="server">Total Sales</th>
                                                </tr>
                                                <tr id="itemPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style="text-align: center; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                        </asp:ListView>
   

                        </td>
                    <td class="auto-style1" style="text-align:left;">
                        &nbsp;</td>
</tr>
                              
               
                        
            </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
            SelectCommand="select employees.empid,
(employees.fname + ' ' + employees.lname),
sum(unitprice*qty) as [Total Sales]
from employees, salesticketdetails, salesticket, items
where employees.empid = salesticket.empid
and salesticket.ticketid = salesticketdetails.ticketid
and salesticketdetails.itemid = items.itemid
and salesticket.date between @start and @end
group by employees.empid, fname, lname">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="start" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="Calendar2" Name="end" PropertyName="SelectedDate" />
            </SelectParameters>

                        </asp:SqlDataSource>
              
               
       <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
        
       <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="

if datename(dw, @startdate) = 'Monday'
set @startdate =dateadd(d, -1, @startdate)

if datename(dw, @startdate) = 'Tuesday'
set @startdate =dateadd(d, -2, @startdate)

if datename(dw, @startdate) = 'Wednesday'
set @startdate= dateadd(d, -3, @startdate)

if datename(dw, @startdate) = 'Thursday'
set @startdate =dateadd(d, -4, @startdate)

if datename(dw, @startdate) = 'Friday'
set @startdate =dateadd(d, -5, @startdate)

if datename(dw, @startdate) = 'Saturday'
set @startdate =dateadd(d, -6, @startdate)

select dateadd(d,6,@startdate) as enddate">
           <SelectParameters>
               <asp:ControlParameter ControlID="Calendar1" Name="startdate" PropertyName="SelectedDate" />
           </SelectParameters>
       </asp:SqlDataSource>
        
    </form>
</body>
</html>
