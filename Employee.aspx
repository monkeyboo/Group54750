<%@ Page Language="VB" AutoEventWireup="true" %>
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
    
    'New Report Button Event
    Protected Sub reportButton_Click(sender As Object, e As EventArgs)
        EmpDetails.Visible = True
        EmpDetails0.Visible = False
        GridView1.Visible = False
        ComboBox1.Visible = True
        EntNameLabel.Visible = True
        GridView1.DataBind()
    End Sub
    
    'View All Customers Button Event
    Protected Sub viewAllButton_Click(sender As Object, e As EventArgs)
        GridView1.Visible = True
        EmpDetails.Visible = False
        EmpDetails0.Visible = False
        ComboBox1.Visible = False
        EntNameLabel.Visible = False
        GridView1.DataBind()
    End Sub
    
    'New Customer Button Event
    Protected Sub NewCustBT_Click(sender As Object, e As EventArgs)
        EmpDetails0.Visible = True
        EmpDetails.Visible = False
        GridView1.Visible = False
        ComboBox1.Visible = False
        EntNameLabel.Visible = False
        GridView1.DataBind()
        
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs)

    End Sub
  
    Protected Sub EmpDetails0_PageIndexChanging(sender As Object, e As DetailsViewPageEventArgs)

    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        Session.RemoveAll()
        Response.Redirect("login.aspx")
    End Sub

    Protected Sub EmpDetails_ItemUpdated(sender As Object, e As DetailsViewUpdatedEventArgs) Handles EmpDetails.ItemUpdated
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

    Protected Sub EmpDetails0_ItemInserted(sender As Object, e As DetailsViewInsertedEventArgs) Handles EmpDetails0.ItemInserted
        'Indicate whether the update operation succeeded.
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occured. " &
                e.ExceptionHandled = True
            e.KeepInInsertMode = True
        Else
            lblError.Text = "Insert Successful!"
          
        End If

    End Sub

    Protected Sub SqlDataSource3_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs)

    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Employees</title>
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
        <table id="table1" >
            <tr>
                <td class="navButtons">                   
                    <asp:Button ID="reportButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="Search" Width="150px" OnClick="reportButton_Click" CausesValidation="False" Font-Bold="True" />
                    <asp:Button ID="viewAllButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="*View All" Width="150px" OnClick="viewAllButton_Click" Font-Bold="True" Font-Size="Small" Font-Underline="False" CausesValidation="False" />
                    <asp:Button ID="NewEmpBT" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="New Employee" Width="150px" OnClick="NewCustBT_Click" CausesValidation="False" Font-Bold="True" />
                    <asp:Button ID="AvailabilityBT" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="Availability" Width="150px" PostBackUrl="~/Availability.aspx" CausesValidation="False" Font-Bold="True" />
                    <asp:Button ID="printButton0" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="Print" Width="150px" onclientclick="javascript:window.print();" xmlns:asp="#unknown" CausesValidation="False" Font-Bold="True" />
                    <asp:Button ID="homeBT" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="Home" Width="150px" PostBackUrl="~/Default.aspx" CausesValidation="False" Font-Bold="True" />
                    <br />
                </td>
            </tr>
         </table>

<!--Search Controls-->
<div id="combo">
         <asp:Label ID="EntNameLabel" runat="server" Font-Size="Small" Text="Name" Font-Bold="True"></asp:Label>
         <asp:ComboBox ID="ComboBox1" runat="server" AppendDataBoundItems="True" 
              AutoCompleteMode="SuggestAppend" DataSourceID="SqlDataSource1" 
              DataTextField="name" DataValueField="name" MaxLength="0" style="display: inline;" AutoPostBack="True" Width="200px" BackColor="#F3EDE7" ></asp:ComboBox>
</div>       
        

           <table id="tableErrorMessage">
            <tr>
               <td>
                  <table id="tableErrorMessage2" style="width:100%;">
                      <tr>
                        <td>
                            <asp:Label ID="lblError" runat="server" EnableViewState="False"
                                CssClass="error" Font-Bold="True"></asp:Label>
                        </td>
                        </tr>
                        </table>
                        </td>
                        </tr>
                        </table>
                         
                       
