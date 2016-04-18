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
        CustDetails.Visible = True
        CustDetails0.Visible = False
        GridView1.Visible = False
        ComboBox1.Visible = True
        EntNameLabel.Visible = True
      
        GridView1.DataBind()
          
    End Sub
    
    'View All Report Button Event           
    Protected Sub viewAllButton_Click(sender As Object, e As EventArgs)
        GridView1.Visible = True
        CustDetails.Visible = False
        CustDetails0.Visible = False
        ComboBox1.Visible = False
        EntNameLabel.Visible = False
        GridView1.DataBind()
    End Sub
    
    'Add New Customer Button Event
    Protected Sub NewCustBT_Click(sender As Object, e As EventArgs)
        CustDetails0.Visible = True
        CustDetails.Visible = False
        GridView1.Visible = False
        ComboBox1.Visible = False
        EntNameLabel.Visible = False
        GridView1.DataBind()
    End Sub

    Protected Sub EditVendorBT_Click(sender As Object, e As EventArgs)
        CustDetails.Visible = False
    End Sub
   
    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        Session.RemoveAll()
        Response.Redirect("login.aspx")
    End Sub
   
    Protected Sub CustDetails_ItemUpdated(sender As Object, e As DetailsViewUpdatedEventArgs) Handles CustDetails.ItemUpdated
        'Indicate whether the update operation succeeded.
        If e.Exception IsNot Nothing Then
            lblError.Text = "You are not currently clocked in. You must clock in before you can clock out.  " &
                e.ExceptionHandled = True
            e.KeepInEditMode = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user may have updated that item. " &
                "Please try again."
        Else
            lblError.Text = "Update Successful!"
          
        End If

    End Sub

    Protected Sub CustDetails0_ItemInserted(sender As Object, e As DetailsViewInsertedEventArgs) Handles CustDetails0.ItemInserted
        'Indicate whether the update operation succeeded.
        If e.Exception IsNot Nothing Then
            lblError.Text = "You are not currently clocked in. You must clock in before you can clock out. " &
                e.ExceptionHandled = True
            e.KeepInInsertMode = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user may have updated that item. " &
                "Please try again."
        Else
            lblError.Text = "Insert Successful!"
          
        End If
    
    End Sub
   
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Vendors</title>
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
            <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" Width="50px" ImageUrl="~/logoutbutton1.fw.png" BorderStyle="Outset" OnClick="ImageButton1_Click"/>
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
                    <asp:Button ID="NewVendorBT" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="New Vendor" Width="150px" OnClick="NewCustBT_Click" CausesValidation="False" Font-Bold="True" />
                    <asp:Button ID="printButton0" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="Print" Width="150px" onclientclick="javascript:window.print();" xmlns:asp="#unknown" CausesValidation="False" Font-Bold="True" />
                    <asp:Button ID="homeBT" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="Home" Width="150px" PostBackUrl="~/Default.aspx" CausesValidation="False" Font-Bold="True" />
                </td>
            </tr>
            </table>

