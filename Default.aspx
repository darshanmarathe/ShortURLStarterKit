<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default"  %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc2" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
<script language="javascript" type="text/javascript">
 function CheckAgree(source, args) 
 {

            var chk = document.getElementById('<%=chkAgree.ClientID %>')

            if (chk.checked) {

                args.IsValid = true;

            }

            else {

                args.IsValid = false;

            }

            return;

 }
</script>


    <div>
        <asp:Panel ID="Header" runat="server">
        <h1>Welcome To <%=Configuration.ShortURL%></h1><br />
        <hr />
        </asp:Panel>
<asp:Panel ID="Pnlform" runat="server">
        
        <table>
            <tr>
                <td style="width: 210px; height: 26px; text-align: right">
                    Check Stats</td>
                <td style="width: 550px; height: 26px">
                    <asp:TextBox ID="txtStatURLFrag" runat="server"></asp:TextBox>
                    <asp:Button ID="btnStat" runat="server" Text="Check" ValidationGroup="Stat" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txtStatURLFrag" ErrorMessage="Please enter a URL fragment" 
                        ValidationGroup="Stat"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 210px; height: 26px; text-align: right">
                    &nbsp;</td>
                <td style="width: 550px; height: 26px">
                    Or Create a new monourl</td>
            </tr>
            <tr>
                <td style="width: 210px; text-align: right; height: 26px;">
                    <asp:Label ID="Label2" runat="server" Text="ShortURL:"></asp:Label></td>
                <td style="width: 550px; height: 26px;">
                    <asp:TextBox ID="TextBoxshorturl" runat="server" MaxLength="10"></asp:TextBox>&nbsp;<asp:Button ID="btnGenerate" runat="server" Text="Generate" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBoxshorturl" Display="Dynamic" 
                        ErrorMessage="Short URL" ValidationGroup="A">Please Enter the ShortURL</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="valduplicate" runat="server" Display="Dynamic"
                        ControlToValidate="TextBoxshorturl" ErrorMessage="Url Is Allready taken" 
                        OnServerValidate="CheckAvail" ValidationGroup="A">*</asp:CustomValidator>
                    </td>
            </tr>
            <tr>
                <td style="width: 210px; height: 26px; text-align: right">
                    <asp:Label ID="Label3" runat="server" Text="EnterLongURL to make Mono:"></asp:Label></td>
                <td style="width: 550px; height: 26px">
                    <asp:TextBox ID="TextBoxLongurl" runat="server" MaxLength="1000" Width="235px" 
                        TextMode="MultiLine">http://</asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxLongurl"
                        ErrorMessage="Long URL" Display="Dynamic" ValidationGroup="A">Please Enter The Long URL</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="TextBoxLongurl" Display="Dynamic" 
                        ErrorMessage="Please Enter the URL in HTTP:// Format" 
                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                        ValidationGroup="A"></asp:RegularExpressionValidator>
                </td>
            </tr>
            
            <tr>
                <td style="width: 210px; text-align: right">
                    <asp:Label ID="Label4" runat="server" Text="Expiry Date:"></asp:Label></td>
                <td style="width: 550px">
                    <cc2:GMDatePicker ID="GMDatePicker1" runat="server" InitialValueMode="Null" 
                        mindate="">
                    </cc2:GMDatePicker>
                    &nbsp; &nbsp;
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToValidate="GMDatePicker1" 
                        ErrorMessage="Please Enter valid Date in dd/mm/yyyy Format" 
                        Operator="DataTypeCheck" Type="Date" ValidationGroup="A"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 210px; text-align: right; ">
                    <asp:Label ID="Label5" runat="server" Text="Mask Integrator:"></asp:Label></td>
                <td style="width: 550px; ">
                    <asp:CheckBox ID="CheckBox1" runat="server" />
            </tr>
            <tr>
                <td style="width: 210px; text-align: right; height: 86px;">
                    <asp:Label ID="Label6" runat="server" Text="Enter the Tex in above Field"></asp:Label>
                </td>
                <td style="width: 550px; height: 86px;">
                    <cc1:CaptchaControl ID="Captcha1" runat="server" CaptchaBackgroundNoise="Low" 
                        CaptchaHeight="60" CaptchaLength="5" CaptchaLineNoise="None" 
                        CaptchaMaxTimeout="240" CaptchaMinTimeout="5" CaptchaWidth="200" 
                        FontColor="#529E00" />
                    <asp:TextBox ID="txtCaptcha" runat="server"></asp:TextBox>
                    &nbsp;
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtCaptcha" 
                        ErrorMessage="Enter the Text in Captcha Field" ValidationGroup="A">Please Enter the Captcha in above Field</asp:RequiredFieldValidator>
                </td>
                        </tr>
            <tr>
                <td style="width: 210px; ">
                </td>
                <td style="width: 550px; ">
                    &nbsp;
                    <asp:CheckBox ID="chkAgree" runat="server" 
                        Text="I agree to the Terms and Conditions" />
                    <asp:CustomValidator ID="CustomValidator1" runat="server" 
                        ClientValidationFunction="CheckAgree" ErrorMessage="Terms and Conditions" 
                        ValidationGroup="A">You have to agree the terms and condition to save this form.</asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 210px; height: 20px;">
                </td>
                <td style="width: 550px; height: 20px;">
                    </td>
            </tr>
            <tr>
                <td style="width: 210px">
                </td>
                <td style="width: 550px">
                    <asp:Button ID="Buttonsave" runat="server" Text="Save" Width="121px" 
                        ValidationGroup="A" />
                </td>
            </tr>
            <tr>
                <td style="width: 210px">
                </td>
                <td style="width: 550px">
                    </td>
            </tr>
            <tr>
                <td style="width: 210px">
                </td>
                <td style="width: 550px">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" 
                        HeaderText="These Above Field are Reuired Fields:" Width="327px" 
                        ValidationGroup="A" />
                    &nbsp;</td>
            </tr>
        </table>
        </asp:Panel>
        <asp:Panel ID="pnlNoShow" runat="server">
<br />
<br />
<h2>Sorry !!! Unable to find site's URL to redirect to. </h2>
<a href="../default.aspx" title="Go to home page">Home</a>
        </asp:Panel>
         <asp:Panel ID="pnlMask" runat="server" style="height:100%">
         <iframe src="<%= UrlToVisit %>" id="frameOne" frameborder="no"   width="100%" height="100%" >
         
         </iframe>
            

         <script language="javascript" type="text/javascript">
            
document.getElementById('frameOne').style.height = screen.height + 'px';               
               
        $('document').ready(function() {
                 var frame = $('#frameOne').clone();
                 $('body').html('');
                 $('body').html(frame);
         });
         </script>
        </asp:Panel>
         <asp:Panel ID="pnlRedirect" runat="server">
         <h2>You are being trasfered to your desired url in few secends.....</h2>
         <script language="javascript" type="text/javascript">


             setTimeout("window.location = '<%= UrlToVisit %>';", 3000);
         
         </script>
        </asp:Panel>
    </div>
</asp:Content>