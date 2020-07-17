<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="description" content="bootstrap material admin template">
<meta name="author" content="">

<title>e-DAUL</title>

<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/images/apple-touch-icon.png">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico">

<!-- Stylesheets -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap-extend.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/site/site.min.css">

<!-- Plugins -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animsition/animsition.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/asscrollable/asScrollable.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/switchery/switchery.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/intro-js/introjs.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/slidepanel/slidePanel.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flag-icon-css/flag-icon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/waves/waves.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chartist/chartist.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jvectormap/jquery-jvectormap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chartist-plugin-tooltip/chartist-plugin-tooltip.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard/v1.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/login-v3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/datatables.net-fixedheader-bs4/dataTables.fixedheader.bootstrap4.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/datatables.net-fixedcolumns-bs4/dataTables.fixedcolumns.bootstrap4.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/datatables.net-rowgroup-bs4/dataTables.rowgroup.bootstrap4.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/datatables.net-scroller-bs4/dataTables.scroller.bootstrap4.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/datatables.net-select-bs4/dataTables.select.bootstrap4.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/datatables.net-responsive-bs4/dataTables.responsive.bootstrap4.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/datatables.net-buttons-bs4/dataTables.buttons.bootstrap4.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tables/datatable.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/register-v3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fileupload/jquery.fileupload.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fileupload/dropify.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker/bootstrap-datepicker.css">

<!-- Fonts -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/font/font-awesome/font-awesome.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/font/material-design/material-design.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/font/brand-icons/brand-icons.min.css">
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,300italic'>

<!--[if lt IE 9]>
<script src="../../global/vendor/html5shiv/html5shiv.min.js"></script>
<![endif]-->

<!--[if lt IE 10]>
<script src="../../global/vendor/media-match/media.match.min.js"></script>
<script src="../../global/vendor/respond/respond.min.js"></script>
<![endif]-->

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/js/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/breakpoints/breakpoints.js"></script>

 <script src="${pageContext.request.contextPath}/js/upload/uploads.js"></script> 
 
<script type="text/javascript">
    Breakpoints();
    
	function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
        var results = regex.exec(location.search);
        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }
</script>
