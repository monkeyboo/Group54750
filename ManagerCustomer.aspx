<%@ Page Language="VB" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Web.Services" %>
<%@ Import Namespace="System.Drawing.Printing"%>

<!DOCTYPE html>
<script runat="server">
    Protected Sub Page_Load(sender As Object, e As EventArgs)
         ' If Session("user") IsNot "employee" Then
         'Response.Redirect("login.aspx")
         'End If
     End Sub
    
     'New Report Button Event 
     Protected Sub reportButton_Click(sender As Object, e As EventArgs)
         CustDetails.Visible = True
         CustDetails0.Visible = False
         GridView1.Visible = False
         FnDD.Visible = True
         FnameLabel.Visible = True
         PhoneLabel.Visible = True
         PhoneTextBox.Visible = True
         DigitLabel.Visible = True
         GridView1.DataBind()
     End Sub
    
     'View All Report Button Event           
     Protected Sub viewAllButton_Click(sender As Object, e As EventArgs)
         GridView1.Visible = True
         CustDetails.Visible = False
         CustDetails0.Visible = False
         PhoneTextBox.Visible = False
         PhoneLabel.Visible = False
         FnameLabel.Visible = False
         FnDD.Visible = False
         DigitLabel.Visible = False
         GridView1.DataBind()
     End Sub
    
     'Add New Customer Button Event
     Protected Sub NewCustBT_Click(sender As Object, e As EventArgs)
         CustDetails0.Visible = True
         CustDetails.Visible = False
         GridView1.Visible = False
         PhoneTextBox.Visible = False
         PhoneLabel.Visible = False
         FnameLabel.Visible = False
         FnDD.Visible = False
         DigitLabel.Visible = False
         GridView1.DataBind()
     End Sub

     Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs)

     End Sub

     Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
         Session.RemoveAll()
         Response.Redirect("login.aspx")
     End Sub
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Customers</title>
    <link href="EmployeeReport.css" rel="stylesheet" type="text/css" />


</head>
<body>
<!--Focus cursor to textbox and button-->
    <form id="form1" runat="server" defaultfocus="PhoneTextBox" >
    
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
                    <asp:Button ID="NewCustBT" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="New Customer" Width="150px" OnClick="NewCustBT_Click" CausesValidation="False" Font-Bold="True" />
                    <asp:Button ID="printButton0" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="Print" Width="150px" onclientclick="javascript:window.print();" xmlns:asp="#unknown" CausesValidation="False" Font-Bold="True" />
                    <asp:Button ID="homeBT" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="Home" Width="150px" PostBackUrl="~/Default.aspx" CausesValidation="False" Font-Bold="True" />
                </td>
            </tr>
            </table>