<!--Details View For Employee Search-->
         <table id="table10">
            <tr>
               <td>
                  <table id="table5" style="width:100%;">
                      <tr>
                        <td>
                            <asp:DetailsView ID="EmpDetails" runat="server" ItemUpdated="EmpDetails_ItemUpdated" AutoGenerateRows="False" CellPadding="3" DataKeyNames="EmpID" DataSourceID="SqlDataSource2" Height="50px" Width="800px" ForeColor="Black" GridLines="None">
                            <AlternatingRowStyle BackColor="#E6D9CC" />
                            <CommandRowStyle BackColor="#A99583" Font-Bold="True" />
                            <EditRowStyle BackColor="#43382E" />
                            <FieldHeaderStyle BackColor="#A99583" Font-Bold="True" Width="300px" />
                            <Fields>
                                <asp:BoundField DataField="EmpID" HeaderText="EmpID" InsertVisible="False" ReadOnly="True" SortExpression="EmpID" >
                                <ControlStyle Width="300px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="First Name" SortExpression="Fname">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Fname" runat="server" ValidationGroup="VG1" Text='<%# Bind("Fname") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="FnameValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Fname" ForeColor="#CC3300"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="Fname" runat="server" ValidationGroup="VG1" Text='<%# Bind("Fname") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="FnameValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Fname" ForeColor="#CC3300"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Fname") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="300px" />
                                    <ItemStyle Width="500px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Last Name" SortExpression="Lname">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Lname" runat="server" ValidationGroup="VG1" Text='<%# Bind("Lname") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="LnameValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Lname" ForeColor="#CC3300"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="Lname" runat="server" ValidationGroup="VG1" Text='<%# Bind("Lname") %>'></asp:TextBox>
                                         <asp:RequiredFieldValidator runat="server" ID="LnameValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Lname" ForeColor="#CC3300"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Lname") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Street" SortExpression="Street">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Street" runat="server" ValidationGroup="VG1" Text='<%# Bind("Street") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="StreetValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Street" ForeColor="#CC3300"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="Street" runat="server" ValidationGroup="VG1" Text='<%# Bind("Street") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="StreetValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Street" ForeColor="#CC3300"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Street") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="City" SortExpression="city">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="city" runat="server" ValidationGroup="VG1" Text='<%# Bind("city") %>'></asp:TextBox>
                                          <asp:RequiredFieldValidator runat="server" ID="cityValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="city" ForeColor="#CC3300"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="city" runat="server" ValidationGroup="VG1" Text='<%# Bind("city") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="cityValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="city" ForeColor="#CC3300"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="State" SortExpression="state">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="StateDropDownList" runat="server" 
                                                      Text='<%# Bind("State") %>' DataSourceID="SqlDataSource6" DataTextField="state" DataValueField="state" Width="100px" />
                                                      <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT [state] FROM [statelist] ORDER BY [state]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="StateDropDownList" runat="server" 
                                                      Text='<%# Bind("State") %>' DataSourceID="SqlDataSource6" DataTextField="state" DataValueField="state" Width="100px" />
                                                      <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT [state] FROM [statelist] ORDER BY [state]"></asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Zip" SortExpression="zip">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Zip" runat="server" ValidationGroup="VG1" Text='<%# Bind("zip") %>'></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="Zip_TextBoxWatermarkExtender" runat="server" BehaviorID="Zip_TextBoxWatermarkExtender" TargetControlID="Zip" ViewStateMode="Enabled" WatermarkText="00000" />
                                        <asp:RequiredFieldValidator runat="server" ID="ZipValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Zip" ForeColor="#CC3300"/>
                                        <asp:RegularExpressionValidator ID="zipExpressionValidator" runat="server" ControlToValidate="Zip" Font-size="Small" ErrorMessage="5-Digit" ValidationExpression="\d{5}?" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="Zip" runat="server" ValidationGroup="VG1" Text='<%# Bind("zip") %>'></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="Zip_TextBoxWatermarkExtender" runat="server" BehaviorID="Zip_TextBoxWatermarkExtender" TargetControlID="Zip" ViewStateMode="Enabled" WatermarkText="00000" />
                                        <asp:RequiredFieldValidator runat="server" ID="ZipValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Zip" ForeColor="#CC3300"/>
                                        <asp:RegularExpressionValidator ID="zipExpressionValidator" runat="server" ControlToValidate="Zip" Font-size="Small" ErrorMessage="5-Digit" ValidationExpression="\d{5}?" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("zip") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Phone" SortExpression="phone">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Phone" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="Phone_TextBoxWatermarkExtender" runat="server" BehaviorID="Phone_TextBoxWatermarkExtender" TargetControlID="Phone" ViewStateMode="Enabled" WatermarkText="000-000-0000" />
                                        <asp:RegularExpressionValidator ID="phoneExpressionValidator" runat="server" ControlToValidate="Phone" Font-size="Small" ErrorMessage="Format 000-000-0000" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="Phone" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="Phone_TextBoxWatermarkExtender" runat="server" BehaviorID="Phone_TextBoxWatermarkExtender" TargetControlID="Phone" ViewStateMode="Enabled" WatermarkText="000-000-0000" />
                                        <asp:RegularExpressionValidator ID="phoneExpressionValidator" runat="server" ControlToValidate="Phone" Font-size="Small" ErrorMessage="Format 000-000-0000" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("phone") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Password" SortExpression="password">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Password" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="PasswordValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Password" ForeColor="#CC3300"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="Password" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="PasswordValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Password" ForeColor="#CC3300"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="JobTitleID" SortExpression="JobTitleID">
                                    <EditItemTemplate>
                                            <asp:DropDownList ID="JobTitleDD" runat="server" Text='<%# Bind("JobTitleID")%>' 
                                                        DataSourceID="SqlDataSource5" DataTextField="Description" DataValueField="JobTitleID" width="75px"/>
                                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT * FROM [EmpJobTitles]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                            <asp:DropDownList ID="JobTitleDD" runat="server" Text='<%# Bind("JobTitleID")%>' 
                                                        DataSourceID="SqlDataSource5" DataTextField="Description" DataValueField="JobTitleID" width="75px"/>
                                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT * FROM [EmpJobTitles]"></asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("JobTitleID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PayID" SortExpression="PayID">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="PayDD" runat="server" Text='<%# Bind("PayID")%>' 
                                                        DataSourceID="SqlDataSource7" DataTextField="Description" DataValueField="PayID" />
                                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT * FROM [EmpPayDetails]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="PayDD" runat="server" Text='<%# Bind("PayID")%>' 
                                                        DataSourceID="SqlDataSource7" DataTextField="Description" DataValueField="PayID" />
                                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT * FROM [EmpPayDetails]"></asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("PayID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Hire Date" SortExpression="startdate" >
                                    <EditItemTemplate>
                                        <asp:TextBox ID="startdate" runat="server" Text='<%# Bind("startdate", "{0:MM/dd/yy}")%>'></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="startdate_TextBoxWatermarkExtender" runat="server" BehaviorID="startdate_TextBoxWatermarkExtender" TargetControlID="startdate" ViewStateMode="Enabled" WatermarkText="mm/dd/yy" />
                                        <asp:CalendarExtender ID="startdate_CalendarExtender" runat="server" BehaviorID="startdate_CalendarExtender" TargetControlID="startdate" PopupPosition="BottomRight" />
                                        <asp:RequiredFieldValidator runat="server" ID="startdateValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="startdate" ForeColor="#CC3300"/>
                                        <asp:CompareValidator
                                            ID="dateValidator" runat="server" 
                                            Type="Date"
                                            Operator="DataTypeCheck"
                                            ControlToValidate="startdate" Font-size="Small"
                                            ErrorMessage="Invalid date."
                                            ForeColor="#CC3300">
                                        </asp:CompareValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="startdate" runat="server" Text='<%# Bind("startdate", "{0:MM/dd/yy}")%>'></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="startdate_TextBoxWatermarkExtender" runat="server" BehaviorID="startdate_TextBoxWatermarkExtender" TargetControlID="startdate" ViewStateMode="Enabled" WatermarkText="mm/dd/yy" />
                                        <asp:CalendarExtender ID="startdate_CalendarExtender" runat="server" BehaviorID="startdate_CalendarExtender" TargetControlID="startdate" PopupPosition="BottomRight" />
                                        <asp:RequiredFieldValidator runat="server" ID="startdateValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="startdate" ForeColor="#CC3300"/>
                                        <asp:CompareValidator
                                            ID="dateValidator" runat="server" 
                                            Type="Date"
                                            Operator="DataTypeCheck"
                                            ControlToValidate="startdate" Font-size="Small"
                                            ErrorMessage="Invalid date."
                                            ForeColor="#CC3300">
                                        </asp:CompareValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("startdate", "{0:MM/dd/yy}")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Termination Date" SortExpression="enddate">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="enddate" runat="server" Text='<%# Bind("enddate", "{0:MM/dd/yy}")%>'></asp:TextBox>
                                        <asp:CalendarExtender ID="enddate_CalendarExtender" runat="server" BehaviorID="enddate_CalendarExtender" TargetControlID="enddate" PopupPosition="BottomRight" />
                                        <asp:TextBoxWatermarkExtender ID="Enddate_TextBoxWatermarkExtender" runat="server" BehaviorID="Enddate_TextBoxWatermarkExtender" TargetControlID="enddate" ViewStateMode="Enabled" WatermarkText="mm/dd/yy" />
                                        <asp:CompareValidator
                                            ID="TermdateValidator" runat="server" 
                                            Type="Date"
                                            Operator="DataTypeCheck"
                                            ControlToValidate="enddate" Font-size="Small"
                                            ErrorMessage="Invalid date."
                                            ForeColor="#CC3300">
                                        </asp:CompareValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="enddate" runat="server" Text='<%# Bind("enddate", "{0:MM/dd/yy}")%>'></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="Enddate_TextBoxWatermarkExtender" runat="server" BehaviorID="Enddate_TextBoxWatermarkExtender" TargetControlID="enddate" ViewStateMode="Enabled" WatermarkText="mm/dd/yy" />
                                        <asp:CalendarExtender ID="enddate_CalendarExtender" runat="server" BehaviorID="enddate_CalendarExtender" TargetControlID="enddate" PopupPosition="BottomRight" />
                                        <asp:CompareValidator
                                            ID="TermdateValidator" runat="server" 
                                            Type="Date"
                                            Operator="DataTypeCheck"
                                            ControlToValidate="enddate" Font-size="Small"
                                            ErrorMessage="Invalid date."
                                            ForeColor="#CC3300">
                                        </asp:CompareValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("enddate", "{0:MM/dd/yy}")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rate Of Pay" SortExpression="RateOfPay">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="RateofPay" runat="server" Text='<%# Bind("RateOfPay") %>'></asp:TextBox>
                                        <asp:Label ID="Label31" runat="server" Text="(Range 8-20)" ForeColor="#E6D9CC" />
                                        <asp:RequiredFieldValidator runat="server" ID="RateValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="RateofPay" ForeColor="#CC3300"/>
                                        <asp:RangeValidator ID="RateofPayRangeValidator1" runat="server" Font-size="Small" ErrorMessage="Must be 8-20" ControlToValidate="RateofPay" MaximumValue="20.00" MinimumValue="8.00" Type="Double" ForeColor="#CC3300" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="RateofPay" runat="server" Text='<%# Bind("RateOfPay") %>'></asp:TextBox>
                                        <asp:Label ID="Label32" runat="server" Text="(Range 8-20)" ForeColor="#E6D9CC" />
                                        <asp:RequiredFieldValidator runat="server" ID="RateValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="RateofPay" ForeColor="#CC3300"/>
                                        <asp:RangeValidator ID="RateofPayRangeValidator1" runat="server" Font-size="Small" ErrorMessage="Must be 8-20" ControlToValidate="RateofPay" MaximumValue="20.00" MinimumValue="8.00" Type="Double" ForeColor="#CC3300" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("RateOfPay") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Commission Rate" SortExpression="CommissionRate">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Commission" runat="server" Text='<%# Bind("CommissionRate") %>'></asp:TextBox>
                                        <asp:Label ID="Label33" runat="server" Text="(Range 18-20)" ForeColor="#E6D9CC" />
                                        <asp:RequiredFieldValidator runat="server" ID="CommissionValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Commission" ForeColor="#CC3300"/>
                                        <asp:RangeValidator ID="CommissionRangeValidator1" runat="server" Font-size="Small" ErrorMessage="Must be 18-20" ControlToValidate="Commission" MaximumValue="20.00" MinimumValue="18.00" Type="Double" ForeColor="#CC3300" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="Commission" runat="server" Text='<%# Bind("CommissionRate") %>'></asp:TextBox>
                                        <asp:Label ID="Label34" runat="server" Text="(Range 8-20)" ForeColor="#E6D9CC" />
                                        <asp:RequiredFieldValidator runat="server" ID="CommissionValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Commission" ForeColor="#CC3300"/>
                                        <asp:RangeValidator ID="CommissionRangeValidator1" runat="server" Font-size="Small" ErrorMessage="Must be 18-20" ControlToValidate="Commission" MaximumValue="20.00" MinimumValue="18.00" Type="Double" ForeColor="#CC3300" />                                    
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label14" runat="server" Text='<%# Bind("CommissionRate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" ValidatonGroup="VG1" CommandName="Update" Text="Update" BackColor="#E6D9CC" Width="75px"/>
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" BackColor="#E6D9CC" Width="75px"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" ValidatonGroup="VG1" CommandName="Insert" Text="Insert"  BackColor="#E6D9CC" Width="75px"/>
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Clear" BackColor="#E6D9CC" Width="75px"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" ValidatonGroup="VG1" CommandName="Edit" Text="Edit" BackColor="#A99583" Width="75px"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <FooterStyle BackColor="#A99583" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#A99583" Font-Bold="True" ForeColor="White" />
                                <InsertRowStyle Width="600px" />
                            <PagerStyle BackColor="#A99583" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#A99583" />
                        </asp:DetailsView>
                    </td>
                  </tr>
                </table>
              </td> 
            </tr>
          </table>
            
