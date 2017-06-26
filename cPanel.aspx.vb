
Partial Class cPanel
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsNothing(Session("isLoggedIn")) Then
            plLogin.Visible = False
            plControl.Visible = True
        Else
            plLogin.Visible = True
            plControl.Visible = False
        End If

    End Sub

    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate
        If Login1.UserName = Configuration.UserName And Login1.Password = Configuration.Password Then
            Session("isLoggedIn") = True
            Response.Redirect("cPanel.aspx")
        Else
            Login1.FailureText = "Login failed"
        End If
    End Sub

    Protected Sub btnExpiredURL_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExpiredURL.Click
        Dim adp As New MonoURLTableAdapters.MonourlTableAdapter
        Dim iexpired As Integer = adp.DeleteExpiredUrls()
        lblStaus.Text = iexpired.ToString + " Expired URLS Deleted from database."
    End Sub

    Protected Sub BtnLogOut_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnLogOut.Click
        Session("isLoggedIn") = Nothing
        Response.Redirect("cPanel.aspx")
    End Sub

    Protected Sub btnUnUsed_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUnUsed.Click
        Dim adp As New MonoURLTableAdapters.MonourlTableAdapter
        Dim iexpired As Integer = adp.DeleteUnusedURLS(GMDatePicker1.Date)

        lblStaus.Text = iexpired.ToString + " Unused URLS Deleted from database."
    End Sub
End Class
