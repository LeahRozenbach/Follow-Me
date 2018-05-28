<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="FollowMe.Forms.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        th, td {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Select a order you want to edit / delete   "></asp:Label>
    <br />
    <br />

    <asp:GridView ID="gvOrders" runat="server" AllowPaging="True" PageSize="5"
        AllowSorting="True" AutoGenerateColumns="False" Width="950px"
        DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None"
        OnSelectedIndexChanging="gvOrders_SelectedIndexChanging">
        <AlternatingRowStyle BackColor="White" />
        <HeaderStyle ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <PagerStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="OrderId" HeaderText="OrderId"
                SortExpression="OrderId" />
            <asp:BoundField DataField="Date" HeaderText="Date"
                SortExpression="Date" />
            <asp:BoundField DataField="Amount" HeaderText="Amount"
                SortExpression="Amount" />
            <asp:BoundField DataField="FirstEPC" HeaderText="FirstEPC"
                SortExpression="FirstEPC" />
            <asp:BoundField DataField="LastEPC" HeaderText="LastEPC"
                SortExpression="LastEPC" />
            <%--      <asp:BoundField DataField="lastEPC" HeaderText="lastEPC" 
                SortExpression="lastEPC" />--%>
        </Columns>
        <EditRowStyle CssClass="gridEditRowStyle" />
        <FooterStyle CssClass="gridFooterStyle" />
        <HeaderStyle CssClass="gridHeaderStyle" />
        <PagerStyle BackColor="White" />
        <RowStyle CssClass="gridRowStyle" />
        <SelectedRowStyle CssClass="gridSelectedRowStyle" BackColor="#4f81bd" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Order].OrderId, [Order].Date, OrderDetails.Amount, OrderDetails.FirstEPC, OrderDetails.LastEPC FROM [Order] CROSS JOIN OrderDetails"></asp:SqlDataSource>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server">
    </asp:EntityDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        DeleteCommand="OrderDelete" DeleteCommandType="StoredProcedure"
        SelectCommand="AllOrdersSelect" SelectCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="OrderId" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <br />
    <br />
    <asp:Panel ID="pnlbtn" runat="server" Visible="false">
        <asp:Button ID="btnEdit" runat="server" CssClass="button" Text="Edit" OnClick="btnEdit_Click" />
        <asp:Button ID="btnDel" runat="server" Text="cancel order" CssClass="button" OnClick="btnDel_Click"></asp:Button>
        <asp:Button ID="btnFinish" runat="server" Text="end order" CssClass="button"
            OnClick="btnFinish_Click"></asp:Button>
        <asp:Button ID="btnSearch" runat="server" Text="search items" CssClass="button"
            OnClick="btnSearch_Click"></asp:Button>
        <br />
        <br />
    </asp:Panel>
    <asp:Button ID="btnNew" runat="server" CssClass="button" Text="New order" OnClick="btnNew_Click"></asp:Button>
    <asp:Button ID="btnView" runat="server" CssClass="button"
        Text="View active laundries" OnClick="btnView_Click"></asp:Button>
    <asp:Button ID="btnArchiveOrders" runat="server" Text="Archive orders"
        OnClick="btnArchiveOrders_Click" CssClass="button" />

    <asp:Panel ID="pnlSearch" runat="server" Visible="false">
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Dear customer your laundry items were the following stations"></asp:Label>
        <br />

        <asp:GridView ID="gvStations" runat="server" AllowPaging="True" PageSize="5"
            AllowSorting="True" AutoGenerateColumns="False"
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <HeaderStyle ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <PagerStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Station" HeaderText="Station" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" />
            </Columns>
            <EditRowStyle CssClass="gridEditRowStyle" />
            <FooterStyle CssClass="gridFooterStyle" />
            <HeaderStyle CssClass="gridHeaderStyle" />
            <PagerStyle BackColor="White" />
            <RowStyle CssClass="gridRowStyle" />
            <SelectedRowStyle CssClass="gridSelectedRowStyle" BackColor="#4f81bd" />
        </asp:GridView>
        <br />
        <asp:Label ID="Label4" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnOk1" runat="server" OnClick="btnOk1_Click" CssClass="button" Text="Ok" />
    </asp:Panel>
    <asp:Panel ID="pnlNew" Visible="false" runat="server">
        <asp:Panel ID="Panel1" runat="server">
            <br />

            <asp:Label ID="Label1" runat="server" Text="New customer?"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnYes" Text="Yes" runat="server" OnClick="btnYes_Click"
                CssClass="button"></asp:Button>
            &nbsp  &nbsp  
      <asp:Button ID="btnNo" Text="No" runat="server" CssClass="button" OnClick="btnNo_Click"></asp:Button>
            <br />
            <br />

        </asp:Panel>
        <br />
        <asp:Panel ID="Panel2" Visible="false" runat="server">
            <%--
     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False"
        ForeColor="#333333" GridLines="None">--%>


            <asp:GridView ID="gvProcess" runat="server" AutoGenerateSelectButton="true"
                SelectedRowStyle-BackColor="Aqua" ForeColor="#333333" PageSize="5"
                OnSelectedIndexChanging="gvProcess_SelectedIndexChanging">
                <AlternatingRowStyle BackColor="White" />
                <HeaderStyle ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
                <PagerStyle BackColor="White" />
                <%--<Columns>
        <asp:BoundField DataField="process" HeaderText="סוג הכביסה" />
        <asp:BoundField DataField="color" HeaderText="color" />
        <asp:BoundField DataField="price" HeaderText="מחיר לפריט" />
    </Columns>--%>
                <EditRowStyle CssClass="gridEditRowStyle" />
                <FooterStyle CssClass="gridFooterStyle" />
                <HeaderStyle CssClass="gridHeaderStyle" />
                <PagerStyle BackColor="White" />
                <RowStyle CssClass="gridRowStyle" />
                <SelectedRowStyle CssClass="gridSelectedRowStyle" BackColor="#4f81bd" />
            </asp:GridView>
            <br />
            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblOwners" runat="server" Text="customer:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlOwners" runat="server"></asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            ControlToValidate="ddlOwners" Display="Dynamic"
                            ErrorMessage="You must enter data!"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblAmount" runat="server" Text="Amount:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="txtAmount" Display="Dynamic"
                            ErrorMessage="You must enter data!"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:CompareValidator ID="CompareValidator1" runat="server"
                            ControlToValidate="txtAmount" Display="Dynamic"
                            ErrorMessage="Amount is too small!" Operator="GreaterThan" Type="Integer"
                            ValueToCompare="0"></asp:CompareValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblFirstEpc" runat="server" Text="First EPC:"></asp:Label>

                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtFirstEpc" runat="server" Enabled="false"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnGetEPC" runat="server" Text="Get EPC" CssClass="button" OnClick="GetEPC_Click" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblMassage" runat="server" Text="" Visible="false"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtFirstEpc" Display="Dynamic" 
        ErrorMessage="You must enter data!"></asp:RequiredFieldValidator>--%>
                <asp:TableRow>
                    <%--  <asp:TableCell>
           <asp:Label ID="lblShipper" runat="server" Text="Shipper:"></asp:Label>
        </asp:TableCell>--%>
                    <%-- <asp:TableCell>
    <asp:TextBox ID="txtShipper" runat="server"></asp:TextBox>   
        </asp:TableCell>
        <asp:TableCell>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="txtShipper" Display="Dynamic" 
        ErrorMessage="You must use only English letters" 
        ValidationExpression="[A-Z]?([a-z]*)"></asp:RegularExpressionValidator>
        </asp:TableCell>  
                    --%>
                </asp:TableRow>
            </asp:Table>

            <%--  <asp:Label ID="lblColor" runat="server" Text="Color:"></asp:Label>
    <asp:DropDownList ID="ddlColor" runat="server">
    </asp:DropDownList>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="ddlColor" Display="Dynamic" 
        ErrorMessage="You must enter data!"></asp:RequiredFieldValidator>
    <br />--%>

            <br />

            <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate >--%>
            <asp:Button ID="btnOk" runat="server" Text="OK" CssClass="button" OnClick="btnOk_Click" />
            <asp:Image runat="server" ID="imgRefresh" src="../Images/refresh.Gif" Visible="false" />
            <asp:Button ID="btnCancel" runat="server" CssClass="button" Text="Cancel"
                OnClick="btnCancel_Click" />
            <br />
            <br />
            <br />
            <%--</ContentTemplate>

    </asp:UpdatePanel>--%>
        </asp:Panel>
    </asp:Panel>

</asp:Content>

