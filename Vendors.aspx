<%@ Page Language="VB" AutoEventWireup="false" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Web.Services" %>
<%@ Import Namespace="System.Drawing.Printing"%>

<!DOCTYPE html>
<script runat="server">
    Protected Sub Page_Load(sender As Object, e As EventArgs)
       
    End Sub
    
    'New Report Button Event 
    Protected Sub reportButton_Click(sender As Object, e As EventArgs)
        CustDetails.Visible = True
        ' CustDetails0.Visible = False
        'GridView1.Visible = False
        FnDD.Visible = True
        FnameLabel.Visible = True
        PhoneLabel.Visible = True
        PhoneTextBox.Visible = True
        DigitLabel.Visible = True
        'GridView1.DataBind()
        'FnDD.DataBind()
        
    End Sub
    
    'View All Report Button Event           
    Protected Sub viewAllButton_Click(sender As Object, e As EventArgs)
        'GridView1.Visible = True
        CustDetails.Visible = False
        'CustDetails0.Visible = False
        PhoneTextBox.Visible = False
        PhoneLabel.Visible = False
        FnameLabel.Visible = False
        FnDD.Visible = False
        DigitLabel.Visible = False
        ' GridView1.DataBind()
    End Sub
    
    'Add New Customer Button Event
    Protected Sub NewCustBT_Click(sender As Object, e As EventArgs)
        'CustDetails0.Visible = True
        CustDetails.Visible = False
        ' GridView1.Visible = False
        PhoneTextBox.Visible = False
        PhoneLabel.Visible = False
        FnameLabel.Visible = False
        FnDD.Visible = False
        DigitLabel.Visible = False
        ' GridView1.DataBind()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs)

    End Sub

    Protected Sub FnDD_SelectedIndexChanged(sender As Object, e As EventArgs)

    End Sub
    
    
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Customers</title>
    <link href="EmployeeReport.css" rel="stylesheet" type="text/css" />


    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
    </style>


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
                    <asp:Button ID="reportButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="Search" Width="150px" OnClick="reportButton_Click" CausesValidation="False" Font-Bold="True" />
                    <asp:Button ID="viewAllButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="*View All" Width="150px" OnClick="viewAllButton_Click" Font-Bold="True" Font-Size="Small" Font-Underline="False" CausesValidation="False" />
                    <asp:Button ID="NewVendorBT" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="New Vendor" Width="150px" OnClick="NewCustBT_Click" CausesValidation="False" Font-Bold="True" />
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
                        <asp:Label ID="PhoneLabel" runat="server" Text="Vendor Name" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="nameTextBox">
                        <asp:Label ID="DigitLabel" runat="server" Font-Size="Small" Width="180px" Font-Bold="True"></asp:Label>
                        <br />
                        <asp:TextBox ID="PhoneTextBox" runat="server" BackColor="#F3EDE7" AutoPostBack="True" Width="180px"></asp:TextBox>
                    </td>
                    <td class="nameLabel2">
                        <br />
                        <asp:Label ID="FnameLabel" runat="server" Text="Select" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="FnDD">
                        <br />
                    <asp:DropDownList ID="FnDD" runat="server" Width="180px" DataSourceID="SqlDataSource1" DataTextField="VendName" DataValueField="VendName" BackColor="#F3EDE7" AutoPostBack="True" OnSelectedIndexChanged="FnDD_SelectedIndexChanged">
                        <asp:ListItem Value="name">Search</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                </tr>
            </table>

