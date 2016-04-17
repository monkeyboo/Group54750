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
         ' If Session("user") IsNot "employee" Then
         'Response.Redirect("login.aspx")
         'End If
     End Sub
    
     'New Report Button Event 
     Protected Sub reportButton_Click(sender As Object, e As EventArgs)
        GridView1.Visible = True
        GridView3.Visible = False
        GridView1.DataBind()
     End Sub
    
     'View All Report Button Event           
     Protected Sub viewAllButton_Click(sender As Object, e As EventArgs)
        GridView3.Visible = True
        GridView1.Visible = False
        GridView1.DataBind()
     End Sub
    
     

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs)
        DetailsView1.Visible = True
    End Sub

    Protected Sub GridView3_SelectedIndexChanged(sender As Object, e As EventArgs)
        DetailsView2.Visible = True
    End Sub
    
    Protected Sub GridView1_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs)
        'Indicate whether the update operation succeeded.
        If e.Exception Is Nothing Then

            Message.Text = "Row updated successfully!"

        Else

            e.ExceptionHandled = True
            Message.Text = "An error occurred while attempting to update the row."

        End If

    End Sub
   
    Protected Sub GridView3_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs)
        'Indicate whether the update operation succeeded.
        If e.Exception Is Nothing Then

            Message.Text = "Row updated successfully!"

        Else

            e.ExceptionHandled = True
            Message.Text = "An error occurred while attempting to update the row."

        End If

    End Sub
    
    Protected Sub Button_Click_Event(sender As Object, e As EventArgs)
        DetailsLabel.Visible = True
    End Sub
    
    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        Session.RemoveAll()
        Response.Redirect("login.aspx")
    End Sub

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs)

    End Sub
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Customers</title>
    <link href="EmployeeReport2.css" rel="stylesheet" type="text/css" />


    </head>
<body>
<!--Focus cursor to textbox and button-->
    <form id="form1" runat="server" defaultfocus="TextBox2" >
    
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
                    <asp:Button ID="printButton0" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="Print" Width="150px" onclientclick="javascript:window.print();" xmlns:asp="#unknown" CausesValidation="False" Font-Bold="True" />
                    <asp:Button ID="homeBT" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="60px" Text="Home" Width="150px" PostBackUrl="~/Default.aspx" CausesValidation="False" Font-Bold="True" />
                </td>
            </tr>
            </table>

<!--Search Controls-->
           <table id="table12">
            <tr>
               <td>
                  <table id="table13" style="width:100%;">
                      <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Start Date" Font-Bold="True"></asp:Label>
         <asp:TextBox ID="TextBox2" runat="server" BackColor="#F3EDE7"></asp:TextBox>
         <asp:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" BehaviorID="TextBox2_CalendarExtender" TargetControlID="TextBox2" PopupPosition="BottomRight" />
                   <asp:Label ID="Label2" runat="server" Text="End Date" Font-Bold="True"></asp:Label>
             <asp:TextBox ID="TextBox3" runat="server" BackColor="#F3EDE7"></asp:TextBox>
             <asp:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" BehaviorID="TextBox3_CalendarExtender" TargetControlID="TextBox3" PopupPosition="BottomRight" />
                        </td>
                        </tr>
                        </table>
                        </td>
                        </tr>
                        </table>
<!--Details View For Orders-->
           <table id="tableErrorMessage">
            <tr>
               <td>
                  <table id="tableErrorMessage2" style="width:100%;">
                      <tr>
                        <td>
                            <asp:label id="Message"
                                forecolor="black"          
                                runat="server"/>
                            <br />
                            <asp:label id="DetailsLabel"
                                forecolor="Black"          
                                runat="server" Font-Bold="True" Font-Size="Large" Visible="False">Order Details</asp:Label>
                            <br />
                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#A99583" DataKeyNames="OrderID,ItemID" 
                                DataSourceID="SqlDataSource1" Height="50px" Width="200px" Visible="False" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                                <AlternatingRowStyle BackColor="#E6D9CC" />
                                <EditRowStyle BackColor="#A99583" Font-Bold="True" ForeColor="White" />
                                <Fields>
                                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
                                    <asp:BoundField DataField="ItemID" HeaderText="ItemID" ReadOnly="True" SortExpression="ItemID" />
                                    <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                                    <asp:TemplateField HeaderText="unitprice" SortExpression="unitprice">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("unitprice") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("unitprice") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("unitprice", "{0:c}")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Fields>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#A99583" />
                            </asp:DetailsView>
                            <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" BackColor="White" DataKeyNames="OrderID,ItemID" DataSourceID="SqlDataSource5" Height="50px" Width="200px" Visible="False" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                                <AlternatingRowStyle BackColor="#E6D9CC" />
                                <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <Fields>
                                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
                                    <asp:BoundField DataField="ItemID" HeaderText="ItemID" ReadOnly="True" SortExpression="ItemID" />
                                    <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                                    <asp:TemplateField HeaderText="unitprice" SortExpression="unitprice">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("unitprice") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("unitprice") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("unitprice", "{0:c}")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Fields>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#A99583" />
                            </asp:DetailsView>
                        </td>
                        </tr>
                        </table>
                        </td>
                        </tr>
                        </table>
                         
                       
