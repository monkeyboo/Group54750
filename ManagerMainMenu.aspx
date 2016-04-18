<%@ Page Language="VB" AutoEventWireup="true" %>

<!DOCTYPE html>
<script runat="server">
    
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        ' If Session("user") IsNot "manager" Then
        'Response.Redirect("login.aspx")
        'End If
        DetailsView1.DefaultMode = DetailsViewMode.Insert
        DetailsView2.DefaultMode = DetailsViewMode.Edit
        
    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        Session.RemoveAll()
        Response.Redirect("login.aspx")
    End Sub

    Protected Sub Button14_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub Button21_Click(sender As Object, e As EventArgs)

    End Sub
    Protected Sub DetailsView1_ItemUpdated(sender As Object, e As DetailsViewUpdatedEventArgs) Handles DetailsView2.ItemUpdated
        'Indicate whether the update operation succeeded.
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occured. " &
                e.ExceptionHandled = True
            e.KeepInEditMode = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "You are already clocked out. You must clock in first. " &
                "Please try again."
        Else
            Session.RemoveAll()
            Response.Redirect("login.aspx")
          
        End If
    End Sub

    Protected Sub DetailsView1_ItemInserted(sender As Object, e As DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        'Indicate whether the update operation succeeded.
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occured. "
            e.ExceptionHandled = True
            e.KeepInInsertMode = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "You are already clocked in."
        Else
            lblError.Text = "Clocked In. Welcome!"
          
        End If
    
    End Sub
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Manager Menu</title>
    <link href="main.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    
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
        <br />
        
<div id="main" class="container2">
       <table id="tableErrorMessage2" style="width:100%; margin:auto;">
                      <tr>
                        <td>
                            <asp:Label ID="lblError" runat="server" EnableViewState="False"
                                CssClass="error" Font-Bold="True" Font-Size="Small"></asp:Label>
                        </td>
                        </tr>
                        </table>
                        
        <table align="center" class="mainTable">
            <tr>
                <td >
                    <asp:Button ID="CustomersButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Customers" Width="170px" PostBackUrl="~/ManagerCustomer.aspx" Font-Bold="True" />
                </td>
                <td>
                    <asp:Button ID="AppointmentsButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Appointments" Width="170px" PostBackUrl="~/ManagerAppointments.aspx" Font-Bold="True" />
                </td>
                <td >
                    <asp:Button ID="PriceListButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Price List" Width="170px" Font-Bold="True" OnClick="Button14_Click" />
                </td>
                <td>
                    <asp:Button ID="ManagerFButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="My Details" Width="170px" Font-Bold="True" />
                </td>
                <td>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
                <Fields>
            
                    <asp:TemplateField ShowHeader="False">
                        <InsertItemTemplate>
                            <asp:Button ID="LinkButton2" runat="server"  CommandName="Insert"  BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Clock In" Width="170px" Font-Bold="True" />
                            
                        </InsertItemTemplate>
                     
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
           
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="SalesTicketButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Sales Ticket" Width="170px" PostBackUrl="~/SalesTicket.aspx" Font-Bold="True" />
                </td>
                <td >
                    <asp:Button ID="InventoryButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Inventory" Width="170px" Font-Bold="True" />
                </td>
                <td>
                    <asp:Button ID="MyDetailsButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Employees" Width="170px" PostBackUrl="~/Employee.aspx" Font-Bold="True" />
                </td>
                <td>
                    <asp:Button ID="Button26" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Management Funct." Width="170px" PostBackUrl="~/ManagementFunctions.aspx" Font-Bold="True" />
                </td>
                <td>
               <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource1" Height="50px" Width="125px" DefaultMode="Edit"> 
                <Fields>
            
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="LinkButton3" runat="server"  CommandName="Update"  BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Clock Out" Width="170px" Font-Bold="True" />
                            
                        </EditItemTemplate>
                     
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
                </td>
            </tr>
          </table>
        </div>
      <br />      
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:4750group5ConnectionString %>" 
                SelectCommand="SELECT [EmpID], [date], [timeIN] FROM [Timesheets]"
                InsertCommand="INSERT INTO Timesheets(EmpID, date, timeIN) 
select @empid, (select convert(nvarchar,getdate(),101)), (select format(dateadd(hour,-5,getdate()),'hh:mmtt'))
where  not exists (select empid, [date] from timesheets where empid = @empid and [date] = (select convert(nvarchar,getdate(),101)) and timeout is null)"
                UpdateCommand="update timesheets set [timeout] = (select format(dateadd(hour,-5,getdate()),'hh:mmtt')) where empid = @empid and [timeout] is null" >
                   <InsertParameters>
                <asp:SessionParameter Name="empid" SessionField="id" />
            </InsertParameters>
                     <UpdateParameters>
                <asp:SessionParameter Name="empid" SessionField="id" />
               
          
            </UpdateParameters>
            </asp:SqlDataSource>
    </form>
</body>
</html>