<!--Details View For Customer Search-->
           <table id="table4">
            <tr>
               <td>
                  <table id="table5" style="width:100%;">
                      <tr>
                        <td>
                        <asp:DetailsView ID="CustDetails" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="VendID" DataSourceID="SqlDataSource2" Height="50px" Width="1100px" ForeColor="Black" GridLines="None">
                            <AlternatingRowStyle BackColor="#E6D9CC" />
                            <CommandRowStyle BackColor="#A99583" Font-Bold="True" />
                            <EditRowStyle BackColor="#43382E" />
                            <FieldHeaderStyle BackColor="#A99583" Font-Bold="True" />
                            <Fields>
                                <asp:BoundField DataField="VendID" HeaderText="VendID" InsertVisible="False" ReadOnly="True" SortExpression="VendID" />
                                <asp:BoundField DataField="VendName" HeaderText="VendName" SortExpression="VendName" />
                                <asp:BoundField DataField="ContactFname" HeaderText="ContactFname" SortExpression="ContactFname" />
                                <asp:BoundField DataField="ContactLname" HeaderText="ContactLname" SortExpression="ContactLname" />
                                <asp:BoundField DataField="street" HeaderText="street" SortExpression="street" />
                                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                                <asp:BoundField DataField="zip" HeaderText="zip" SortExpression="zip" />
                                <asp:BoundField DataField="country" HeaderText="country" SortExpression="country" />
                                <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
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
 <table id="table3">
            <tr>
               <td>
                  <table id="table6" style="width:100%;">
                      <tr>
                        <td class="auto-style1">

                            <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="VendID" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical">
                                <EditItemTemplate>
                                    VendID:
                                    <asp:Label ID="VendIDLabel1" runat="server" Text='<%# Eval("VendID") %>' />
                                    <br />
                                    VendName:
                                    <asp:TextBox ID="VendNameTextBox" runat="server" Text='<%# Bind("VendName") %>' />
                                    <br />
                                    ContactFname:
                                    <asp:TextBox ID="ContactFnameTextBox" runat="server" Text='<%# Bind("ContactFname") %>' />
                                    <br />
                                    ContactLname:
                                    <asp:TextBox ID="ContactLnameTextBox" runat="server" Text='<%# Bind("ContactLname") %>' />
                                    <br />
                                    street:
                                    <asp:TextBox ID="streetTextBox" runat="server" Text='<%# Bind("street") %>' />
                                    <br />
                                    city:
                                    <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>' />
                                    <br />
                                    zip:
                                    <asp:TextBox ID="zipTextBox" runat="server" Text='<%# Bind("zip") %>' />
                                    <br />
                                    country:
                                    <asp:TextBox ID="countryTextBox" runat="server" Text='<%# Bind("country") %>' />
                                    <br />
                                    phone:
                                    <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                                    <br />
                                    State:
                                    <asp:DropDownList ID="StateTextBox" runat="server" 
                                                      Text='<%# Bind("State") %>' DataSourceID="SqlDataSource4" DataTextField="state" DataValueField="state" />
                                       
                                    
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT [state] FROM [statelist]"></asp:SqlDataSource>
                                       
                                    
                                    <br />
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <InsertItemTemplate>
                                    VendName:
                                    <asp:TextBox ID="VendNameTextBox" runat="server" Text='<%# Bind("VendName") %>' />
                                    <br />
                                    ContactFname:
                                    <asp:TextBox ID="ContactFnameTextBox" runat="server" Text='<%# Bind("ContactFname") %>' />
                                    <br />
                                    ContactLname:
                                    <asp:TextBox ID="ContactLnameTextBox" runat="server" Text='<%# Bind("ContactLname") %>' />
                                    <br />
                                    street:
                                    <asp:TextBox ID="streetTextBox" runat="server" Text='<%# Bind("street") %>' />
                                    <br />
                                    city:
                                    <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>' />
                                    <br />
                                    zip:
                                    <asp:TextBox ID="zipTextBox" runat="server" Text='<%# Bind("zip") %>' />
                                    <br />
                                    country:
                                    <asp:TextBox ID="countryTextBox" runat="server" Text='<%# Bind("country") %>' />
                                    <br />
                                    phone:
                                    <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                                    <br />
                                    State:
                                    <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                                    <br />
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    VendID:
                                    <asp:Label ID="VendIDLabel" runat="server" Text='<%# Eval("VendID") %>' />
                                    <br />
                                    VendName:
                                    <asp:Label ID="VendNameLabel" runat="server" Text='<%# Bind("VendName") %>' />
                                    <br />
                                    ContactFname:
                                    <asp:Label ID="ContactFnameLabel" runat="server" Text='<%# Bind("ContactFname") %>' />
                                    <br />
                                    ContactLname:
                                    <asp:Label ID="ContactLnameLabel" runat="server" Text='<%# Bind("ContactLname") %>' />
                                    <br />
                                    street:
                                    <asp:Label ID="streetLabel" runat="server" Text='<%# Bind("street") %>' />
                                    <br />
                                    city:
                                    <asp:Label ID="cityLabel" runat="server" Text='<%# Bind("city") %>' />
                                    <br />
                                    zip:
                                    <asp:Label ID="zipLabel" runat="server" Text='<%# Bind("zip") %>' />
                                    <br />
                                    country:
                                    <asp:Label ID="countryLabel" runat="server" Text='<%# Bind("country") %>' />
                                    <br />
                                    phone:
                                    <asp:Label ID="phoneLabel" runat="server" Text='<%# Bind("phone") %>' />
                                    <br />
                                    State:
                                    <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
                                    <br />
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                                </ItemTemplate>
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" />
                            </asp:FormView>

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
                            
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="VendID" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Vertical">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:BoundField DataField="VendID" HeaderText="VendID" InsertVisible="False" ReadOnly="True" SortExpression="VendID" />
                                    <asp:BoundField DataField="VendName" HeaderText="VendName" SortExpression="VendName" />
                                    <asp:BoundField DataField="ContactFname" HeaderText="ContactFname" SortExpression="ContactFname" />
                                    <asp:BoundField DataField="ContactLname" HeaderText="ContactLname" SortExpression="ContactLname" />
                                    <asp:BoundField DataField="street" HeaderText="street" SortExpression="street" />
                                    <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                                    <asp:BoundField DataField="zip" HeaderText="zip" SortExpression="zip" />
                                    <asp:BoundField DataField="country" HeaderText="country" SortExpression="country" />
                                    <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#F7F7DE" />
                                <RowStyle BackColor="#F7F7DE" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" SelectCommand="SELECT [VendName] FROM [Vendors] WHERE ([VendName] LIKE '%' + @VendName + '%') ORDER BY [VendName]">
            <SelectParameters>
                <asp:ControlParameter ControlID="PhoneTextBox" Name="VendName" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