<!--Details View For New Employee Insert-->
          <table id="table9">
            <tr>
               <td>
                  <table id="table6" style="width:100%;">
                      <tr>
                        <td>
                            <asp:DetailsView ID="EmpDetails0" runat="server" ItemInserted="EmpDetails0_ItemInserted" AutoGenerateRows="False" CellPadding="3" DataKeyNames="EmpID" DataSourceID="SqlDataSource2" DefaultMode="Insert" ForeColor="Black" GridLines="None" Height="50px" Visible="False" Width="800px">
                                <AlternatingRowStyle BackColor="#E6D9CC" />
                                <CommandRowStyle BackColor="#A99583" Font-Bold="True" />
                                <EditRowStyle BackColor="#43382E" />
                                <FieldHeaderStyle BackColor="#A99583" Font-Bold="True" Width="300px" />
                                <Fields>
                                    <asp:BoundField DataField="EmpID" HeaderText="EmpID" InsertVisible="False" ReadOnly="True" SortExpression="EmpID">
                                    <ControlStyle Width="200px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="First Name" SortExpression="Fname">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="Fname" runat="server" Text='<%# Bind("Fname") %>' ValidationGroup="VG1"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="FnameValidator0" runat="server" ControlToValidate="Fname" ErrorMessage="Required!" Font-size="Small" ForeColor="#CC3300" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="Fname" runat="server" Text='<%# Bind("Fname") %>' ValidationGroup="VG1"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="FnameValidator1" runat="server" ControlToValidate="Fname" ErrorMessage="Required!" Font-size="Small" ForeColor="#CC3300" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label35" runat="server" Text='<%# Bind("Fname") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="200px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Last Name" SortExpression="Lname">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="Lname" runat="server" Text='<%# Bind("Lname") %>' ValidationGroup="VG1"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="LnameValidator0" runat="server" ControlToValidate="Lname" ErrorMessage="Required!" Font-size="Small" ForeColor="#CC3300" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="Lname" runat="server" Text='<%# Bind("Lname") %>' ValidationGroup="VG1"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="LnameValidator1" runat="server" ControlToValidate="Lname" ErrorMessage="Required!" Font-size="Small" ForeColor="#CC3300" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label36" runat="server" Text='<%# Bind("Lname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Street" SortExpression="Street">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="Street" runat="server" Text='<%# Bind("Street") %>' ValidationGroup="VG1"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="StreetValidator0" runat="server" ControlToValidate="Street" ErrorMessage="Required!" Font-size="Small" ForeColor="#CC3300" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="Street" runat="server" Text='<%# Bind("Street") %>' ValidationGroup="VG1"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="StreetValidator1" runat="server" ControlToValidate="Street" ErrorMessage="Required!" Font-size="Small" ForeColor="#CC3300" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label37" runat="server" Text='<%# Bind("Street") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="City" SortExpression="city">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="city" runat="server" Text='<%# Bind("city") %>' ValidationGroup="VG1"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="cityValidator0" runat="server" ControlToValidate="city" ErrorMessage="Required!" Font-size="Small" ForeColor="#CC3300" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="city" runat="server" Text='<%# Bind("city") %>' ValidationGroup="VG1"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="cityValidator1" runat="server" ControlToValidate="city" ErrorMessage="Required!" Font-size="Small" ForeColor="#CC3300" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label38" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="State" SortExpression="state">
                                        <EditItemTemplate>
                                        <asp:DropDownList ID="StateDropDownList" runat="server" 
                                                      Text='<%# Bind("State") %>' DataSourceID="SqlDataSource6" DataTextField="state" DataValueField="state" Width="100px" />
                                                      <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT [state] FROM [statelist] ORDER BY [state]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="StateDropDownList" runat="server" 
                                                      Text='<%# Bind("State") %>' DataSourceID="SqlDataSource6" DataTextField="state" DataValueField="state" Width="100px" />
                                                      <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT [state] FROM [statelist] ORDER BY [state]"></asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Zip" SortExpression="zip">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="Zip" runat="server" Text='<%# Bind("zip") %>' ValidationGroup="VG1"></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="Zip_TextBoxWatermarkExtender" runat="server" BehaviorID="Zip_TextBoxWatermarkExtender" TargetControlID="Zip" ViewStateMode="Enabled" WatermarkText="00000" />
                                            <asp:RequiredFieldValidator ID="ZipValidator0" runat="server" ControlToValidate="Zip" ErrorMessage="Required!" Font-size="Small" ForeColor="#CC3300" />
                                            <asp:RegularExpressionValidator ID="zipExpressionValidator0" runat="server" ControlToValidate="Zip" ErrorMessage="5-Digit Zip" Font-size="Small" ForeColor="#CC3300" ValidationExpression="\d{5}?"></asp:RegularExpressionValidator>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="Zip" runat="server" Text='<%# Bind("zip") %>' ValidationGroup="VG1"></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="Zip_TextBoxWatermarkExtender" runat="server" BehaviorID="Zip_TextBoxWatermarkExtender" TargetControlID="Zip" ViewStateMode="Enabled" WatermarkText="00000" />
                                            <asp:RequiredFieldValidator ID="ZipValidator1" runat="server" ControlToValidate="Zip" ErrorMessage="Required!" Font-size="Small" ForeColor="#CC3300" />
                                            <asp:RegularExpressionValidator ID="zipExpressionValidator1" runat="server" ControlToValidate="Zip" ErrorMessage="5-Digit Zip" Font-size="Small" ForeColor="#CC3300" ValidationExpression="\d{5}?"></asp:RegularExpressionValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label39" runat="server" Text='<%# Bind("zip") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Phone" SortExpression="phone">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="Phone" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="Phone_TextBoxWatermarkExtender" runat="server" BehaviorID="Phone_TextBoxWatermarkExtender" TargetControlID="Phone" ViewStateMode="Enabled" WatermarkText="000-000-0000" />
                                            <asp:RegularExpressionValidator ID="phoneExpressionValidator0" runat="server" ControlToValidate="Phone" ErrorMessage="Format 000-000-0000" Font-size="Small" ForeColor="#CC3300" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="Phone" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="Phone_TextBoxWatermarkExtender" runat="server" BehaviorID="Phone_TextBoxWatermarkExtender" TargetControlID="Phone" ViewStateMode="Enabled" WatermarkText="000-000-0000" />
                                            <asp:RegularExpressionValidator ID="phoneExpressionValidator1" runat="server" ControlToValidate="Phone" ErrorMessage="Format 000-000-0000" Font-size="Small" ForeColor="#CC3300" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label40" runat="server" Text='<%# Bind("phone") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Password" SortExpression="password">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="Password" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordValidator0" runat="server" ControlToValidate="Password" ErrorMessage="Required!" Font-size="Small" ForeColor="#CC3300" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="Password" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordValidator1" runat="server" ControlToValidate="Password" ErrorMessage="Required!" Font-size="Small" ForeColor="#CC3300" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label41" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="JobTitleID" SortExpression="JobTitleID">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="JobTitleDD" runat="server" Text='<%# Bind("JobTitleID") %>' 
                                                        DataSourceID="SqlDataSource5" DataTextField="Description" DataValueField="JobTitleID" width="75px"/>
                                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT * FROM [EmpJobTitles]"></asp:SqlDataSource>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="JobTitleDD" runat="server" Text='<%# Bind("JobTitleID") %>' 
                                                        DataSourceID="SqlDataSource5" DataTextField="Description" DataValueField="JobTitleID" width="75px"/>
                                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT * FROM [EmpJobTitles]"></asp:SqlDataSource>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label44" runat="server" Text='<%# Bind("JobTitleID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PayID" SortExpression="PayID">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="PayDD" runat="server" Text='<%# Bind("PayID")%>' 
                                                        DataSourceID="SqlDataSource7" DataTextField="Description" DataValueField="PayID" />
                                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT * FROM [EmpPayDetails]"></asp:SqlDataSource>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="PayDD" runat="server" Text='<%# Bind("PayID")%>' 
                                                        DataSourceID="SqlDataSource7" DataTextField="Description" DataValueField="PayID" />
                                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT * FROM [EmpPayDetails]"></asp:SqlDataSource>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label47" runat="server" Text='<%# Bind("PayID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Hire Date" SortExpression="startdate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="startdate" runat="server" Text='<%# Bind("startdate", "{0:MM/dd/yy}")%>'></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="startdate_TextBoxWatermarkExtender" runat="server" BehaviorID="startdate_TextBoxWatermarkExtender" TargetControlID="startdate" ViewStateMode="Enabled" WatermarkText="mm/dd/yy" />
                                            <asp:CalendarExtender ID="startdate_CalendarExtender" runat="server" BehaviorID="startdate_CalendarExtender" TargetControlID="startdate" PopupPosition="BottomRight" />
                                            <asp:RequiredFieldValidator ID="startdateValidator0" runat="server" ControlToValidate="startdate" ErrorMessage="Required!" Font-size="Small" ForeColor="#CC3300" />
                                            <asp:CompareValidator ID="dateValidator0" runat="server" ControlToValidate="startdate" ErrorMessage="Invalid date." Font-size="Small" ForeColor="#CC3300" Operator="DataTypeCheck" Type="Date">
                                        </asp:CompareValidator>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="startdate" runat="server" Text='<%# Bind("startdate", "{0:MM/dd/yy}")%>'></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="startdate_TextBoxWatermarkExtender" runat="server" BehaviorID="startdate_TextBoxWatermarkExtender" TargetControlID="startdate" ViewStateMode="Enabled" WatermarkText="mm/dd/yy" />
                                            <asp:CalendarExtender ID="startdate_CalendarExtender" runat="server" BehaviorID="startdate_CalendarExtender" TargetControlID="startdate" PopupPosition="BottomRight" />
                                            <asp:RequiredFieldValidator ID="startdateValidator1" runat="server" ControlToValidate="startdate" ErrorMessage="Required!" Font-size="Small" ForeColor="#CC3300" />
                                            <asp:CompareValidator ID="dateValidator1" runat="server" ControlToValidate="startdate" ErrorMessage="Invalid date." Font-size="Small" ForeColor="#CC3300" Operator="DataTypeCheck" Type="Date">
                                        </asp:CompareValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label50" runat="server" Text='<%#Bind("startdate", "{0:MM/dd/yy}")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Termination Date" SortExpression="enddate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="enddate" runat="server" Text='<%# Bind("enddate", "{0:MM/dd/yy}")%>'></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="Enddate_TextBoxWatermarkExtender" runat="server" BehaviorID="Enddate_TextBoxWatermarkExtender" TargetControlID="enddate" ViewStateMode="Enabled" WatermarkText="mm/dd/yy" />
                                            <asp:CalendarExtender ID="enddate_CalendarExtender" runat="server" BehaviorID="enddate_CalendarExtender" TargetControlID="enddate" PopupPosition="BottomRight" />
                                            <asp:CompareValidator ID="TermdateValidator0" runat="server" ControlToValidate="enddate" ErrorMessage="Please enter a valid date." Font-size="Small" ForeColor="#CC3300" Operator="DataTypeCheck" Type="Date">
                                        </asp:CompareValidator>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="enddate" runat="server" Text='<%# Bind("enddate", "{0:MM/dd/yy}")%>'></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="Enddate_TextBoxWatermarkExtender" runat="server" BehaviorID="Enddate_TextBoxWatermarkExtender" TargetControlID="enddate" ViewStateMode="Enabled" WatermarkText="mm/dd/yy" />
                                            <asp:CalendarExtender ID="enddate_CalendarExtender" runat="server" BehaviorID="enddate_CalendarExtender" TargetControlID="enddate" PopupPosition="BottomRight" />
                                            <asp:CompareValidator ID="TermdateValidator1" runat="server" ControlToValidate="enddate" ErrorMessage="Please enter a valid date." Font-size="Small" ForeColor="#CC3300" Operator="DataTypeCheck" Type="Date">
                                        </asp:CompareValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label53" runat="server" Text='<%# Bind("enddate", "{0:MM/dd/yy}")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Rate Of Pay" SortExpression="RateOfPay">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="RateofPay" runat="server" Text='<%# Bind("RateOfPay") %>'></asp:TextBox>
                                            <asp:Label ID="Label54" runat="server" ForeColor="#E6D9CC" Text="(Range 8-20)" />
                                            <asp:RequiredFieldValidator ID="RateValidator0" runat="server" ControlToValidate="RateofPay" ErrorMessage="Required!" Font-size="Small" ForeColor="#CC3300" />
                                            <asp:RangeValidator ID="RateofPayRangeValidator2" runat="server" ControlToValidate="RateofPay" ErrorMessage="Must be 8-20" Font-size="Small" ForeColor="#CC3300" MaximumValue="20.00" MinimumValue="8.00" Type="Currency" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="RateofPay" runat="server" Text='<%# Bind("RateOfPay") %>'></asp:TextBox>
                                            <asp:Label ID="Label55" runat="server" ForeColor="#E6D9CC" Text="(Range 8-20)" />
                                            <asp:RequiredFieldValidator ID="RateValidator1" runat="server" ControlToValidate="RateofPay" ErrorMessage="Required!" Font-size="Small" ForeColor="#CC3300" />
                                            <asp:RangeValidator ID="RateofPayRangeValidator3" runat="server" ControlToValidate="RateofPay" ErrorMessage="Must be 8-20" Font-size="Small" ForeColor="#CC3300" MaximumValue="20.00" MinimumValue="8.00" Type="Currency" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label56" runat="server" Text='<%# Bind("RateOfPay") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Commission Rate" SortExpression="CommissionRate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="Commission" runat="server" Text='<%# Bind("CommissionRate") %>'></asp:TextBox>
                                            <asp:Label ID="Label57" runat="server" ForeColor="#E6D9CC" Text="(Range 18-20)" />
                                            <asp:RequiredFieldValidator ID="CommissionValidator0" runat="server" ControlToValidate="Commission" ErrorMessage="Required!" Font-size="Small" ForeColor="#CC3300" />
                                            <asp:RangeValidator ID="CommissionRangeValidator2" runat="server" ControlToValidate="Commission" ErrorMessage="Must be 18-20" Font-size="Small" ForeColor="#CC3300" MaximumValue="20.00" MinimumValue="18.00" Type="Double" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="Commission" runat="server" Text='<%# Bind("CommissionRate") %>'></asp:TextBox>
                                            <asp:Label ID="Label58" runat="server" ForeColor="#E6D9CC" Text="(Range 18-20)" />
                                            <asp:RequiredFieldValidator ID="CommissionValidator1" runat="server" ControlToValidate="Commission" ErrorMessage="Required!" Font-size="small" ForeColor="#CC3300" />
                                            <asp:RangeValidator ID="CommissionRangeValidator3" runat="server" ControlToValidate="Commission" ErrorMessage="Must be 18-20" Font-size="Small" ForeColor="#CC3300" MaximumValue="20.00" MinimumValue="18.00" Type="Double" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label59" runat="server" Text='<%# Bind("CommissionRate") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:Button ID="Button3" runat="server" BackColor="#E6D9CC" CausesValidation="True" CommandName="Update" Text="Update" ValidatonGroup="VG1" Width="75px" />
                                            &nbsp;<asp:Button ID="Button4" runat="server" BackColor="#E6D9CC" CausesValidation="False" CommandName="Cancel" Text="Cancel" Width="75px" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:Button ID="Button5" runat="server" BackColor="#E6D9CC" CausesValidation="True" CommandName="Insert" Text="Insert" ValidatonGroup="VG1" Width="75px" />
                                            &nbsp;<asp:Button ID="Button6" runat="server" BackColor="#E6D9CC" CausesValidation="False" CommandName="Cancel" Text="Clear" Width="75px" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Button ID="Button7" runat="server" BackColor="#E6D9CC" CausesValidation="False" CommandName="Edit" Text="Edit" ValidatonGroup="VG1" Width="75px" />
                                            &nbsp;<asp:Button ID="Button8" runat="server" BackColor="#E6D9CC" CausesValidation="False" CommandName="New" Text="New" Width="75px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
          </table>

