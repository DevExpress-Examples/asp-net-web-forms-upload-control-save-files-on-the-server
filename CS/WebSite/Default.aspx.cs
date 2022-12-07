using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e){

    }

    protected void ASPxUploadControl1_FilesUploadComplete(object sender, DevExpress.Web.FilesUploadCompleteEventArgs e){
        // Intentionally pauses server-side processing to demonstrate the Loading Panel or Progress Panel functionality
        System.Threading.Thread.Sleep(2000);

        ASPxUploadControl uploadControl = sender as ASPxUploadControl;

        if (uploadControl.UploadedFiles != null && uploadControl.UploadedFiles.Length > 0){
            for (int i = 0; i < uploadControl.UploadedFiles.Length; i++){
                UploadedFile file = uploadControl.UploadedFiles[i];
                if (file.FileName != ""){
                    string fileName = string.Format("{0}{1}", MapPath("~/Images/"), file.FileName);
                    //file.SaveAs(fileName, true);//OnLine Demo Restriction
                }
            }
        }
    }
}
