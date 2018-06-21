<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucStation.ascx.cs" Inherits="FollowMe.Forms.ucStation" %>
<asp:Panel runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="SkyBlue"> 
<asp:Label ID="Label1" runat="server" Text="Station: " ></asp:Label>
 
 <asp:Label ID="lblStation" runat="server" Width="100px"  Text=""></asp:Label>
 <asp:Label ID="lblTime" runat="server" Text="  Minutes: " ></asp:Label>&nbsp
   <asp:TextBox ID="txtTime" Width="60px" runat="server"></asp:TextBox>&nbsp&nbsp
<asp:Label ID="lblMoreDetailes" runat="server" Text="  More Detailes: "></asp:Label>&nbsp
<asp:TextBox ID="txtMoreDetailes" runat="server"></asp:TextBox>&nbsp&nbsp
<asp:Button ID="btnCancelStat" runat="server" Text="X" CssClass="button" onclick="btnCancelStat_Click"  />
     <br />
<asp:CompareValidator ID="CompareValidator1" runat="server" 
    ControlToValidate="txtTime" Display="Dynamic" ErrorMessage="Time error!" 
    Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
ControlToValidate="txtTime" Display="Dynamic" 
 ErrorMessage="You must enter time!"></asp:RequiredFieldValidator>

<br /></asp:Panel>
