
<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Customer.Master" AutoEventWireup="true" CodeBehind="Owner.aspx.cs" Inherits="FollowMe.Forms.Owner" EnableViewState="true" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
    <br />

    <br />
    <br />
    <br />
    <asp:Panel ID="pnlShow" Visible="true" runat="server">
        <asp:GridView ID="gvShowOwners" runat="server" AllowPaging="True"
            ForeColor="#333333" GridLines="None"
            AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
            PageSize="5">
            <AlternatingRowStyle BackColor="White" />
            <HeaderStyle ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <PagerStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="OwnerId" HeaderText="OwnerId"
                    SortExpression="OwnerId" />
                <asp:BoundField DataField="Address" HeaderText="Address"
                    SortExpression="Address" />
                <asp:BoundField DataField="Company" HeaderText="Company"
                    SortExpression="Company" />
                <asp:BoundField DataField="Name" HeaderText="Name"
                    SortExpression="Name" />
                <asp:BoundField DataField="Pass" HeaderText="Pass"
                    SortExpression="Pass" />
                <asp:BoundField DataField="Phone" HeaderText="Phone"
                    SortExpression="Phone" />
            </Columns>
            <EditRowStyle CssClass="gridEditRowStyle" />
            <FooterStyle CssClass="gridFooterStyle" />
            <HeaderStyle CssClass="gridHeaderStyle" />
            <PagerStyle BackColor="White" />
            <RowStyle CssClass="gridRowStyle" />
            <SelectedRowStyle CssClass="gridSelectedRowStyle" BackColor="#4f81bd" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Owners]"></asp:SqlDataSource>
        <br />
        <asp:Button ID="btnNewOwner" runat="server" Text="Add new customer"
            CssClass="button" OnClick="btnNewOwner_Click" />
       <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            DeleteCommand="DELETE FROM Owners  WHERE (OwnerId = @OwnerId)"
            SelectCommand="SELECT Owners.* FROM Owners"
            UpdateCommand="UPDATE Owners SET FirstName = @FirstName, LastName = @LastName, Pass = @Pass, Company = @Company, Address = @Address, Phone = @Phone  WHERE (OwnerId = @OwnerId)">--%>
            <%-- UpdateCommand="UPDATE [Employees] SET [Name] = @Name, [Pass] = @Pass WHERE [EmployeeId] = @EmployeeId"

            <DeleteParameters>
                <asp:Parameter Name="OwnerId" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" />
                <asp:Parameter Name="LastName" />
                <asp:Parameter Name="Pass" />
                <asp:Parameter Name="Company" />
                <asp:Parameter Name="Address" />
                <asp:Parameter Name="Phone" />
                <asp:Parameter Name="OwnerId" />
            </UpdateParameters>
        </asp:SqlDataSource>--%>
    </asp:Panel>
    <asp:Panel ID="pnlNewOwner" Visible="false" runat="server">
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblName" runat="server" Text="First name:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtName" Text="" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell ID="my">
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtName"
                        Display="Dynamic" ErrorMessage="You must use only English letters" ValidationExpression="[A-Z]?([a-z]*)"></asp:RegularExpressionValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblLName" runat="server" Text="Last name:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLName" Text="" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell ID="TableCell1">
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtLName"
                        Display="Dynamic" ErrorMessage="You must use only English letters" ValidationExpression="[A-Z]?([a-z]*)"></asp:RegularExpressionValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblPass" runat="server" Text="Password:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <%--  <input id="txtPass" name="txtPass" type="text" runat="server"   value="0000" style="color:Aqua"  onkeydown="TextBox_onkeydown(this)"/>     --%>
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password">
                    </asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You must enter data!"
                        ControlToValidate="txtPass" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtPass"
                        Display="Dynamic" ErrorMessage="You need to insert code between 1 and 10 characters!"
                        ValidationExpression="^.{1,10}$"></asp:RegularExpressionValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label3" runat="server" Text="approv your password:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtValidPass" runat="server" TextMode="Password"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="You must enter data!"
                        ControlToValidate="txtName" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtValidPass"
                        ControlToValidate="txtPass" Display="Dynamic" ErrorMessage="Password is incorrect"></asp:CompareValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblCompany" runat="server" Text="Company:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCompany" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="You must enter data!"
                        ControlToValidate="txtCompany" Display="Dynamic"></asp:RequiredFieldValidator>
                   <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCompany"
                        Display="Dynamic" ErrorMessage="You must use only English letters" ValidationExpression="[A-Z]?([a-z]*)"></asp:RegularExpressionValidator>
               --%> </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="You must enter data!"
                        ControlToValidate="txtAddress" Display="Dynamic"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblPhone" runat="server" Text="Phone:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPhone" runat="server" Text="-" ></asp:TextBox>
                    
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="You must enter data!"
                        ControlToValidate="txtPhone" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPhone"
                        Display="Dynamic" ErrorMessage="Phone number is incorrect!" ValidationExpression="^0(([57]\d)|[0234689])-[0-9]\d{6}$"></asp:RegularExpressionValidator>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="btnOk" runat="server" CssClass="button" Text="Ok" OnClick="btnOk_Click" />
        <asp:Button ID="btnCancel" runat="server" CssClass="button" Text="Cancel"
            OnClick="btnCancel_Click" />
    </asp:Panel>

</asp:Content>
