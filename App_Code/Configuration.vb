Imports Microsoft.VisualBasic
Imports System.Configuration
Public Class Configuration

        Public Shared ReadOnly Property MainURL() As String
        Get
            Return ConfigurationManager.AppSettings("MainUrl")
        End Get

    End Property


    Public Shared ReadOnly Property ShortURL() As String
        Get
            Return ConfigurationManager.AppSettings("ShortUrl")
        End Get

    End Property

    Public Shared ReadOnly Property UserName() As String
        Get
            Return ConfigurationManager.AppSettings("UserName")
        End Get

    End Property

    Public Shared ReadOnly Property Password() As String
        Get
            Return ConfigurationManager.AppSettings("Password")
        End Get

    End Property

End Class
