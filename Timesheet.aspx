﻿<%@ Page Language="VB" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Web.Services" %>
<%@ Import Namespace="System.Drawing.Printing"%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="asp" %>

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
    <form id="form1" runat="server" defaultfocus="ComboBox1" >
    
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

<!--Top Navigation Buttons-->
        <div id="main" class="container2">

<!--Search Controls-->


           <table id="tableErrorMessage">
            <tr>
               <td>
                  <table id="tableErrorMessage2" style="width:100%;">
                      <tr>
                        <td>
         <asp:Label ID="EntNameLabel" runat="server" Font-Size="X-Large" Text="Timesheet Correction" Font-Bold="True" Width="350px"></asp:Label>
                          </td>
                        </tr>
                        </table>
                        </td>
                        </tr>
                        </table>
<!-- Search Controls -->

             <table style="width: 96%; text-align:center;" id="Table1">

               

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

                         
                       
<!--Details View For Customer Search-->
<!--Grid View To Edit Timesheets-->
           <table id="table9">
            <tr>
               <td>
                  <table id="table6" style="width:100%;">
                      <tr>
                        <td>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
                            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                            Width="800px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                            CellPadding="4" ForeColor="Black" GridLines="Vertical" Font-Size="Small" PageSize="25" AutoGenerateEditButton="True" DataKeyNames="timesheetid">
                            <AlternatingRowStyle BackColor="#A99583" />
                            <Columns>
                                <asp:BoundField DataField="timesheetid" HeaderText="timesheetid" SortExpression="timesheetid" ReadOnly="true" Visible="false" InsertVisible="False">
                                </asp:BoundField>  
                                <asp:BoundField DataField="empid" HeaderText="Employee ID" SortExpression="empid" ReadOnly="true">
                                </asp:BoundField>
                                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" ReadOnly="true">
                                </asp:BoundField>
                                <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date">
                                </asp:BoundField>
                                <asp:BoundField DataField="timein" HeaderText="Clock In" SortExpression="timein"  >
                                </asp:BoundField>
                                <asp:BoundField DataField="timeout" HeaderText="Clock Out" SortExpression="timeout"   >
                                </asp:BoundField>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
            SelectCommand="select timesheetid, timesheets.empid, (fname + ' ' + lname) as name, date, FORMAT(CAST(timein AS DATETIME),'hh:mmtt') as timein, 
            FORMAT(CAST(timeout AS DATETIME),'hh:mmtt') as timeout
             from employees, timesheets where employees.empid = timesheets.empid
and timesheets.date between @startdate and @enddate"
            UpdateCommand="update timesheets set timein = @timein, timeout = @timeout where timesheetid = @timesheetid" >
              <SelectParameters>
                  <asp:ControlParameter ControlID="StartTextBox" Name="startdate" PropertyName="Text" />
                  <asp:ControlParameter ControlID="EndTextBox" Name="enddate" PropertyName="Text" />
              </SelectParameters>
              <UpdateParameters>
                <asp:Parameter Name="timein" Type="datetime" />
                <asp:Parameter Name="timeout" Type="datetime" />
                <asp:Parameter Name="timesheetid" Type="int32" />
             </UpdateParameters>
        </asp:SqlDataSource>
        <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajax:ToolkitScriptManager>
        <br />
        <br />
    </form>
</body>
</html>


        