<!--GridView For View All Customers-->
       <table id="table14">
            <tr>
               <td>
                  <table id="table15" style="width:100%;">
                      <tr>
                        <td>        
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="SqlDataSource3" 
                            OnRowUpdated="GridView1_RowUpdated" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="650px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Font-Size="Small" PageSize="25" Visible="False">
                            <AlternatingRowStyle BackColor="#A99583" />
                            <Columns>
                                
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:Button ID="Update" runat="server" CausesValidation="True" CommandName="Update" Text="Update" Backcolor="#7A695A" ForeColor="#E6D9CC"></asp:Button>
                                        &nbsp;<asp:Button ID="Cancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" Backcolor="#7A695A" ForeColor="#E6D9CC"></asp:Button>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="Edit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" Backcolor="#7A695A" ForeColor="#E6D9CC" />
                                        <asp:Button ID="Select" OnClick="Button_Click_Event" runat="server" CausesValidation="False" CommandName="Select" Text="Select" Backcolor="#7A695A" ForeColor="#E6D9CC" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID">
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Date" SortExpression="date">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("date", "{0:MM/dd/yy}")%>' ReadOnly="True"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("date", "{0:MM/dd/yy}")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CheckBoxField DataField="checkin" HeaderText="Checked In" SortExpression="checkin" />
                            </Columns>
                            <FooterStyle BackColor="#43382E" />
                            <HeaderStyle BackColor="#A99583" Font-Bold="True" ForeColor="Black" Width="10px" />
                            <PagerStyle BackColor="#E6D9CC" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#E6D9CC" />
                            <SelectedRowStyle BackColor="#43382E" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                            <SortedAscendingHeaderStyle BackColor="#848384" />
                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                            <SortedDescendingHeaderStyle BackColor="#575357" />

                        </asp:GridView>
                        </td>
                        <td>        
                            &nbsp;</td>
                        </tr>
                        </table>
                        </td>
                        </tr>
            <tr>
               <td>
                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="SqlDataSource4" 
                            OnRowUpdated="GridView3_RowUpdated" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" Width="650px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Font-Size="Small" PageSize="25" Visible="False">
                            <AlternatingRowStyle BackColor="#A99583" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:Button ID="Update" runat="server" CausesValidation="True" CommandName="Update" Text="Update" Backcolor="#7A695A" ForeColor="#E6D9CC"></asp:Button>
                                        &nbsp;<asp:Button ID="Cancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" Backcolor="#7A695A" ForeColor="#E6D9CC"></asp:Button>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="Edit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" Backcolor="#7A695A" ForeColor="#E6D9CC" />
                                        <asp:Button ID="Select" OnClick="Button_Click_Event" runat="server" CausesValidation="False" CommandName="Select" Text="Select" Backcolor="#7A695A" ForeColor="#E6D9CC" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID">
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Date" SortExpression="date">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("date", "{0:MM/dd/yy}")%>' ReadOnly="True"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("date", "{0:MM/dd/yy}")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CheckBoxField DataField="checkin" HeaderText="Checked In" SortExpression="checkin" />
                            </Columns>
                            <FooterStyle BackColor="#43382E" />
                            <HeaderStyle BackColor="#A99583" Font-Bold="True" ForeColor="Black" Width="10px" />
                            <PagerStyle BackColor="#E6D9CC" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#E6D9CC" />
                            <SelectedRowStyle BackColor="#43382E" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                            <SortedAscendingHeaderStyle BackColor="#848384" />
                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                            <SortedDescendingHeaderStyle BackColor="#575357" />
                        </asp:GridView>
                        </td>
                        </tr>
                        </table> 
                        </div>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="VG1" ShowMessageBox="True" />
                    

<!--DataSource 1 For DropDownList Control-->
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

<!--DataSource 2 For Both Details View (Customer Report and Insert)-->