<!--GridView For View All Employees-->
          <table id="table7">
            <tr>
               <td>
                  <table id="table8" style="width:100%;">
                      <tr>
                        <td>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EmpID" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="1200px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Visible="False" Font-Size="Small" Font-Bold="False" PageSize="25">
                            <AlternatingRowStyle BackColor="#A99583" />
                            <Columns>
                                <asp:BoundField DataField="EmpID" HeaderText="EmpID" InsertVisible="False" ReadOnly="True" SortExpression="EmpID">
                                </asp:BoundField>
                                <asp:BoundField DataField="Fname" HeaderText="First" SortExpression="Fname" >
                                </asp:BoundField>
                                <asp:BoundField DataField="Lname" HeaderText="Last" SortExpression="Lname" >
                                </asp:BoundField>
                                <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" >
                                </asp:BoundField>
                                <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" >
                                </asp:BoundField>
                                <asp:BoundField DataField="zip" HeaderText="Zip" SortExpression="zip" />
                                <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" />
                                <asp:BoundField DataField="JobTitleID" HeaderText="JobID" SortExpression="JobTitleID" >
                                <ItemStyle Width="50px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="PayID" HeaderText="PayID" SortExpression="PayID" >
                                <ItemStyle Width="50px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="startdate" HeaderText="Hired" SortExpression="startdate" dataformatstring="{0:MM/d/yy}" />
                                <asp:BoundField DataField="enddate" HeaderText="Term." SortExpression="enddate" dataformatstring="{0:MM/d/yy}" />
                                <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                                <asp:BoundField DataField="RateOfPay" HeaderText="PayRate" SortExpression="RateOfPay" />
                                <asp:BoundField DataField="CommissionRate" HeaderText="Commission" SortExpression="CommissionRate" />
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
                        <br />
                        </td> 
                        </tr>
                        </table>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="VG1" ShowMessageBox="True" />
                        </div>

