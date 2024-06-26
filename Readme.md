<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128565084/13.1.4%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E3067)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
[![](https://img.shields.io/badge/💬_Leave_Feedback-feecdd?style=flat-square)](#does-this-example-address-your-development-requirementsobjectives)
<!-- default badges end -->
# Upload Control for ASP.NET Web Forms - How to save uploaded files on the server

This example demonstrates how to upload files on a callback and postback and handle the upload control's `FilesUploadComplete` event to save the files on the server.

![Upload files to the server](UploadFiles.png)

## Overview

Create the [Upload control](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxUploadControl) and add two buttons to the page. To upload files on a callback or postback, enable or disable the buttons' [AutoPostBack](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxButton.AutoPostBack) properties. When a user selects a file and clicks a button, the selected file is uploaded to the server.

To save the file to a specific location on the server, handle the upload control's [FilesUploadComplete](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxUploadControl.FileUploadComplete) event and specify the file's name and path in the handler.

```cs
protected void ASPxUploadControl1_FilesUploadComplete(object sender, DevExpress.Web.FilesUploadCompleteEventArgs e) {
    // ...
    ASPxUploadControl uploadControl = sender as ASPxUploadControl;
    if (uploadControl.UploadedFiles != null && uploadControl.UploadedFiles.Length > 0) {
        for (int i = 0; i < uploadControl.UploadedFiles.Length; i++) {
            UploadedFile file = uploadControl.UploadedFiles[i];
            if (file.FileName != "") {
                string fileName = string.Format("{0}{1}", MapPath("~/Images/"), file.FileName);
            }
        }
    }
}
```

## Files to Review

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- feedback -->
## Does this example address your development requirements/objectives?

[<img src="https://www.devexpress.com/support/examples/i/yes-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=asp-net-web-forms-upload-control-save-files-on-the-server&~~~was_helpful=yes) [<img src="https://www.devexpress.com/support/examples/i/no-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=asp-net-web-forms-upload-control-save-files-on-the-server&~~~was_helpful=no)

(you will be redirected to DevExpress.com to submit your response)
<!-- feedback end -->
