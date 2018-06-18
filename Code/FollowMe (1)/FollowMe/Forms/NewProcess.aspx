<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Manager.Master" AutoEventWireup="true" CodeBehind="NewProcess.aspx.cs" Inherits="FollowMe.Forms.NewProcess" %>

<%@ Register Src="~/Forms/ucStation.ascx" TagPrefix="uc1" TagName="ucStation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <asp:Panel ID="pnlView" runat="server">
        <asp:GridView ID="gvProcess" runat="server" AllowPaging="True" PageSize="5"
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProcessId"
            DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None"
            OnSelectedIndexChanging="gvProcess_SelectedIndexChanging">
            <AlternatingRowStyle BackColor="White" />
            <HeaderStyle ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <PagerStyle BackColor="White" />
            <Columns>



                <asp:CommandField ShowDeleteButton="True"
                    ShowSelectButton="True" />
                <asp:BoundField DataField="ProcessId" HeaderText="ProcessId"
                    InsertVisible="False" ReadOnly="True" SortExpression="ProcessId" />
                <asp:BoundField DataField="Process" HeaderText="Process"
                    SortExpression="Process" />
                <asp:BoundField DataField="ColorId" HeaderText="ColorId"
                    SortExpression="ColorId" />
                <asp:BoundField DataField="Color name" HeaderText="Color name"
                    SortExpression="Color name" />
            </Columns>
            <EditRowStyle CssClass="gridEditRowStyle" />
            <FooterStyle CssClass="gridFooterStyle" />
            <HeaderStyle CssClass="gridHeaderStyle" />
            <PagerStyle BackColor="White" />
            <RowStyle CssClass="gridRowStyle" />
            <SelectedRowStyle CssClass="gridSelectedRowStyle" BackColor="#4f81bd" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            DeleteCommand="DELETE FROM Process WHERE (ProcessId = @ProcessId)"
            SelectCommand="SELECT p.ProcessId, p.Name AS Process,p.ColorId, c.ColorName AS 'Color name' FROM Process AS p INNER JOIN Colors AS c ON p.ColorId = c.ColorId"
            UpdateCommand="UPDATE Process SET Name =@Name">
            <DeleteParameters>
                <asp:Parameter Name="ProcessId" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <br />
    <br />
    <br />
    <asp:Button ID="btnEdit" runat="server" CssClass="button" Text="Edit"
        OnClick="btnEdit_Click" />
    <asp:Button ID="btnNew" runat="server" CssClass="button" Text="Create a new washing process"
        OnClick="btnNew_Click" />
    <asp:Panel ID="pnlEdit" Visible="false" runat="server">
        <br />
        <br />
        <br />
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Right">
                    <asp:Label ID="label1" runat="server" Width="350px" Text="Enter process name"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtProcess" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                        ErrorMessage="You must use only English letters" ValidationExpression="[A-Z]?([a-z]*)\w([a-z]*)"
                        ControlToValidate="txtProcess"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="You must enter data!"
                        ControlToValidate="txtProcess" Display="Dynamic"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Right">
                    <asp:Label ID="lblColor" runat="server" Text="Color:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell HorizontalAlign="Left">
                    <asp:DropDownList ID="ddlColor" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlColor_SelectedIndexChanged" ViewStateMode="Inherit">
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtColor" Text="another" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You must choose color!"
                        ControlToValidate="txtColor" Display="Dynamic"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Right">
                    <asp:Label ID="Label2" runat="server" Text="Choose new station"></asp:Label>
                </asp:TableCell>
                <asp:TableCell HorizontalAlign="Left">
                    <asp:DropDownList ID="ddlReaders" runat="server">
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell HorizontalAlign="Left">
                    <asp:Button ID="btnChoose" runat="server" Text="Choosed" CssClass="button" OnClick="btnChoose_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <br />
        <asp:PlaceHolder ID="PlaceHolder1" runat="server">
            <asp:Panel ID="pnlStation" runat="server" Width="800px">
            </asp:Panel>
        </asp:PlaceHolder>
           <br />
    <br />
        <asp:Button ID="btnOk" runat="server" CssClass="button" Text="Finish" OnClick="btnOk_Click" Visible="false" />
        <asp:Button ID="btnCancel" runat="server" CssClass="button" Text="Cancel" OnClick="btnCancel_Click" />
    </asp:Panel>
    <br />
    <br />
    <br />
</asp:Content>