<!--Search Controls-->
             <table id="table2">
                <tr>
                    <td class="nameLabel">
                        <br />
                        <asp:Label ID="PhoneLabel" runat="server" Text="Enter Phone" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="nameTextBox">
                        <asp:Label ID="DigitLabel" runat="server" Font-Size="Small" Text="4-digits" Width="180px" Font-Bold="True"></asp:Label>
                        <br />
                        <asp:TextBox ID="PhoneTextBox" runat="server" BackColor="#F3EDE7" AutoPostBack="True" Width="180px"></asp:TextBox>
                    </td>
                    <td class="nameLabel2">
                        <br />
                        <asp:Label ID="FnameLabel" runat="server" Text="Select" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="FnDD">
                        <br />
                    <asp:DropDownList ID="FnDD" runat="server" Width="180px" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name" BackColor="#F3EDE7" AutoPostBack="True">
                        <asp:ListItem Value="name">Search</asp:ListItem>
                    </asp:DropDownList>
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
                        <asp:DetailsView ID="CustDetails" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="CustID" DataSourceID="SqlDataSource2" Height="50px" Width="800px" ForeColor="Black" GridLines="None">
                            <AlternatingRowStyle BackColor="#E6D9CC" />
                            <CommandRowStyle BackColor="#A99583" Font-Bold="True" />
                            <EditRowStyle BackColor="#43382E" />
                            <FieldHeaderStyle BackColor="#A99583" Font-Bold="True" Width="300px" />
                            <Fields>
                                <asp:BoundField DataField="CustID" HeaderText="CustID" InsertVisible="False" ReadOnly="True" SortExpression="CustID" />
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
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Fname") %>'></asp:Label>
                                    </ItemTemplate>
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
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Lname") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="street" HeaderText="Street" SortExpression="street" />
                                <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                <asp:TemplateField HeaderText="State" SortExpression="state">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="stateTB" runat="server" Text='<%# Bind("state") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="stateExpVAl" runat="server" ControlToValidate="stateTB" Font-size="Small" ErrorMessage="2 Letter State Required" ForeColor="#CC3300" ValidationExpression="\b([A-Z]{2}|[a-z]{2})\b"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="stateTB" runat="server" Text='<%# Bind("state") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="stateExpVAl" runat="server" ControlToValidate="stateTB" Font-size="Small" ErrorMessage="2 Letter State Required" ForeColor="#CC3300" ValidationExpression="\b([A-Z]{2}|[a-z]{2})\b"></asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("state") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Zip" SortExpression="zip">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Zip" runat="server" Text='<%# Bind("zip") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="zipExpressionValidator" runat="server" ControlToValidate="Zip" Font-size="Small" ErrorMessage="5-Digit Zip Required" ValidationExpression="\d{5}?" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="Zip" runat="server" Text='<%# Bind("zip") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="zipExpressionValidator" runat="server" ControlToValidate="Zip" Font-size="Small" ErrorMessage="5-Digit Zip Required" ValidationExpression="\d{5}?" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("zip") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Phone" SortExpression="phone">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="phone" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="phoneValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="phone" ForeColor="#CC3300"/>
                                        <asp:RegularExpressionValidator ID="phoneExpressionValidator" runat="server" ControlToValidate="phone" Font-size="Small" ErrorMessage="Format 000-000-0000 Required" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="phone" runat="server" ValidationGroup="VG1" Text='<%# Bind("phone") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="phoneValidator" Font-size="Small" ErrorMessage="Required!" ControlToValidate="phone" ForeColor="#CC3300"/>
                                        <asp:RegularExpressionValidator ID="phoneExpressionValidator" runat="server" ControlToValidate="phone" Font-size="Small" ErrorMessage="Format 000-000-0000 Required" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("phone") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email" SortExpression="email">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="email" runat="server" ValidationGroup="VG1" Text='<%# Bind("email") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="emailExpressionValidator" runat="server" ControlToValidate="email" Font-size="Small" ErrorMessage="Valid Email Required" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="email" runat="server" ValidationGroup="VG1" Text='<%# Bind("email") %>'></asp:TextBox>                                       
                                        <asp:RegularExpressionValidator ID="emailExpressionValidator" runat="server" ControlToValidate="email" Font-size="Small" ErrorMessage="Valid Email Required" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" ValidatonGroup="VG1" CommandName="Update" Text="Update" BackColor="#E6D9CC" Width="75px"/>
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" BackColor="#E6D9CC" Width="75px" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" ValidatonGroup="VG1" CommandName="Insert" Text="Insert"  BackColor="#E6D9CC" Width="75px"/>
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" BackColor="#E6D9CC" Width="75px"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" ValidatonGroup="VG1" CommandName="Edit" Text="Edit" BackColor="#A99583" Width="75px"/>
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
<!--Details View For New Customer Insert-->
           <table id="table9">
            <tr>
               <td>
                  <table id="table6" style="width:100%;">
                      <tr>
                        <td>
                        <asp:DetailsView ID="CustDetails0" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="CustID" DataSourceID="SqlDataSource2" Height="50px" Width="800px" ForeColor="Black" GridLines="None" DefaultMode="Insert" Visible="False">
                            <AlternatingRowStyle BackColor="#F3EDE7" />
                            <CommandRowStyle BackColor="#7A695A" Font-Bold="True" />
                            <EditRowStyle BackColor="#43382E" />
                            <FieldHeaderStyle BackColor="#A99583" Font-Bold="True" Width="300px" />
                            <Fields>
                                <asp:BoundField DataField="CustID" HeaderText="CustID" InsertVisible="False" ReadOnly="True" SortExpression="CustID" />
                                <asp:TemplateField HeaderText="First Name" SortExpression="Fname">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Fname0" runat="server" ValidationGroup="VG1" Text='<%# Bind("Fname") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="FnameValidator0" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Fname0" ForeColor="#CC3300"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="Fname1" runat="server" ValidationGroup="VG1" Text='<%# Bind("Fname") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="FnameValidator1" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Fname1" ForeColor="#CC3300"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Fname") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Last Name" SortExpression="Lname">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Lname0" runat="server" ValidationGroup="VG1" Text='<%# Bind("Lname") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="LnameValidator0" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Lname0" ForeColor="#CC3300"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="Lname1" runat="server" ValidationGroup="VG1" Text='<%# Bind("Lname") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="LnameValidator1" Font-size="Small" ErrorMessage="Required!" ControlToValidate="Lname1" ForeColor="#CC3300"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Lname") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="street" HeaderText="Street" SortExpression="street" />
                                <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                <asp:TemplateField HeaderText="State" SortExpression="state">
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
                                        <asp:TextBox ID="Zip0" runat="server" Text='<%# Bind("zip") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="zipExpressionValidator0" runat="server" ControlToValidate="Zip0" Font-size="Small" ErrorMessage="5-Digit" ValidationExpression="\d{5}?" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="Zip1" runat="server" Text='<%# Bind("zip") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="zipExpressionValidator1" runat="server" ControlToValidate="Zip1" Font-size="Small" ErrorMessage="5-Digit" ValidationExpression="\d{5}?" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("zip") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Phone" SortExpression="phone">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="phone0" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="phoneValidator0" Font-size="Small" ErrorMessage="Required!" ControlToValidate="phone0" ForeColor="#CC3300"/>
                                        <asp:RegularExpressionValidator ID="phoneExpressionValidator0" runat="server" ControlToValidate="phone0" Font-size="Small" ErrorMessage="Format 000-000-0000" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="phone1" runat="server" ValidationGroup="VG1" Text='<%# Bind("phone") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="phoneValidator1" Font-size="Small" ErrorMessage="Required!" ControlToValidate="phone1" ForeColor="#CC3300"/>
                                        <asp:RegularExpressionValidator ID="phoneExpressionValidator1" runat="server" ControlToValidate="phone1" Font-size="Small" ErrorMessage="Format 000-000-0000" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("phone") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email" SortExpression="email">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="email0" runat="server" ValidationGroup="VG1" Text='<%# Bind("email") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="emailExpressionValidator0" runat="server" ControlToValidate="email0" Font-size="Small" ErrorMessage="Enter Valid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="email1" runat="server" ValidationGroup="VG1" Text='<%# Bind("email") %>'></asp:TextBox>                                       
                                        <asp:RegularExpressionValidator ID="emailExpressionValidator1" runat="server" ControlToValidate="email1" Font-size="Small" ErrorMessage="Enter Valid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#CC3300"></asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:Button ID="Button3" runat="server" CausesValidation="True" ValidatonGroup="VG1" CommandName="Update" Text="Update" BackColor="#E6D9CC" Width="75px"/>
                                        &nbsp;<asp:Button ID="Button4" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" BackColor="#E6D9CC" Width="75px"/>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:Button ID="Button5" runat="server" CausesValidation="True" ValidatonGroup="VG1" CommandName="Insert" Text="Insert" BackColor="#E6D9CC" Width="75px" />
                                        &nbsp;<asp:Button ID="Button6" runat="server" CausesValidation="False" CommandName="Cancel" Text="Clear" BackColor="#E6D9CC" Width="75px"/>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="Button7" runat="server" CausesValidation="False" ValidatonGroup="VG1" CommandName="Edit" Text="Edit" BackColor="#43382E" Width="75px"/>
                                        &nbsp;<asp:Button ID="Button8" runat="server" CausesValidation="False" CommandName="New" Text="New" BackColor="#43382E" Width="75px"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <FooterStyle BackColor="#A99583" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#A99583" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#A99583" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#43382E" />
                        </asp:DetailsView>
                        </td>
                        </tr>
                        </table>
                        </td>
                        </tr>
                        </table>
                         
                       