<!--Search Controls-->
<div id="combo">
         <asp:Label ID="EntNameLabel" runat="server" Font-Size="Medium" Text="Vendor" Font-Bold="True"></asp:Label>
         <asp:ComboBox ID="ComboBox1" runat="server" AppendDataBoundItems="True" 
              AutoCompleteMode="SuggestAppend" DataSourceID="SqlDataSource5" 
              DataTextField="VendName" DataValueField="VendName" MaxLength="0" style="display: inline;" AutoPostBack="True" Width="200px" BackColor="#F3EDE7" ></asp:ComboBox>
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
                         
                       
<!--Details View For Customer Search-->
           <table id="table10">
            <tr>
               <td>
                  <table id="table5" style="width:100%;">
                      <tr>
                        <td>
                        <asp:DetailsView ID="CustDetails" runat="server" ItemUpdated="CustDetails_ItemUpdated" AutoGenerateRows="False" CellPadding="4" DataKeyNames="VendID" DataSourceID="SqlDataSource2" Height="50px" Width="800px" ForeColor="Black" GridLines="None">
                            <AlternatingRowStyle BackColor="#E6D9CC" />
                            <CommandRowStyle BackColor="#A99583" Font-Bold="True" />
                            <EditRowStyle BackColor="#43382E" />
                            <FieldHeaderStyle BackColor="#A99583" Font-Bold="True" Width="300px" />
                            <Fields>
                                <asp:BoundField DataField="VendID" HeaderText="VendID" InsertVisible="False" ReadOnly="True" SortExpression="VendID" />
                                <asp:TemplateField HeaderText="Vendor" SortExpression="VendName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="vendor" runat="server" ValidationGroup="VG1" Text='<%# Bind("VendName") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="vendValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="vendor" ForeColor="#CC3300"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="vendor" runat="server" ValidationGroup="VG1" Text='<%# Bind("VendName") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="vendValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="vendor" ForeColor="#CC3300"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("VendName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contact First Name" SortExpression="ContactFname">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="contactName" runat="server" ValidationGroup="VG1" Text='<%# Bind("ContactFname") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="nameValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="contactName" ForeColor="#CC3300"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="contactName" runat="server" ValidationGroup="VG1" Text='<%# Bind("ContactFname") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="nameValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="contactName" ForeColor="#CC3300"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ContactFname") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contact Last Name" SortExpression="ContactLname">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="lastName" runat="server" ValidationGroup="VG1" Text='<%# Bind("ContactLname") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="LnameValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="lastName" ForeColor="#CC3300"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="lastName" runat="server" ValidationGroup="VG1" Text='<%# Bind("ContactLname") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="LnameValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="lastName" ForeColor="#CC3300"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ContactLname") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Street" SortExpression="street">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Street" runat="server" ValidationGroup="VG1" Text='<%# Bind("street") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="streetValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Street" ForeColor="#CC3300"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="Street" runat="server" ValidationGroup="VG1" Text='<%# Bind("street") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="streetValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Street" ForeColor="#CC3300"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("street") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="City" SortExpression="city">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="City" runat="server" ValidationGroup="VG1" Text='<%# Bind("city") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="cityValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="City" ForeColor="#CC3300"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="City" runat="server" ValidationGroup="VG1" Text='<%# Bind("city") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="cityValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="City" ForeColor="#CC3300"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="State" SortExpression="State">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="StateDropDownList" runat="server" 
                                                      Text='<%# Bind("State") %>' DataSourceID="SqlDataSource4" DataTextField="state" DataValueField="state" Width="100px" />
                                                      <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT [state] FROM [statelist] ORDER BY [state]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="StateDropDownList" runat="server" 
                                                      Text='<%# Bind("State") %>' DataSourceID="SqlDataSource4" DataTextField="state" DataValueField="state" Width="100px" />
                                                      <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT [state] FROM [statelist] ORDER BY [state]"></asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Zip" SortExpression="zip">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Zip" runat="server" ValidationGroup="VG1" Text='<%# Bind("zip") %>'></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="Zip_TextBoxWatermarkExtender" runat="server" BehaviorID="Zip_TextBoxWatermarkExtender" TargetControlID="Zip" ViewStateMode="Enabled" WatermarkText="00000" />
                                        <asp:RequiredFieldValidator runat="server" ID="zipValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Zip" ForeColor="#CC3300"/>
                                        <asp:RegularExpressionValidator ID="zipExpressionValidator" runat="server" ControlToValidate="Zip" Font-size="Small" ErrorMessage="5-Digit Zip Required" ValidationExpression="\d{5}?" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="Zip" runat="server" ValidationGroup="VG1" Text='<%# Bind("zip") %>'></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="Zip_TextBoxWatermarkExtender" runat="server" BehaviorID="Zip_TextBoxWatermarkExtender" TargetControlID="Zip" ViewStateMode="Enabled" WatermarkText="00000" />
                                        <asp:RequiredFieldValidator runat="server" ID="zipValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Zip" ForeColor="#CC3300"/>
                                        <asp:RegularExpressionValidator ID="zipExpressionValidator" runat="server" ControlToValidate="Zip" Font-size="Small" ErrorMessage="5-Digit Zip Required" ValidationExpression="\d{5}?" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("zip") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Country" SortExpression="country">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" ValidationGroup="VG1" Text='<%# Bind("country") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" ValidationGroup="VG1" Text='<%# Bind("country") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Phone" SortExpression="phone">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Phone" runat="server" ValidationGroup="VG1" Text='<%# Bind("phone") %>'></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="Phone_TextBoxWatermarkExtender" runat="server" BehaviorID="Phone_TextBoxWatermarkExtender" TargetControlID="Phone" ViewStateMode="Enabled" WatermarkText="000-000-0000" />
                                        <asp:RequiredFieldValidator runat="server" ID="phoneValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Phone" ForeColor="#CC3300"/>
                                        <asp:RegularExpressionValidator ID="phoneExpressionValidator" runat="server" ControlToValidate="Phone" Font-size="Small" ErrorMessage="Format 000-000-0000 Required" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="Phone" runat="server" ValidationGroup="VG1" Text='<%# Bind("phone") %>'></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="Phone_TextBoxWatermarkExtender" runat="server" BehaviorID="Phone_TextBoxWatermarkExtender" TargetControlID="Phone" ViewStateMode="Enabled" WatermarkText="000-000-0000" />
                                        <asp:RegularExpressionValidator ID="phoneExpressionValidator" runat="server" ControlToValidate="Phone" Font-size="Small" ErrorMessage="Format 000-000-0000 Required" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("phone") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" ValidatonGroup="VG1" CommandName="Update"  Text="Update" BackColor="#E6D9CC" Width="75px"/>
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" BackColor="#E6D9CC" Width="75px"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" ValidatonGroup="VG1" CommandName="Insert"  Text="Insert" BackColor="#E6D9CC" Width="75px"/>
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Clear" BackColor="#E6D9CC" Width="75px"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" ValidatonGroup="VG1" CommandName="Edit" Text="Edit" BackColor="#E6D9CC" Width="75px"/>
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
<!--Details View For New Vendor Insert-->
 <table id="table9">
            <tr>
               <td>
                  <table id="table6" style="width:100%;">
                      <tr>
                        <td>   
                        <asp:DetailsView ID="CustDetails0" runat="server" ItemInserted="CustDetails0_ItemInserted"  AutoGenerateRows="False" CellPadding="4" DataKeyNames="VendID" DataSourceID="SqlDataSource2" Height="50px" Width="800px" ForeColor="Black" GridLines="None" DefaultMode="Insert" Visible="False">
                            <AlternatingRowStyle BackColor="#E6D9CC" />
                            <CommandRowStyle BackColor="#A99583" Font-Bold="True" />
                            <EditRowStyle BackColor="#43382E" />
                            <FieldHeaderStyle BackColor="#A99583" Font-Bold="True" Width="300px" />
                            <Fields>
                                <asp:BoundField DataField="VendID" HeaderText="VendID" InsertVisible="False" ReadOnly="True" SortExpression="VendID" />
                                <asp:TemplateField HeaderText="Vendor" SortExpression="VendName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="vendor" runat="server" ValidationGroup="VG1" Text='<%# Bind("VendName") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="vendValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="vendor" ForeColor="#CC3300"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="vendor" runat="server" ValidationGroup="VG1" Text='<%# Bind("VendName") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="vendValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="vendor" ForeColor="#CC3300"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("VendName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contact First Name" SortExpression="ContactFname">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="contactName" runat="server" ValidationGroup="VG1" Text='<%# Bind("ContactFname") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="nameValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="contactName" ForeColor="#CC3300"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="contactName" runat="server" ValidationGroup="VG1" Text='<%# Bind("ContactFname") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="nameValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="contactName" ForeColor="#CC3300"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ContactFname") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contact Last Name" SortExpression="ContactLname">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="lastName" runat="server" ValidationGroup="VG1" Text='<%# Bind("ContactLname") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="LnameValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="lastName" ForeColor="#CC3300"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="lastName" runat="server" ValidationGroup="VG1" Text='<%# Bind("ContactLname") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="LnameValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="lastName" ForeColor="#CC3300"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ContactLname") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Street" SortExpression="street">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Street" runat="server" ValidationGroup="VG1" Text='<%# Bind("street") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="streetValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Street" ForeColor="#CC3300"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="Street" runat="server" ValidationGroup="VG1" Text='<%# Bind("street") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="streetValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Street" ForeColor="#CC3300"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("street") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="City" SortExpression="city">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="City" runat="server" ValidationGroup="VG1" Text='<%# Bind("city") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="cityValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="City" ForeColor="#CC3300"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="City" runat="server" ValidationGroup="VG1" Text='<%# Bind("city") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="cityValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="City" ForeColor="#CC3300"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="State" SortExpression="State">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="StateDropDownList" runat="server" 
                                                      Text='<%# Bind("State") %>' DataSourceID="SqlDataSource4" DataTextField="state" DataValueField="state" Width="100px" />
                                                      <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT [state] FROM [statelist] ORDER BY [state]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="StateDropDownList" runat="server" 
                                                      Text='<%# Bind("State") %>' DataSourceID="SqlDataSource4" DataTextField="state" DataValueField="state" Width="100px" />
                                                      <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT [state] FROM [statelist] ORDER BY [state]"></asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Zip" SortExpression="zip">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Zip" runat="server" ValidationGroup="VG1" Text='<%# Bind("zip") %>'></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="Zip_TextBoxWatermarkExtender" runat="server" BehaviorID="Zip_TextBoxWatermarkExtender" TargetControlID="Zip" ViewStateMode="Enabled" WatermarkText="00000" />
                                        <asp:RequiredFieldValidator runat="server" ID="zipValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Zip" ForeColor="#CC3300"/>
                                        <asp:RegularExpressionValidator ID="zipExpressionValidator" runat="server" ControlToValidate="Zip" Font-size="Small" ErrorMessage="5-Digit Zip" ValidationExpression="\d{5}?" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="Zip" runat="server" ValidationGroup="VG1" Text='<%# Bind("zip") %>'></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="Zip_TextBoxWatermarkExtender" runat="server" BehaviorID="Zip_TextBoxWatermarkExtender" TargetControlID="Zip" ViewStateMode="Enabled" WatermarkText="00000" />
                                        <asp:RequiredFieldValidator runat="server" ID="zipValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Zip" ForeColor="#CC3300"/>
                                        <asp:RegularExpressionValidator ID="zipExpressionValidator" runat="server" ControlToValidate="Zip" Font-size="Small" ErrorMessage="5-Digit Zip" ValidationExpression="\d{5}?" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("zip") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Country" SortExpression="country">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" ValidationGroup="VG1" Text='<%# Bind("country") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" ValidationGroup="VG1" Text='<%# Bind("country") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Phone" SortExpression="phone">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Phone" runat="server" ValidationGroup="VG1" Text='<%# Bind("phone") %>'></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="Phone_TextBoxWatermarkExtender" runat="server" BehaviorID="Phone_TextBoxWatermarkExtender" TargetControlID="Phone" ViewStateMode="Enabled" WatermarkText="000-000-0000" />
                                        <asp:RequiredFieldValidator runat="server" ID="phoneValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Phone" ForeColor="#CC3300"/>
                                        <asp:RegularExpressionValidator ID="phoneExpressionValidator" runat="server" ControlToValidate="Phone" Font-size="Small" ErrorMessage="Format 000-000-0000" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="Phone" runat="server" ValidationGroup="VG1" Text='<%# Bind("phone") %>'></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="Phone_TextBoxWatermarkExtender" runat="server" BehaviorID="Phone_TextBoxWatermarkExtender" TargetControlID="Phone" ViewStateMode="Enabled" WatermarkText="000-000-0000" />
                                        <asp:RequiredFieldValidator runat="server" ID="phoneValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Phone" ForeColor="#CC3300"/>
                                        <asp:RegularExpressionValidator ID="phoneExpressionValidator" runat="server" ControlToValidate="Phone" Font-size="Small" ErrorMessage="Format 000-000-0000" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("phone") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:Button ID="Button3" runat="server" CausesValidation="True" ValidatonGroup="VG1" CommandName="Update" Text="Update" BackColor="#E6D9CC" Width="75px"/>
                                        &nbsp;<asp:Button ID="Button4" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" BackColor="#E6D9CC" Width="75px"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:Button ID="Button5" runat="server" CausesValidation="True" ValidatonGroup="VG1" CommandName="Insert" Text="Insert" BackColor="#E6D9CC" Width="75px"/>
                                        &nbsp;<asp:Button ID="Button6" runat="server" CausesValidation="False" CommandName="Cancel" Text="Clear" BackColor="#E6D9CC" Width="75px"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="New" Text="New" BackColor="#A99583" Width="75px"/>
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
<!--GridView For View All Vendors-->
<table id="table7">
            <tr>
               <td>
                  <table id="table8" style="width:100%;">
                      <tr>
                        <td>  
                            
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="VendID" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Vertical" Visible="False" Font-Size="Small" Width="1200px" PageSize="25">
                                <AlternatingRowStyle BackColor="#A99583" />
                                <Columns>
                                    <asp:BoundField DataField="VendID" HeaderText="VendID" InsertVisible="False" ReadOnly="True" SortExpression="VendID" />
                                    <asp:BoundField DataField="VendName" HeaderText="VendName" SortExpression="VendName" />
                                    <asp:BoundField DataField="ContactFname" HeaderText="ContactFname" SortExpression="ContactFname" />
                                    <asp:BoundField DataField="ContactLname" HeaderText="ContactLname" SortExpression="ContactLname" />
                                    <asp:BoundField DataField="street" HeaderText="street" SortExpression="street" />
                                    <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                                    <asp:BoundField DataField="zip" HeaderText="zip" SortExpression="zip" />
                                    <asp:BoundField DataField="country" HeaderText="country" SortExpression="country" />
                                    <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
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
 <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="VG1" ShowMessageBox="True" />
 </div>

