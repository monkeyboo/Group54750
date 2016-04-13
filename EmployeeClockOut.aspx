<%@ Page Language="VB" AutoEventWireup="false" %>

<!DOCTYPE html>
<script runat="server">

    Protected Sub Page_Load(sender As Object, e As EventArgs)

    End Sub

    Protected Sub Button26_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub TextBox2_TextChanged(sender As Object, e As EventArgs)

    End Sub
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="main.css" rel="stylesheet" type="text/css" />
    <link href="Forms.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style11 {
            width: auto;
            height: auto;
        }
        .auto-style40 {
            width: 500px;
            height: 37px;
            margin-left: 101px;
        }
        .auto-style42 {
            height: 15px;
            text-align: right;
            width: 328px;
        }
        
        .auto-style48 {
            text-align: right;
            width: auto;
            height: 37px;
        }
        .auto-style50 {
            text-align: right;
            width: 800px;
        }
        .auto-style51 {
            text-align: left;
            width: auto;
            height: 37px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    
        <div id="logo">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/twoRiversLogo.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
         <div id="logoutbutton">
            <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" Width="50px" ImageUrl="~/logoutbutton1.fw.png" BorderStyle="Outset" />
        </div>
        <div id="title">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Employee Clock Out"></asp:Label>
        <br />
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
    </div>
        <div id="tableId">
        <table align="center" class="auto-style11">
            <tr>
                <td class="auto-style48">
                    <asp:Label ID="Label13" runat="server" Text="Employee ID:"></asp:Label>
                </td>
                <td class="auto-style51">
                    <asp:TextBox ID="TextBox2" runat="server" BackColor="#F3EDE7" ForeColor="#CAAF95" Width="194px">xxxxx</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style48">
                    <asp:Label ID="Label12" runat="server" Text="Time:"></asp:Label>
                </td>
                <td class="auto-style51">
                    <asp:TextBox ID="TextBox1" runat="server" BackColor="#F3EDE7" ForeColor="#CAAF95" Width="194px">xxxxx</asp:TextBox>
                </td>
            </tr>
            </table>
<table class="auto-style40" align="center">
                <tr>
                    <td class="auto-style50">
                    <asp:Button ID="Button30" runat="server" BackColor="#BE9D80" BorderStyle="Outset" Height="40px" Text="Clock Out" Width="175px" />
                    </td>
                    <td class="auto-style42">
                    <asp:Button ID="Button29" runat="server" BackColor="#BE9D80" BorderStyle="Outset" Height="40px" Text="Home" Width="175px" OnClick="Button26_Click" PostBackUrl="~/Default.aspx" />
                    </td>
                    <td class="auto-style42">
                    <asp:Button ID="Button31" runat="server" BackColor="#BE9D80" BorderStyle="Outset" Height="40px" Text="Previous" Width="175px" OnClick="Button26_Click" />
                    </td>
                </tr>
            </table>
        </div>
      <br />      
    </form>
</body>
</html>



