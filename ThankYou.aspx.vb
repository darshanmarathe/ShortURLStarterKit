
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        'TODO: Hard coded URL to bechange.
        Labelshorturl.Text = Session("shorturl").ToString()
        LabelLongurl.Text = Session("longurl").ToString()

        HyperLinkfullurl.Text = Configuration.MainURL + Labelshorturl.Text
        HyperLinkfullurl.NavigateUrl = Configuration.MainURL + Labelshorturl.Text

        Session.Remove("shorturl")
        Session.Remove("longurl")
        Labellenlong.Text = LabelLongurl.Text.Length.ToString()
        Labelshturl.Text = HyperLinkfullurl.Text.Length.ToString()


        




    End Sub

    
    Protected Sub Label4_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Labellenlong.Load

    End Sub
End Class
