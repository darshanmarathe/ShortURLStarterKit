<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Stats.aspx.vb" Inherits="NewURL" Title="Status" MasterPageFile="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        &nbsp; &nbsp;
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="LongURL:"></asp:Label>
        <asp:Label ID="lbllongurl" runat="server"></asp:Label><br />
        <br />
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="ShortURL:"></asp:Label>
        <asp:Label ID="lblshorturl" runat="server"></asp:Label><br />
        <br />
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Created Date:"></asp:Label>
        <asp:Label ID="lblcreateddate" runat="server"></asp:Label><br />
        <br />
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Last Visited:"></asp:Label>
        <asp:Label ID="lbllastvisited" runat="server"></asp:Label><br />
        <br />
        <asp:Label ID="Label" runat="server" Font-Bold="True" Text="Visited Count:"></asp:Label>
        <asp:Label ID="lblvisitedcount" runat="server"></asp:Label></div>
</asp:Content>