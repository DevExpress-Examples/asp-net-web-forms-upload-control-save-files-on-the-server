<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxLoadingPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">

	<script type="text/javascript">
		function UpdateUploadButton() {
			var isAnyFileSelected = false;
			for (var i = 0; i < uploadControl.GetFileInputCount(); i++) {
				if (uploadControl.GetText(i) != "") { isAnyFileSelected = true; break; }
			}
			btnUploadViaPostback.SetEnabled(isAnyFileSelected);
			btnUploadViaCallback.SetEnabled(isAnyFileSelected);
		}
	</script>

		<dx:ASPxLabel ID="lblAllowebMimeType" runat="server" Text="Allowed image types: jpeg, png">
		</dx:ASPxLabel>
		<br />

		<dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" Width="400px"
			ClientInstanceName="uploadControl" ShowAddRemoveButtons="True" 
			OnFilesUploadComplete="ASPxUploadControl1_FilesUploadComplete" 
			ShowProgressPanel="True" > <%-- Progress Panel is in effect in callback mode only. --%>
			<ValidationSettings AllowedFileExtensions=".jpg, .png">
			</ValidationSettings>
			<ClientSideEvents 
				Init="function(s, e) { UpdateUploadButton(); }" 
				TextChanged="function(s, e) { UpdateUploadButton(); }" 
				FilesUploadComplete="function(s, e) { UpdateUploadButton(); }" 
				FileUploadStart="function(s, e) {
					btnUploadViaPostback.SetEnabled(false);
					btnUploadViaCallback.SetEnabled(false);
				}" />
		</dx:ASPxUploadControl>

		<br />

		<dx:ASPxButton ID="ASPxButton1" runat="server" Width="150px" 
			AutoPostBack="True" Text="Upload via postback" ClientInstanceName="btnUploadViaPostback">
			<ClientSideEvents Click="function(s, e) { loadingPanel.Show(); }" /> <%-- Button click shows a loading panel and generates a postback. --%>
		</dx:ASPxButton>

		<br />

		<dx:ASPxButton ID="ASPxButton2" runat="server" Width="150px" 
			AutoPostBack="False" Text="Upload via callback" ClientInstanceName="btnUploadViaCallback" >
			<ClientSideEvents Click="function(s, e) { uploadControl.Upload(); }" /> <%-- Button click initiates upload via a callback. Progress panel is displayed automatically. --%>
		</dx:ASPxButton>

		<br />

		<%-- Loading Panel is used in this sample to visualize uploads performed via postbacks --%>
		<dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" 
			ContainerElementID="ASPxUploadControl1" ClientInstanceName="loadingPanel">
		</dx:ASPxLoadingPanel>

	</form>
</body>
</html>