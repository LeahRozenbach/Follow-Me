<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Manager.Master" AutoEventWireup="true" CodeBehind="Reader.aspx.cs" Inherits="FollowMe.Forms.Reader" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--  <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>--%>
    <br />
    <br />
    <br />
    <asp:Panel ID="Panel1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Select a reader you want to edit / delete   "></asp:Label>
        <br />
        <br />

        <asp:GridView ID="gvReaders" runat="server" CaptionAlign="Right" AllowPaging="True" PageSize="5"
            AllowSorting="True" AutoGenerateColumns="False"
            ForeColor="#333333" GridLines="None" DataKeyNames="ReaderId" DataSourceID="EntityDataSource1">
            <%--DataSourceID="SqlDataSource1"--%>
            <HeaderStyle CssClass="gridHeaderStyle" />
            <PagerStyle BackColor="White" />
            <RowStyle CssClass="gridRowStyle" />
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ReaderId" HeaderText="ReaderId" ReadOnly="True" SortExpression="ReaderId" />
                <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            </Columns>
            <EditRowStyle CssClass="gridEditRowStyle" />
            <FooterStyle CssClass="gridFooterStyle" />
            <HeaderStyle ForeColor="White" />
            <PagerStyle BackColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle CssClass="gridSelectedRowStyle" BackColor="#4f81bd" />

        </asp:GridView>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=FollowMeDBEntities" DefaultContainerName="FollowMeDBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Readers">
        </asp:EntityDataSource>
        <%--   <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:FollowMeDBEntities %>"
            SelectCommand="SELECT [ReaderId], [Area], [IP], [Name] FROM [Readers]">
        </asp:SqlDataSource>
        --%>
        <br />
        <br />
        <asp:LinkButton ID="btnEdit" runat="server" CssClass="LinkButton" OnClick="btnEdit_Click">Edit</asp:LinkButton>

        <asp:LinkButton ID="btnDel" runat="server" CssClass="LinkButton" OnClick="btnDel_Click">Delete</asp:LinkButton>

        <br />
        <br />
        <asp:LinkButton ID="lnkNew" runat="server" CssClass="LinkButton" OnClick="lnkNew_Click">New reader</asp:LinkButton>
        <br />
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Visible="false" Text=" Set a new reader!"></asp:Label>
        <br />
        <br />
        <br />
        <asp:Table ID="tblPage" Visible="false" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblName" runat="server" Text="Name Reader:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblIp" runat="server" Text="Ip:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtIp" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                        ErrorMessage="You must enter data!" ControlToValidate="txtIp"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblActiveAntennas" runat="server" Text="ActiveAntennas:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:PlaceHolder ID="phAntennas" runat="server">
                        <asp:CheckBox ID="Ant1CheckBox" Text=" 1 " runat="server" />
                        <asp:CheckBox ID="Ant2CheckBox" Text=" 2 " runat="server" />
                        <asp:CheckBox ID="Ant3CheckBox" Text=" 3 " runat="server" />
                        <asp:CheckBox ID="Ant4CheckBox" Text=" 4 " runat="server" />
                    </asp:PlaceHolder>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblArea" runat="server" Text="Area"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtArea" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtArea"
                        Display="Dynamic" ErrorMessage="You must enter data!"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <br />
        <asp:Button ID="btnOk" runat="server" Text="Ok" Visible="false" CssClass="button" OnClick="btnOk_Click" />
        &nbsp  &nbsp  &nbsp 
  <br />
        <br />
        <br />
        <br />
        <asp:Button ID="btnCancel" runat="server" Visible="false" CssClass="button" Text="Cancel"
            OnClick="btnCancel_Click" />
    </asp:Panel>
</asp:Content>