<!--DataSource 3 For GridView View All Customers-->
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" DeleteCommand="DELETE FROM [Orders] WHERE [OrderID] = @OrderID" InsertCommand="INSERT INTO [Orders] ([date], [checkin]) VALUES (@date, @checkin)" SelectCommand="SELECT * FROM [Orders] ORDER BY [date] DESC" UpdateCommand="UPDATE [Orders] SET [date] = @date, [checkin] = @checkin WHERE [OrderID] = @OrderID">
                            <DeleteParameters>
                                <asp:Parameter Name="OrderID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter DbType="Date" Name="date" />
                                <asp:Parameter Name="checkin" Type="Boolean" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter DbType="Date" Name="date" />
                                <asp:Parameter Name="checkin" Type="Boolean" />
                                <asp:Parameter Name="OrderID" Type="Int32" />
                            </UpdateParameters>
                   </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" DeleteCommand="DELETE FROM [Orders] WHERE [OrderID] = @OrderID" InsertCommand="INSERT INTO [Orders] ([date], [checkin]) VALUES (@date, @checkin)" SelectCommand="SELECT * FROM [Orders] WHERE (([date] &gt;= @date) AND ([date] &lt;= @date2)) ORDER BY [date] DESC" UpdateCommand="UPDATE [Orders] SET [date] = @date, [checkin] = @checkin WHERE [OrderID] = @OrderID">
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="date" />
                <asp:Parameter Name="checkin" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox2" DbType="Date" Name="date" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox3" DbType="Date" Name="date2" PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="date" />
                <asp:Parameter Name="checkin" Type="Boolean" />
                <asp:Parameter Name="OrderID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" 
                            ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
                            DeleteCommand="DELETE FROM [OrderDetails] WHERE [OrderID] = @original_OrderID AND [ItemID] = @original_ItemID AND [quantity] = @original_quantity AND [unitprice] = @original_unitprice" 
                            InsertCommand="INSERT INTO [OrderDetails] ([OrderID], [ItemID], [quantity], [unitprice]) VALUES (@OrderID, @ItemID, @quantity, @unitprice)" 
                            OldValuesParameterFormatString="original_{0}" OnSelecting="SqlDataSource1_Selecting" 
                            SelectCommand="SELECT * FROM [OrderDetails] WHERE ([OrderID] = @OrderID)" 
                            UpdateCommand="UPDATE [OrderDetails] SET [quantity] = @quantity, [unitprice] = @unitprice WHERE [OrderID] = @original_OrderID AND [ItemID] = @original_ItemID AND [quantity] = @original_quantity AND [unitprice] = @original_unitprice">
                            <DeleteParameters>
                                <asp:Parameter Name="original_OrderID" Type="Int32" />
                                <asp:Parameter Name="original_ItemID" Type="Int32" />
                                <asp:Parameter Name="original_quantity" Type="Int32" />
                                <asp:Parameter Name="original_unitprice" Type="Decimal" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="OrderID" Type="Int32" />
                                <asp:Parameter Name="ItemID" Type="Int32" />
                                <asp:Parameter Name="quantity" Type="Int32" />
                                <asp:Parameter Name="unitprice" Type="Decimal" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridView1" Name="OrderID" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="quantity" Type="Int32" />
                                <asp:Parameter Name="unitprice" Type="Decimal" />
                                <asp:Parameter Name="original_OrderID" Type="Int32" />
                                <asp:Parameter Name="original_ItemID" Type="Int32" />
                                <asp:Parameter Name="original_quantity" Type="Int32" />
                                <asp:Parameter Name="original_unitprice" Type="Decimal" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConflictDetection="CompareAllValues" 
                            ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
                            DeleteCommand="DELETE FROM [OrderDetails] WHERE [OrderID] = @original_OrderID AND [ItemID] = @original_ItemID AND [quantity] = @original_quantity AND [unitprice] = @original_unitprice" 
                            InsertCommand="INSERT INTO [OrderDetails] ([OrderID], [ItemID], [quantity], [unitprice]) VALUES (@OrderID, @ItemID, @quantity, @unitprice)" 
                            OldValuesParameterFormatString="original_{0}"  
                            SelectCommand="SELECT * FROM [OrderDetails] WHERE ([OrderID] = @OrderID)" 
                            UpdateCommand="UPDATE [OrderDetails] SET [quantity] = @quantity, [unitprice] = @unitprice WHERE [OrderID] = @original_OrderID AND [ItemID] = @original_ItemID AND [quantity] = @original_quantity AND [unitprice] = @original_unitprice">
                            <DeleteParameters>
                                <asp:Parameter Name="original_OrderID" Type="Int32" />
                                <asp:Parameter Name="original_ItemID" Type="Int32" />
                                <asp:Parameter Name="original_quantity" Type="Int32" />
                                <asp:Parameter Name="original_unitprice" Type="Decimal" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="OrderID" Type="Int32" />
                                <asp:Parameter Name="ItemID" Type="Int32" />
                                <asp:Parameter Name="quantity" Type="Int32" />
                                <asp:Parameter Name="unitprice" Type="Decimal" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridView3" Name="OrderID" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="quantity" Type="Int32" />
                                <asp:Parameter Name="unitprice" Type="Decimal" />
                                <asp:Parameter Name="original_OrderID" Type="Int32" />
                                <asp:Parameter Name="original_ItemID" Type="Int32" />
                                <asp:Parameter Name="original_quantity" Type="Int32" />
                                <asp:Parameter Name="original_unitprice" Type="Decimal" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
        <br />
        <br />
        <br />
    </form>
</body>
</html>


        
