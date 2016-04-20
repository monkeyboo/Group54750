﻿<%@ Page Language="VB" AutoEventWireup="false" %>
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

         #ListView1_itemPlaceholderContainer
         {
             width:600px;
         }
             #ListView1_itemPlaceholderContainer td
             {
                 padding:.5em;
                 text-align: left;
             }

     #ListView2_itemPlaceholderContainer
         {
             width:600px;
         }
             #ListView2_itemPlaceholderContainer td
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
     

       <table style="width: 96%; text-align:center;" id="Table1">

                <tr>
                    <td colspan="4">
                        
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" Height="50px" Text="Detailed Payroll" Width="400px"></asp:Label>
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
           
                
              
                        
                        <table style="width:100%;margin-top:10px;">
                            <tr>
                                <td style="width:600px;text-align:center;">
                        <asp:Label runat="server" Text="Commission" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="Employee ID, name" >
                            
                        
                            
                            <AlternatingItemTemplate>
                                <tr style="background-color:#E6D9CC;">
                                    <td>
                                        <asp:Label ID="empidLabel" runat="server" Text='<%# Eval("Employee ID")%>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Name")%>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Total_SalesLabel" runat="server" Text='<%# Eval("[Commission Earned]", "{0:c}")%>' />
                                    </td>
                                   
                                </tr>
                            </AlternatingItemTemplate>
                            
                            <EmptyDataTemplate>
                                <table runat="server" style="margin:auto;">
                                    <tr>
                                        <td>There are no Commissions earned for the selected time period.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>   
                            <ItemTemplate>
                             
                              
                                  
                                        <tr style="background-color:#A99583; color: #000000;">
                                                <td>
                                        <asp:Label ID="empidLabel" runat="server" Text='<%# Eval("Employee ID")%>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Name")%>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Total_SalesLabel" runat="server" Text='<%# Eval("[Commission Earned]", "{0:c}")%>' />
                                    </td>
                                 
                                        </tr>
                                  
                                
                               
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server" style="margin:5px auto;">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="itemPlaceholderContainer" runat="server" border="0" style="width:600px;">
                                                <tr runat="server" style="background-color:#E6D9CC; color: #000000; text-align:center;">
                                                    <th runat="server">Employee ID</th>
                                                    <th runat="server">Name</th>
                                                    <th runat="server">Commission</th>
                                                   
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
                                <td style="width:600px; text-align:center;">
                        
                                           <asp:Label ID="Label1" runat="server" Text="Salary" Font-Bold="True" Font-Size="X-Large" ></asp:Label>
                                    <asp:ListView ID="ListView2" runat="server" DataKeyNames="Employee ID" DataSourceID="SqlDataSource3">
                                        <AlternatingItemTemplate>
                                            <tr style="background-color:#E6D9CC;">
                                                <td>
                                                    <asp:Label ID="Employee_IDLabel" runat="server" Text='<%# Eval("[Employee ID]") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="Salary_EarnedLabel" runat="server" Text='<%# Eval("[Salary Earned]", "{0:c}")%>' />
                                                </td>
                                            </tr>
                                        </AlternatingItemTemplate>
                                        
                                        <EmptyDataTemplate>
                                            <table runat="server" style="margin:auto;">
                                                <tr>
                                                    <td>There is no Salary earned for the selected timeframe.</td>
                                                </tr>
                                            </table>
                                        </EmptyDataTemplate>
                                       
                                        <ItemTemplate>
                                            <tr style="background-color:#A99583; color: #000000;">
                                                <td>
                                                    <asp:Label ID="Employee_IDLabel" runat="server" Text='<%# Eval("[Employee ID]") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="Salary_EarnedLabel" runat="server" Text='<%# Eval("[Salary Earned]", "{0:c}") %>' />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <table runat="server" style="margin:5px auto;">
                                                <tr runat="server">
                                                    <td runat="server">
                                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="width:600px;">
                                                            <tr runat="server" style="background-color:#E6D9CC; color: #000000; text-align:center;">
                                                                <th runat="server">Employee ID</th>
                                                                <th runat="server">Name</th>
                                                                <th runat="server">Salary Earned</th>
                                                            </tr>
                                                            <tr id="itemPlaceholder" runat="server">
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr runat="server">
                                                    <td runat="server" style=""></td>
                                                </tr>
                                            </table>
                                        </LayoutTemplate>
                                        
                                    </asp:ListView>
                        
                                     
                                </td>
                            </tr>
                        </table>
   

                        </td>
</tr>
                              
               
                        
          
       <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
                        SelectCommand="select employees.empid as [Employee ID], 
                        (fname + ' ' + lname) as [Name], 
                        sum((datediff(mi,[timein], [timeout])/60.0)*rateofpay)  as [Salary Earned]
                        from employees, timesheets
                        where employees.empid = timesheets.empid
           and timesheets.date between @startdate and @enddate
                        group by employees.empid, fname, lname">
           <SelectParameters>
                <asp:ControlParameter ControlID="StartTextBox" Name="startdate" PropertyName="Text" />
                <asp:ControlParameter ControlID="EndTextBox" Name="enddate" PropertyName="Text" />
            </SelectParameters>
       </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
            SelectCommand="	select employees.empid as [Employee ID], 
(fname + ' ' + lname) as [Name], 
sum((unitprice)*((employees.commissionrate)/100))  as [Commission Earned]
from employees, salesticketdetails, salesticket
where employees.empid = salesticket.empid and 
		salesticket.ticketid = salesticketdetails.ticketid 

	
		group by employees.empid, fname, lname">
            <SelectParameters>
                <asp:ControlParameter ControlID="StartTextBox" Name="startdate" PropertyName="Text" />
                <asp:ControlParameter ControlID="EndTextBox" Name="enddate" PropertyName="Text" />
            </SelectParameters>

                        </asp:SqlDataSource>
              <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajax:ToolkitScriptManager>
               
    </form>
</body>
</html>