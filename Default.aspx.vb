Imports MonoURLTableAdapters
Imports System.IO
Partial Class _Default
    Inherits System.Web.UI.Page
    Protected UrlToVisit As String = "#"
 
    Protected Sub Buttonsave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Buttonsave.Click

        If Page.IsValid Then

            'TODO: Need to check whether Long url can be short than Short url

            Captcha1.ValidateCaptcha(txtCaptcha.Text.Trim())

            If Captcha1.UserValidated Then

                Session("Shorturl") = TextBoxshorturl.Text.Trim()
                Session("longurl") = TextBoxLongurl.Text.Trim()
                InsertRecord()
                Server.Transfer("ThankYou.aspx")
            Else

                lblMessage.ForeColor = System.Drawing.Color.Red

                lblMessage.Text = "InValid"
            End If



        End If




    End Sub

    Sub CheckAvail(ByVal sender As Object, ByVal args As ServerValidateEventArgs)
        Dim shortUrl As String = args.Value
        Dim adp As New MonourlTableAdapter

        Dim DT As MonoURL.MonourlDataTable = adp.FetchUsingPK(shortUrl)

        If DT.Rows.Count = 0 Then
            args.IsValid = True
        Else
            args.IsValid = False
        End If

    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Me.Title = Configuration.MainURL
        Dim urlFragment As String = GetURLFragment()

        'Normal Visit
        If urlFragment = String.Empty Then
            GMDatePicker1.MinDate = Date.Today.ToString
            Pnlform.Visible = True
            pnlMask.Visible = False
            pnlNoShow.Visible = False
            pnlRedirect.Visible = False
            Exit Sub
        End If

        Dim adp As New MonourlTableAdapter
        Dim dt As MonoURL.MonourlDataTable = adp.FetchUsingPK(urlFragment)

        Dim dr As MonoURL.MonourlRow
        'No Sbow
        If dt.Rows.Count = 0 Then
            Pnlform.Visible = False
            pnlMask.Visible = False
            pnlNoShow.Visible = True
            pnlRedirect.Visible = False
            Exit Sub
        End If
        dr = dt(0)

        If dr.MaskInd = 1 Then
            'Mask 
            UrlToVisit = dr.LongURL
            Pnlform.Visible = False
            pnlMask.Visible = True
            pnlNoShow.Visible = False
            pnlRedirect.Visible = False
            Header.Visible = False
        Else

            'Redirect
            UrlToVisit = dr.LongURL
            Pnlform.Visible = False
            pnlMask.Visible = False
            pnlNoShow.Visible = False
            pnlRedirect.Visible = True

        End If

        'Update the lastvisited date and count
        dr.LastVisited = Today.Date
        dr.VisitedCount = 1 + dr.VisitedCount
        adp.Update(dt)
        adp.Dispose()



    End Sub

    Sub InsertRecord()
        Dim adp As New MonourlTableAdapter
        adp.Insert(TextBoxLongurl.Text, TextBoxshorturl.Text, GMDatePicker1.Date, GetIntForBool(CheckBox1.Checked), Nothing, 0, DateTime.Today)
    End Sub

    Function GetIntForBool(ByVal bool As Boolean) As Integer
        If bool = True Then
            Return 1
        Else
            Return 0
        End If
    End Function

    Protected Function GetURLFragment() As String

        If Request.PathInfo.Length = 0 Then
            Return ""
        Else

            Return Request.PathInfo.Substring(1)
        End If
    End Function



    Protected Sub btnStat_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnStat.Click
        Response.Redirect("stats.aspx?Id=" + txtStatURLFrag.Text)

    End Sub

    Protected Sub btnGenerate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGenerate.Click
        If btnGenerate.Text = "Generate" Then
            Dim KeyGen As RandomKeyGenerator
            KeyGen = New RandomKeyGenerator
            KeyGen.KeyLetters = "abcdefghijklmnopqrstuvwxyz"
            KeyGen.KeyNumbers = "0123456789"
            KeyGen.KeyChars = 6
            TextBoxshorturl.Text = KeyGen.GenerateString()
            TextBoxshorturl.ReadOnly = True
            btnGenerate.Text = "Clear"
        Else
            TextBoxshorturl.Text = ""
            TextBoxshorturl.ReadOnly = False
            btnGenerate.Text = "Generate"
            TextBoxshorturl.Focus()

        End If

    End Sub
End Class