<!--GridView For View All Customers-->
       <table id="table7">
            <tr>
               <td>
                  <table id="table8" style="width:100%;">
                      <tr>
                        <td>        
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CustID" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="1200px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Visible="False" Font-Size="Small">
                            <AlternatingRowStyle BackColor="#A99583" />
                            <Columns>
                                <asp:BoundField DataField="CustID" HeaderText="CustID" InsertVisible="False" ReadOnly="True" SortExpression="CustID">
                                </asp:BoundField>
                                <asp:BoundField DataField="Fname" HeaderText="First Name" SortExpression="Fname" >
                                </asp:BoundField>
                                <asp:BoundField DataField="Lname" HeaderText="Last Name" SortExpression="Lname" >
                                </asp:BoundField>
                                <asp:BoundField DataField="street" HeaderText="Street" SortExpression="street" >
                                </asp:BoundField>
                                <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                <asp:BoundField DataField="zip" HeaderText="Zip" SortExpression="zip" />
                                <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" />
                                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
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
                        </div>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="VG1" ShowMessageBox="True" />
                    

<!--DataSource 1 For DropDownList Control-->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT (Fname + ' ' + Lname)as name FROM Customers  WHERE ([phone] LIKE '%' + @phone + '%')ORDER BY Lname ASC">
            <SelectParameters>
                <asp:ControlParameter ControlID="PhoneTextBox" Name="phone" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

<!--DataSource 2 For Both Details View (Customer Report and Insert)-->
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
            SelectCommand="SELECT DISTINCT * FROM [Customers] WHERE (Fname + ' ' + Lname)= @fulllnamedropdown"
            InsertCommand="INSERT INTO [Customers] ([Fname], [Lname], [street], [city], [zip], [phone], [email], [state]) VALUES (@Fname, @Lname, @street, @city, @zip, @phone, @email, UPPER(@state))"
            Updatecommand="UPDATE [Customers] SET [Fname] = @Fname, [Lname] = @Lname, [street] = @street, [city] = @city, [zip] = @zip, [phone] = @phone, [email] = @email, [state] = UPPER(@state) WHERE [CustID] = @CustID">
            <SelectParameters>
                <asp:ControlParameter ControlID="FnDD" Name="fulllnamedropdown" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="Fname" Type="String" />
                <asp:Parameter Name="Lname" Type="String" />
                <asp:Parameter Name="street" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="zip" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="state" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Fname" Type="String" />
                <asp:Parameter Name="Lname" Type="String" />
                <asp:Parameter Name="street" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="zip" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="state" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

<!--DataSource 3 For GridView View All Customers-->
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
            SelectCommand="SELECT DISTINCT * FROM [Customers] ORDER BY [Lname]">
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>


        
