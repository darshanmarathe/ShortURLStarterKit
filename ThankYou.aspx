<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ThankYou.aspx.vb" Inherits="Default2" MasterPageFile="~/MasterPage.master" Title="Thank You Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table>
            <tr>
                <td >
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" Text="MonoURL was Genrated !"></asp:Label></td>
            </tr>
            <tr>
                <td >
                </td>
            </tr>
            <tr>
                <td style="text-align: left; height: 21px;">
                    Your Long URL:</td>
            </tr>
            <tr>
                <td style="height: 21px; text-align: left">
                    <asp:Label ID="LabelLongurl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="height: 21px; text-align: left">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Your Short URL:</td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Labelshorturl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="The Lenght of the LongURL is:"
                        Width="216px"></asp:Label>
                    <asp:Label ID="Labellenlong" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td >
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Lenght of Short URL is:"></asp:Label>
                    <asp:Label ID="Labelshturl" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Your Genrated MonoURL:"></asp:Label>
                    <br />
                    <asp:HyperLink ID="HyperLinkfullurl" runat="server">[HyperLinkfullurl]</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td >
                </td>
            </tr>
            <tr>
                <td >
                    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Default.aspx">Go Back Home</asp:LinkButton></td>
            </tr>
        </table>

</asp:Content>