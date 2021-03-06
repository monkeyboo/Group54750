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
        ' If Session("user") IsNot "manager" Then
        'Response.Redirect("login.aspx")
        'End If
    End Sub
    
    'Search Button Event 
    Protected Sub SearchButton_Click(sender As Object, e As EventArgs)
        AvailLabel.Visible = True
        ListView1.Visible = True
        ListView1.DataBind()
        
    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        Session.RemoveAll()
        Response.Redirect("login.aspx")
    End Sub
    
    Protected Sub ListView1_ItemUpdated(sender As Object, e As ListViewUpdatedEventArgs) Handles ListView1.ItemUpdated
        'Indicate whether the update operation succeeded.
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occured. " &
                e.ExceptionHandled = True
            e.KeepInEditMode = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user may have updated that item. " &
                "Please try again."
        Else
            lblError.Text = "Update Successful!"
          
        End If
    End Sub
            
</script>
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Availability</title>
    <link href="Report.css" rel="stylesheet" type="text/css" />

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
            <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" Width="50px" ImageUrl="~/logoutbutton1.fw.png" BorderStyle="Outset" />
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
        <table id="table1" >
            <tr>
                <td class="navButtons">                    
                    <asp:Button ID="SearchButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="Search" Width="150px" OnClick="SearchButton_Click" CausesValidation="False" Font-Bold="True" />
                    <asp:Button ID="printButton0" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="Print" Width="150px" onclientclick="javascript:window.print();" xmlns:asp="#unknown" CausesValidation="False" Font-Bold="True" />
                    <asp:Button ID="homeBT" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="Home" Width="150px" PostBackUrl="~/Default.aspx" CausesValidation="False" Font-Bold="True" />
                </td>
            </tr>
            
         </table>
<!--Search Controls-->
<div id="combo">
         <asp:Label ID="EntNameLabel" runat="server" Font-Size="Medium" Text="Name" Font-Bold="True"></asp:Label>
         <asp:ComboBox ID="ComboBox1" runat="server" AppendDataBoundItems="True" 
              AutoCompleteMode="SuggestAppend" DataSourceID="SqlDataSource4" 
              DataTextField="name" DataValueField="name" MaxLength="0" style="display: inline;" AutoPostBack="True" Width="200px" BackColor="#F3EDE7" ></asp:ComboBox>
</div>       
        
                       <table id="tableErrorMessage">
            <tr>
               <td>
                  <table id="tableErrorMessage2" style="width:100%;">
                      <tr>
                        <td>
                            <asp:Label ID="lblError" runat="server" Forecolor="maroon" EnableViewState="False"
                                CssClass="error" Font-Bold="True"></asp:Label>
                        </td>
                        </tr>
                        </table>
                        </td>
                        </tr>
                        </table>      
        

