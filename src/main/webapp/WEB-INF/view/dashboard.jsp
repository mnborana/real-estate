<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Real Estate</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"  type='text/css'/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.min.css"  type='text/css'/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fullcalendar.css"  type='text/css'/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matrix-style.css"  type='text/css'/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matrix-media.css" type='text/css'/>
	<link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" type='text/css'/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.gritter.css" type='text/css'/>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>
<body>

<%	
	HttpSession httpSession = request.getSession(false);

	if(!(httpSession!=null && !session.isNew() && httpSession.getAttribute("username")!=null)){
		response.sendRedirect("/real-estate/logOut");
	}

%>

<!--Header-part-->
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<!--close-Header-part-->


<!--sidebar-menu-->
<jsp:include page="/WEB-INF/view/common/leftnavbar.jsp"></jsp:include>
<!--sidebar-menu-->



<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
  </div>
<!--End-breadcrumbs-->

</div>

<!--end-main-container-part-->

<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; Matrix Admin. Brought to you by <a href="#">Themedesigner.in</a> </div>
</div>

<!--end-Footer-part-->

<script src="${pageContext.request.contextPath}/resources/js/excanvas.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.custom.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.flot.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.flot.resize.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.peity.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/fullcalendar.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/matrix.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/matrix.dashboard.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.gritter.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/matrix.interface.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/matrix.chat.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/matrix.form_validation.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.wizard.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.uniform.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/select2.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/matrix.popover.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/matrix.tables.js"></script> 

<script type="text/javascript">
  // This function is called from the pop-up menus to transfer to
  // a different page. Ignore if the value returned is a null string:
  function goPage (newURL) {

      // if url is empty, skip the menu dividers and reset the menu selection to default
      if (newURL != "") {
      
          // if url is "-", it is this page -- reset the menu:
          if (newURL == "-" ) {
              resetMenu();            
          } 
          // else, send page to designated URL            
          else {  
            document.location.href = newURL;
          }
      }
  }

// resets the menu selection upon entry to this page:
function resetMenu() {
   document.gomenu.selector.selectedIndex = 2;
}
</script>
</body>
</html>
