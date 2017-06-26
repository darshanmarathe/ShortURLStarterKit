Imports MonoURLTableAdapters

Partial Class NewURL
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        lblshorturl.Text = Request.QueryString("Id")
        Dim adp As New MonourlTableAdapter

        Dim dt As MonoURL.MonourlDataTable = adp.FetchUsingPK(lblshorturl.Text)

        If dt.Rows.Count = 0 Then
            lbllongurl.Text = "URL Not Found"
        Else
            With dt(0)

                lbllongurl.Text = dt(0).LongURL
                If dt(0).IsLastVisitedNull = False Then lblcreateddate.Text = dt(0).CreatedDate
                If .IsLastVisitedNull = False Then lbllastvisited.Text = dt(0).LastVisited
                If .IsVisitedCountNull = False Then lblvisitedcount.Text = dt(0).VisitedCount
                If .IsCreatedDateNull = False Then lblcreateddate.Text = .CreatedDate.ToShortDateString
            End With



        End If


    End Sub
End Class