<!--Details View For Employee Search-->
            <table id="table4">
                    <tr>
                       <td><table id="table5" style="width:100%;">
                            <tr>
                                <td><asp:DetailsView ID="EmpDetails" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="EmpID" DataSourceID="SqlDataSource2" Height="150px" Width="800px" ForeColor="Black" GridLines="None" EnableTheming="False">
                            <AlternatingRowStyle BackColor="#E6D9CC" />
                            <CommandRowStyle BackColor="#A99583" Font-Bold="True" />
                            <EditRowStyle BackColor="#43382E" />
                            <FieldHeaderStyle BackColor="#A99583" Font-Bold="True" />
                            <Fields>
                                <asp:BoundField DataField="EmpID" HeaderText="EmpID" InsertVisible="False" ReadOnly="True" SortExpression="EmpID" />
                                <asp:BoundField DataField="Fname" HeaderText="First Name" SortExpression="Fname" />
                                <asp:BoundField DataField="Lname" HeaderText="Last Name" SortExpression="Lname" />
                                <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" />
                            </Fields>
                            <FooterStyle BackColor="#A99583" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#A99583" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#A99583" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#A99583" />
                        </asp:DetailsView>
                                            </td>
                                        </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="WorkLabel">
                                        <asp:Label ID="AvailLabel" runat="server" Font-Bold="True" Font-Size="Large" Text="Employee's Work Availability" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td><table id="table3" style="width:100%;">
                                        <tr>
                                            <td><asp:ListView ID="ListView1" runat="server" OnItemUpdated="ListView1_ItemUpdated" DataSourceID="SqlDataSource3" DataKeyNames="EmpID">
                                        <AlternatingItemTemplate>
                                            <tr style="background-color:#E6D9CC;">
                                                <td>
                                                    <asp:Button ID="EditButton" runat="server" CausesValidation="true" ValidationGroup="VG1" CommandName="Edit" Text="Edit"  Backcolor="#7A695A" ForeColor="#E6D9CC" width="75px"/>
                                                </td>
                                                <td>
                                                    <asp:Label ID="empidLabel" runat="server" Text='<%# Eval("empid") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="starttimeLabel" runat="server" Text='<%# Eval("starttime") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="endtimeLabel" runat="server" Text='<%# Eval("endtime") %>' />
                                                </td>
                                            </tr>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <tr style="background-color:#43382e;color: #FFFFFF;">
                                                <td>
                                                    <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" ValidationGroup="VG1" CommandName="Update" Text="Update" width="75px" Backcolor="#7A695A" ForeColor="#E6D9CC" />
                                                    <asp:Button ID="CancelButton" runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancel" width="75px" Backcolor="#7A695A" ForeColor="#E6D9CC" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="empidTextBox" runat="server" Text='<%# Bind("empid") %>' ReadOnly="true"/>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' ReadOnly="true" />
                                                </td>
                                                     <td>
                                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource5"   SelectedValue='<%# Bind("starttime")%>'
                                                        AppendDataBoundItems="true" DataTextField="starttime" DataValueField="starttime">
                                                    <asp:ListItem Text="" Value="">none</asp:ListItem>   
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource5"   SelectedValue='<%#  Bind("endtime") %>'
                                                        AppendDataBoundItems="true" DataTextField="endtime" DataValueField="endtime">
                                                    <asp:ListItem Text="" Value="">none</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>

                                        </EditItemTemplate>

                                        <EmptyDataTemplate>
                                            <table id="Table2" runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                                <tr>
                                                </tr>
                                            </table>
                                        </EmptyDataTemplate>
                                        <InsertItemTemplate>
                                            <tr style="">
                                                <td>
                                                    <asp:Button ID="InsertButton" runat="server" ValidationGroup="VG1" CausesValidation="true" CommandName="Insert" Text="Insert" Backcolor="#7A695A" ForeColor="#E6D9CC"/>
                                                    <asp:Button ID="CancelButton" runat="server" CausesValidation="false" CommandName="Cancel" Text="Clear" Backcolor="#7A695A" ForeColor="#E6D9CC"/>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="empidTextBox" runat="server" Text='<%# Bind("empid") %>' />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="starttimeTextBox" ValidationGroup="VG1" runat="server" Text='<%# Bind("starttime") %>' />
                                                    <asp:RegularExpressionValidator ID="starttimeexpression" runat="server" ControlToValidate="starttimeTextBox" ErrorMessage="Format hh:mm AM/PM" ValidationExpression="^(1[0-2]|0[1-9]):[0-5][0-9]\040(AM|am|PM|pm)$" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="endtimeTextBox" runat="server" Text='<%# Bind("endtime") %>' />
                                                </td>
                                            </tr>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <tr style="background-color:#A99583; color: #000000;">
                                                <td>
                                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" Backcolor="#7A695A" ForeColor="#E6D9CC" width="75px" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="empidLabel" runat="server" Text='<%# Eval("empid") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="starttimeLabel" runat="server" Text='<%# Eval("starttime") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="endtimeLabel" runat="server" Text='<%# Eval("endtime") %>' />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <table id="Table6" runat="server">
                                                <tr id="Tr1" runat="server">
                                                    <td id="Td1" runat="server">
                                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #A99583; border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                           <tr id="Tr2" runat="server" style="background-color:#E6D9CC; color: #000000;">
                                                                <th id="Th1" runat="server"></th>
                                                                <th id="Th2" runat="server">EmpID</th>
                                                                <th id="Th3" runat="server">Day</th>
                                                                <th id="Th4" runat="server">Start Time</th>
                                                                <th id="Th5" runat="server">End Time</th>
                                                            </tr>
                                                            <tr id="itemPlaceholder" runat="server">
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr id="Tr3" runat="server">
                                                    <td id="Td2" runat="server" style="text-align: center;background-color:black; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                                                </tr>
                                            </table>
                                        </LayoutTemplate>
                                        <SelectedItemTemplate>
                                            <tr style="background-color:#A99583; font-weight: bold;color: #FFFFFF;">
                                                <td>
                                                    <asp:Button ID="EditButton" runat="server" CausesValidation="true" ValidationGroup="VG1" CommandName="Edit"  Text="Edit" Backcolor="#7A695A" ForeColor="#E6D9CC" width="75px" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="empidLabel" runat="server" Text='<%# Eval("empid") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="starttimeLabel"  runat="server"  Text='<%# Eval("starttime") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="endtimeLabel" runat="server" Text='<%# Eval("endtime") %>' />
                                                </td>
                                            </tr>
                                        </SelectedItemTemplate>
                                    </asp:ListView>
                                </td>
                                </tr>
                                </table>
                                </td>
                                </tr>
                                </table>
                                </div>  
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="VG1" ShowMessageBox="True" ShowSummary="False" />
                                
<!--DataSource 1 For DropDownList Control-->
<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
          <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
              SelectCommand="SELECT (Fname + ' ' + Lname)as name FROM Employees  ORDER BY Fname ASC"></asp:SqlDataSource>
                                          
          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
              SelectCommand="SELECT * FROM [Employees] WHERE (Fname + ' ' + Lname)= @fulllnamedropdown">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="ComboBox1" Name="fulllnamedropdown" PropertyName="SelectedValue" Type="String" />
          </SelectParameters>
          </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
          SelectCommand="SELECT empavil.empid, [description], FORMAT(CAST(starttime AS DATETIME),'hh:mmtt') as starttime, FORMAT(CAST(endtime AS DATETIME),'hh:mmtt') as endtime
                         FROM empavil, employees, [dayofweek]
                         WHERE empavil.empid = employees.empid
                         and empavil.dayid = [dayofweek].dayid
                         and (fname + ' ' + lname) = @fulllnamedropdown" UpdateCommand="UPDATE [EmpAvil] 
                         SET [EmpID] = @EmpID, [DayID] = (select dayid from [dayofweek] where [description] = @description), 
                         [Starttime] = @Starttime, 
                         [Endtime] = @Endtime  
                         WHERE [EmpID] = @EmpID
                         AND [DayID] = (select dayid from [dayofweek] where [description] = @description)">
          <SelectParameters>
          <asp:ControlParameter ControlID="ComboBox1" Name="fulllnamedropdown" PropertyName="SelectedValue" Type="String" />
          </SelectParameters>
              <UpdateParameters>
                  <asp:Parameter Name="EmpID" />
                  <asp:Parameter Name="description" />
                  <asp:Parameter Name="Starttime" />
                  <asp:Parameter Name="Endtime" />
              </UpdateParameters>
          </asp:SqlDataSource>
          <br />
          <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
              SelectCommand="SELECT * FROM [times]"></asp:SqlDataSource>
        <br />
       </form>
 </body>
</html>


        

