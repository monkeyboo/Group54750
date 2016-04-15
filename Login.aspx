<%@ Page Language="VB" AutoEventWireup="false" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Web.Services" %>
<%@ Import Namespace="System.Drawing.Printing"%>
<%@ Import Namespace="System.Web.Security"%>



<!DOCTYPE html>
<script runat="server">
    
    
        
    Protected Sub Page_Load(sender As Object, e As EventArgs)
       
    End Sub
       
    Private Function ValidateUser(ByVal userName As String, ByVal passWord As String) As Boolean
        Dim conn As SqlConnection
        Dim cmd As SqlCommand
        Dim lookupPassword As String

        lookupPassword = Nothing

        ' Check for an invalid userName.
        ' userName  must not be set to nothing and must be between one and 15 characters.
        If ((userName Is Nothing)) Then
            System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of userName failed.")
            Return False
        End If
        If ((userName.Length = 0) Or (userName.Length > 15)) Then
            System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of userName failed.")
            Return False
        End If

        ' Check for invalid passWord.
        ' passWord must not be set to nothing and must be between one and 25 characters.
        If (passWord Is Nothing) Then
            System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of passWord failed.")
            Return False
        End If
        If ((passWord.Length = 0) Or (passWord.Length > 25)) Then
            System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of passWord failed.")
            Return False
        End If

        Try
            ' Consult with your SQL Server administrator for an appropriate connection
            ' string to use to connect to your local SQL Server.
            conn = New SqlConnection("Data Source=4750group5.database.windows.net;Initial Catalog=4750group5;User ID=rchapman3;Password=Rmc013076:")
            conn.Open()

            ' Create SqlCommand to select pwd field from the users table given a supplied userName.
            cmd = New SqlCommand("Select password from employees where empid=@userName and jobtitleid=2", conn)
            cmd.Parameters.Add("@userName", SqlDbType.VarChar, 25)
            cmd.Parameters("@userName").Value = userName

            ' Execute command and fetch pwd field into lookupPassword string.
            lookupPassword = cmd.ExecuteScalar()

            ' Cleanup command and connection objects.
            cmd.Dispose()
            conn.Dispose()
        Catch ex As Exception
            ' Add error handling here for debugging.
            ' This error message should not be sent back to the caller.
            System.Diagnostics.Trace.WriteLine("[ValidateUser] Exception " & ex.Message)
        End Try

        ' If no password found, return false.
        If (lookupPassword Is Nothing) Then
            ' You could write failed login attempts here to the event log for additional security.
            Return False
        End If

        ' Compare lookupPassword and input passWord by using a case-sensitive comparison.
        Return (String.Compare(lookupPassword, passWord, False) = 0)

    End Function

    Private Function ValidateManager(ByVal userName As String, ByVal passWord As String) As Boolean
        Dim conn As SqlConnection
        Dim cmd As SqlCommand
        Dim lookupPassword As String

        lookupPassword = Nothing

        ' Check for an invalid userName.
        ' userName  must not be set to nothing and must be between one and 15 characters.
        If ((userName Is Nothing)) Then
            System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of userName failed.")
            Return False
        End If
        If ((userName.Length = 0) Or (userName.Length > 15)) Then
            System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of userName failed.")
            Return False
        End If

        ' Check for invalid passWord.
        ' passWord must not be set to nothing and must be between one and 25 characters.
        If (passWord Is Nothing) Then
            System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of passWord failed.")
            Return False
        End If
        If ((passWord.Length = 0) Or (passWord.Length > 25)) Then
            System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of passWord failed.")
            Return False
        End If

        Try
            ' Consult with your SQL Server administrator for an appropriate connection
            ' string to use to connect to your local SQL Server.
            conn = New SqlConnection("Data Source=4750group5.database.windows.net;Initial Catalog=4750group5;User ID=rchapman3;Password=Rmc013076:")
            conn.Open()

            ' Create SqlCommand to select pwd field from the users table given a supplied userName.
            cmd = New SqlCommand("Select password from employees where empid=@userName and jobtitleid=1", conn)
            cmd.Parameters.Add("@userName", SqlDbType.VarChar, 25)
            cmd.Parameters("@userName").Value = userName


            ' Execute command and fetch pwd field into lookupPassword string.
            lookupPassword = cmd.ExecuteScalar()

            ' Cleanup command and connection objects.
            cmd.Dispose()
            conn.Dispose()
        Catch ex As Exception
            ' Add error handling here for debugging.
            ' This error message should not be sent back to the caller.
            System.Diagnostics.Trace.WriteLine("[ValidateUser] Exception " & ex.Message)
        End Try

        ' If no password found, return false.
        If (lookupPassword Is Nothing) Then
            ' You could write failed login attempts here to the event log for additional security.
            Return False
        End If

        ' Compare lookupPassword and input passWord by using a case-sensitive comparison.
        Return (String.Compare(lookupPassword, passWord, False) = 0)

    End Function

    

    
    Protected Sub Button1_Click(sender As Object, e As EventArgs) _
     Handles cmdLogin.Click

        Session.RemoveAll()

        If ValidateUser(txtUserName.Text, txtUserPass.Text) Then
            Session("user") = "employee"
            Session("id") = txtUserName.Text
            Response.Redirect("employeemainmenu.aspx")
        ElseIf ValidateManager(txtUserName.Text, txtUserPass.Text) Then
            Session("user") = "manager"
            Session("id") = txtUserName.Text
            Response.Redirect("managermainmenu.aspx")
        Else
            Response.Redirect("login.aspx", True)
        End If
    End Sub

</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Availability</title>
    <link href="login.css" rel="stylesheet" type="text/css" />

<!--Auto Styles for table cells -->
    <style type="text/css">
        .auto-style1 {
            width: 125px;
        }
        .auto-style2 {
            width: 200px;
           
        }

         .auto-style2 {
            width: 20px;
           
        }
        </style>
    </head>
<body>
<!--Focus cursor to textbox and button-->
    <form id="form1" runat="server">
    
<!--Page Header Logo-->
    <div class="container">
            <img src="twoRiversLogo.jpg" alt="Two Rivers Hair Salon Logo" />
           
   
        </div>

<!--Top Navigation Buttons-->
       

<!--DataSource 1 For DropDownList Control-->
        <table>
            <tr>
                <td class="auto-style1"><strong>Employee ID:</strong></td>
                <td class="auto-style2">
                    <asp:TextBox id="txtUserName" CssClass="textbox" runat="server"></asp:TextBox>
                    
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="**" ControlToValidate="txtUserName" ForeColor="#CC3300" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1"><strong style="text-align: right">Password:</strong></td>
                <td class="auto-style2">
                      <asp:TextBox id="txtUserPass" CssClass="textbox" runat="server" TextMode="Password"></asp:TextBox>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="**" ControlToValidate="txtUserPass" ForeColor="#CC3300" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2" id="loginbutton">
                   
                    <asp:Button ID="cmdLogin" runat="server" Text="Login" OnClick="Button1_Click" BackColor="#A99583" Font-Bold="True" Height="30px" Width="150px" /></td>
                <td>                   
                    </td>
            </tr>
            </table>
        <br />
    </form>
</body>
</html>


        

