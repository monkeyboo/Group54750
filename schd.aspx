<table style="width:100%;">
    <tr>
        <td>
            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2">
        <ItemTemplate>
        <div>
        <asp:Label ID="Label4" runat="server" style="font-weight: 700" Text="Subtotal"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Subtotal", "{0:c}")%>' ReadOnly="true"></asp:TextBox>
        </div>
        </ItemTemplate>
        </asp:FormView>

        </td>
    </tr>
    <tr>
        <td><asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource3">
        <ItemTemplate>
        <div>
        <asp:Label ID="Label1" runat="server" style="font-weight: 700" Text="Discount"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("discount")%>' ReadOnly="true"></asp:TextBox>
        </div>
        </ItemTemplate>
        </asp:FormView></td>
    </tr>
    <tr>
        <td><asp:FormView ID="FormView3" runat="server" DataSourceID="SqlDataSource4">
        <ItemTemplate>
        <div>
        <asp:Label ID="Label2" runat="server" style="font-weight: 700" Text="Discount Amount"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("discountamount", "{0:c}")%>' ReadOnly="true"></asp:TextBox>
        </div>
        </ItemTemplate>
        </asp:FormView></td>
    </tr>
    <tr>
        <td><asp:FormView ID="FormView4" runat="server" DataSourceID="SqlDataSource5">
        <ItemTemplate>
        <div>
        <asp:Label ID="Label3" runat="server" style="font-weight: 700" Text="total"></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("total", "{0:c}")%>' ReadOnly="true"></asp:TextBox>
        </div>
        </ItemTemplate>
        </asp:FormView></td>
    </tr>
</table>