<!--DataSource 1 For DropDownList Control-->
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

<!--DataSource 2 Details View (Vendor Report and Insert)-->
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
            SelectCommand="SELECT * FROM [Vendors] WHERE ([VendName] = @VendName)"
            InsertCommand="INSERT INTO [Vendors] ([VendName], [ContactFname], [ContactLname], [street], [city], [zip], [country], [phone], [State]) VALUES (@VendName, @ContactFname, @ContactLname, @street, @city, @zip, @country, @phone, @State)"
            Updatecommand="UPDATE [Vendors] SET [VendName] = @VendName, [ContactFname] = @ContactFname, [ContactLname] = @ContactLname, [street] = @street, [city] = @city, [zip] = @zip, [country] = @country, [phone] = @phone, [State] = @State WHERE [VendID] = @VendID" 
            DeleteCommand="DELETE FROM [Vendors] WHERE [VendID] = @VendID">
            <SelectParameters>
                <asp:ControlParameter ControlID="ComboBox1" Name="VendName" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="VendID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="VendName" Type="String" />
                <asp:Parameter Name="ContactFname" Type="String" />
                <asp:Parameter Name="ContactLname" Type="String" />
                <asp:Parameter Name="street" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="zip" Type="String" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="State" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="VendName" Type="String" />
                <asp:Parameter Name="ContactFname" Type="String" />
                <asp:Parameter Name="ContactLname" Type="String" />
                <asp:Parameter Name="street" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="zip" Type="String" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="VendID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
            SelectCommand="SELECT [VendName] FROM [Vendors] ORDER BY [VendName]"></asp:SqlDataSource>

