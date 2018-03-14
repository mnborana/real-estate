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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/uniform.css" type='text/css'/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/select2.css" type='text/css'/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matrix-style.css"  type='text/css'/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matrix-media.css" type='text/css'/>
	<link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" type='text/css'/>
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
    <div id="breadcrumb"> 
    <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a>
    <a href="#">Setting</a>
    <a class="current" href="#" >Add Organization</a>
    </div>
  </div>
<!--End-breadcrumbs-->

<div class="container-fluid">
	  
	<div class="row-fluid">
		<div class="span12">
	      <div class="widget-box">
	        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
	          <h5>Organization-Information</h5>
	        </div>
	        <div class="widget-content nopadding">
	          <form:form action="saveOrganization" modelAttribute="orgnization"  method="POST" class="form-horizontal">
    			<div class="span12">
		            <div class="control-group span6">
		              <label class="control-label">Date :</label>
		              <div class="controls">
		                <form:input id="" type="date" class="form-control"  path="date" required="required"/>
		              </div>
		            </div>
		            <div class="control-group span6">
		              <label class="control-label">Orgnization Name :</label>
		              <div class="controls">
		                <form:input id="" class="form-control"  path="orgname" required="required"/>
		              </div>
		            </div>
	            </div>
	            <div class="span12" style="margin: 0;">
		            <div class="control-group span6">
		              <label class="control-label">Owner Name : </label>
		              <div class="controls">
		                <form:input id="" class="form-control"  path="name" required="required"/>
		              </div>
		            </div>
		            <div class="control-group span6">
		              <label class="control-label">Address :</label>
		              <div class="controls">
		                <form:input id="" class="form-control"  path="address" required="required"/>
		              </div>
		            </div>
		            </div>
	            <div class="span12" style="margin: 0;">
	            <div class="control-group span6">
	              <label class="control-label">Contact No :</label>
	              <div class="controls">
	                <form:input id="" type="numbers" class="form-control"  path="contact" required="required"/>
	            </div>
	            </div>
	            <div class="control-group span6">
	              <label class="control-label">Email : </label>
	              <div class="controls">
	                <form:input id="" class="form-control"  path="email" required="required"/>
	              </div>
	            </div>
	            </div>
	            <div class="form-actions text-center"">
	              <button type="submit" class="btn btn-success">Save</button>
	            </div>
	            </form:form>
	        </div>
	      </div>
	      
	      
	     <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Organization Details</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                  <th>Sr No.</th>
                  <th>Date</th>
                  <th>Org Name</th>
                  <th>Owner Name</th>
                  <th>Address</th>
                  <th>Contact No</th>
                  <th>Email</th>
				  <th>Action</th>                  
                </tr>
              </thead>
              <tbody>
              	 <%int count=1; %>
              	<c:forEach var="org" items="${orgDetails}">
              	    <tr class="gradeX">
	                  <td><%=(count++) %></td>
	                  <td>${org.date }</td>
	                  <td>${org.orgname }</td>
					  <td>${org.name }</td>
					  <td>${org.address }</td>
	                  <td>${org.contact }</td>
	                  <td>${org.email }</td>
	                  <td class="center">
	                  		Update || 
	                  		<a href="#deleteOrg"  onclick="deleteOrg()" data-toggle="modal">Delete</a>
	                  </td>
	                </tr>
	                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>	
    </div>
	</div>
</div>
</div>

<!-- Delete Modal Start -->
<div class="modal fade" id="deleteOrg" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Delete Organization</h4>
        </div>
        <div class="modal-body">
        
        		<%-- <form:hidden path="id" id="emplDeleteId"/> --%>		
    		   <div class="alert alert-warning">
  					<strong>Warning!</strong> Are you sure you want to delete this record ?
				</div>   
  	    </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary"  >Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>
      </div>
    </div>
  </div>
<!-- Delete Modal End -->


<!--end-main-container-part-->

<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; Matrix Admin. Brought to you by <a href="http://themedesigner.in">Themedesigner.in</a> </div>
</div>

<!--end-Footer-part-->

<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.uniform.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/matrix.js"></script>
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

function deleteOrg()
{
	
}

</script>
</body>
</html>