<!--DataSource 1 For DropDownList Control-->
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT (Fname + ' ' + Lname)as name FROM Employees  ORDER BY Fname ASC"></asp:SqlDataSource>
     

<!--DataSource 2 For Both Details View (Employee Report and Insert)-->
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
            SelectCommand="SELECT * FROM [Employees] WHERE (Fname + ' ' + Lname)= @fulllnamedropdown"
            InsertCommand="INSERT INTO [Employees] ([Fname], [Lname], [street], [city], [zip], [phone], [JobTitleID], [PayID], [startdate], [enddate], [password], [state], [RateOfPay], [CommissionRate]) VALUES (@Fname, @Lname, @street, @city, @zip, @phone, @JobTitleID, @payID, @startdate, @enddate, @password, UPPER(@state), @RateOfPay, @CommissionRate)"
            Updatecommand="UPDATE [Employees] SET [Fname] = @Fname, [Lname] = @Lname, [street] = @street, [city] = @city, [zip] = @zip, [phone] = @phone, [JobTitleID] = @JobTitleID, [PayID] = @PayID, [startdate] = @startdate, [enddate] = @enddate, [password] = @password, [state] = UPPER(@state),[RateOfPay] = @RateOfPay, [CommissionRate] = @CommissionRate WHERE [EmpID] = @EmpID">
            <SelectParameters>
                <asp:ControlParameter ControlID="Combobox1" Name="fulllnamedropdown" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="Fname" Type="String" />
                <asp:Parameter Name="Lname" Type="String" />
                <asp:Parameter Name="street" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="zip" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="JobTitleID" Type="Int16"/>
                <asp:Parameter Name="PayID" Type="Int16" />
                <asp:Parameter Name="startdate" Type="DateTime" />
                <asp:Parameter Name="enddate" Type="DateTime" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="state" Type="String" />
                <asp:Parameter Name="RateOfPay" Type="Decimal" />
                <asp:Parameter Name="CommissionRate" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Fname" Type="String" />
                <asp:Parameter Name="Lname" Type="String" />
                <asp:Parameter Name="street" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="zip" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="JobTitleID" Type="Int16"/>
                <asp:Parameter Name="PayID" Type="Int16" />
                <asp:Parameter Name="startdate" Type="DateTime" />
                <asp:Parameter Name="enddate" Type="DateTime" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="state" Type="String" />
                <asp:Parameter Name="RateOfPay" Type="Decimal" />
                <asp:Parameter Name="CommissionRate" Type="Decimal" />
                <asp:Parameter Name="EmpID" />
            </UpdateParameters>
        </asp:SqlDataSource>

<!--DataSource 3 For GridView View All Employees-->
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
            SelectCommand="SELECT * FROM [Employees] ORDER BY [Lname]" OnSelecting="SqlDataSource3_Selecting">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT * FROM [EmpJobTitles]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT [state] FROM [statelist] ORDER BY [state]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT * FROM [EmpPayDetails]"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>


        