<!--DataSource 2 Details View (Vendor Report and Insert)-->
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
            SelectCommand="SELECT * FROM [Vendors] WHERE ([VendName] = @VendName)"
            InsertCommand="INSERT INTO [Vendors] ([VendName], [ContactFname], [ContactLname], [street], [city], [zip], [country], [phone], [State]) VALUES (@VendName, @ContactFname, @ContactLname, @street, @city, @zip, @country, @phone, @State)"
            Updatecommand="UPDATE [Vendors] SET [VendName] = @VendName, [ContactFname] = @ContactFname, [ContactLname] = @ContactLname, [street] = @street, [city] = @city, [zip] = @zip, [country] = @country, [phone] = @phone, [State] = @State WHERE [VendID] = @VendID" DeleteCommand="DELETE FROM [Vendors] WHERE [VendID] = @VendID">
            <SelectParameters>
                <asp:ControlParameter ControlID="FnDD" Name="VendName" PropertyName="SelectedValue" Type="String" />
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

<!--DataSource 3 For GridView View All Customers-->
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
            SelectCommand="SELECT * FROM [Vendors] ORDER BY [VendName]" DeleteCommand="DELETE FROM [Vendors] WHERE [VendID] = @VendID" InsertCommand="INSERT INTO [Vendors] ([VendName], [ContactFname], [ContactLname], [street], [city], [zip], [country], [phone], [State]) VALUES (@VendName, @ContactFname, @ContactLname, @street, @city, @zip, @country, @phone, @State)" UpdateCommand="UPDATE [Vendors] SET [VendName] = @VendName, [ContactFname] = @ContactFname, [ContactLname] = @ContactLname, [street] = @street, [city] = @city, [zip] = @zip, [country] = @country, [phone] = @phone, [State] = @State WHERE [VendID] = @VendID">
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


        
