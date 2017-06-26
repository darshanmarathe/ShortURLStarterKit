<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="cPanel.aspx.vb" Inherits="cPanel" title="Untitled Page" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="plLogin" runat="server">
        <asp:Login ID="Login1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderPadding="4"
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em"
            ForeColor="#333333">
            <TextBoxStyle Font-Size="0.8em" />
            <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px"
                Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        </asp:Login>
    </asp:Panel>
    <asp:Panel ID="plControl" runat="server">
        
        
        <asp:Button ID="btnExpiredURL" runat="server" Text="Delete Expired URLS" />
              <cc2:GMDatePicker ID="GMDatePicker1" runat="server" InitialValueMode="Null" 
                        mindate="">
                        </cc2:GMDatePicker>
                        <asp:Button ID="btnUnUsed" runat="server" Text="Delete Unused  URLS" />
                        
        <br /><asp:Button ID="BtnLogOut" runat="server" Text="Logout" />
        <br /><asp:Label ID="lblStaus" runat="server" Text=""></asp:Label>
        
        </asp:Panel>
</asp:Content>

