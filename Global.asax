<%@ Application Language="VB" %>
<%@ Import Namespace="System.IO" %>
<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub
    
    Protected Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        If (File.Exists(Request.PhysicalPath)) Then
            
            
            
            ' If the file does not exist then

        ElseIf Not File.Exists(Request.PhysicalPath) Then
            
            If Not Request.PhysicalPath.Contains(".") Then
                
            ' Get the URL requested by the user

                Dim sRequestedURL As String = Request.Path.Replace(Request.ApplicationPath + "/", "")
            
   
                ' the ID that is passed here

                Dim sTargetURL As String = "~/Default.aspx/" + sRequestedURL

                ' Owing to RewritePath, the user will see requested URL in the

                ' address bar

                ' The second argument should be false, to keep your references

                ' to images, css files
               Context.Response.Redirect(sTargetURL ,True)
            End If
            
        End If
        
    End Sub
       
</script>