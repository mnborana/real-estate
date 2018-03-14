<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Organization</title>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toast.css" type='text/css'/>
	
</head>
<body onload="myFunction()">

<!--Header-part-->
<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
<!--close-Header-part-->


<!--sidebar-menu-->
<jsp:include page="/WEB-INF/view/common/leftnavbar.jsp"></jsp:include>
<!--sidebar-menu-->



<!--main-container-part-->
<div id="content">
		<c:if test="${status != null}">
  			<div id="snackbar">${status}</div>
		</c:if>
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
  </div>
<!--End-breadcrumbs-->

<div class="container-fluid">
	  
	<div class="row-fluid">
		<div class="span12">
	      <div class="widget-box">
	        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
	          <h5>Personal-info</h5>
	        </div>
	        <div class="widget-content nopadding">
	          <form:form action="saveOrganization" modelAttribute="orgnization"  method="POST" class="form-horizontal">
    
	            <div class="control-group">
	              <label class="control-label">Date :</label>
	              <div class="controls">
	                <form:input id="" type="date" class="form-control"  path="date" required="required"/>
	              </div>
	            </div>
	            <div class="control-group">
	              <label class="control-label">Orgnization Name :</label>
	              <div class="controls">
	                <form:input id="" class="form-control"  path="orgname" required="required"/>
	              </div>
	            </div>
	            <div class="control-group">
	              <label class="control-label">Owner Name : </label>
	              <div class="controls">
	                <form:input id="" class="form-control"  path="name" required="required"/>
	              </div>
	            </div>
	            <div class="control-group">
	              <label class="control-label">Address :</label>
	              <div class="controls">
	                <form:input id="" class="form-control"  path="address" required="required"/>
	              </div>
	            </div>
	            <div class="control-group">
	              <label class="control-label">Contact No :</label>
	              <div class="controls">
	                <form:input id="" type="numbers" class="form-control"  path="contact" required="required"/>
	            </div>
	            </div>
	            <div class="control-group">
	              <label class="control-label">Email : </label>
	              <div class="controls">
	                <form:input id="" class="form-control"  path="email" required="required"/>
	              </div>
	            </div>
	            <div class="form-actions text-center"">
	              <button type="submit" class="btn btn-success">Save</button>
	            </div>
	            </form:form>
	        </div>
	      </div>
	      
    </div>
    

	</div>
</div>

</div>




<!--end-main-container-part-->

<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; Matrix Admin. Brought to you by <a href="http://themedesigner.in">Themedesigner.in</a> </div>
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
function myFunction() {
	if(document.getElementById("snackbar")!=null)
	{
		var x = document.getElementById("snackbar");
	    x.className = "show";
	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);	
	}
}

</script>
</body>
</html>