<!--DataSource 3 For GridView View All Customers-->
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
            SelectCommand="SELECT * FROM [Vendors] ORDER BY [VendName]" 
            DeleteCommand="DELETE FROM [Vendors] WHERE [VendID] = @VendID" 
            InsertCommand="INSERT INTO [Vendors] ([VendName], [ContactFname], [ContactLname], [street], [city], [zip], [country], [phone], [State]) VALUES (@VendName, @ContactFname, @ContactLname, @street, @city, @zip, @country, @phone, @State)" 
            UpdateCommand="UPDATE [Vendors] SET [VendName] = @VendName, [ContactFname] = @ContactFname, [ContactLname] = @ContactLname, [street] = @street, [city] = @city, [zip] = @zip, [country] = @country, [phone] = @phone, [State] = @State WHERE [VendID] = @VendID">
            <DeleteParameters>
                <asp:Parameter Name="VendID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="VendName" Type="String" />
                <asp:Parameter Name="ContactFname" Type="String" />
                <asp:Parameter Name="ContactLname" Type="String" />
                <asp:Parameter Name="street" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="zip" Type="String" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="State" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="VendName" Type="String" />
                <asp:Parameter Name="ContactFname" Type="String" />
                <asp:Parameter Name="ContactLname" Type="String" />
                <asp:Parameter Name="street" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="zip" Type="String" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="VendID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>


        
