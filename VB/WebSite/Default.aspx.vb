Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub

	Protected Sub ASPxUploadControl1_FilesUploadComplete(ByVal sender As Object, ByVal e As DevExpress.Web.FilesUploadCompleteEventArgs)
		' Intentionally pauses server-side processing to demonstrate the Loading Panel or Progress Panel functionality
		System.Threading.Thread.Sleep(2000)

		Dim uploadControl As ASPxUploadControl = TryCast(sender, ASPxUploadControl)

		If uploadControl.UploadedFiles IsNot Nothing AndAlso uploadControl.UploadedFiles.Length > 0 Then
			For i As Integer = 0 To uploadControl.UploadedFiles.Length - 1
				Dim file As UploadedFile = uploadControl.UploadedFiles(i)
				If file.FileName <> "" Then
					Dim fileName As String = String.Format("{0}{1}", MapPath("~/Images/"), file.FileName)
					'file.SaveAs(fileName, True)'OnLine Demo Restriction
				End If
			Next i
		End If
	End Sub
End Class