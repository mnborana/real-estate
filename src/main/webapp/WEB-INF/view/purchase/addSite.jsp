<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Real Estate</title>
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
	
<%-- 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fullcalendar.css"  type='text/css'/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.gritter.css" type='text/css'/> --%>
	
</head>
<body>

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
    <h1>Add Site</h1>
  </div>
<!--End-breadcrumbs-->
	
	<div class="container-fluid">
		<hr>
		<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
				        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
				          <h5>Add Site</h5>
				        </div>
				        <div class="widget-content nopadding">
				          <form:form action="saveSite" modelAttribute="addSite" method="POST" class="form-horizontal">
				            
				            <div class="span12" style="margin: 0;">
					            <div class="control-group span6">
					              <label class="control-label">Site Name :</label>
					              <div class="controls">
					                <form:input type="text" path="siteName" class="span11" placeholder="Site Name" />
					              </div>
					            </div>
					            
					            <div class="control-group span6" style="margin: 0;">
					              <label class="control-label">Date :</label>
					              <div class="controls">
					                <form:input type="date" path="date" class="span11" />
					              </div>
					            </div>	
				            </div>				            
				            <div class="span12" style="margin: 0;">
					            <div class="control-group span6">
					              <label class="control-label">Site Address :</label>
					              <div class="controls">
					                <form:input type="text" path="address"  class="span11" placeholder="Site Address" />
					              </div>
					            </div>
					            
					            <div class="control-group span6" style="margin: 0;">
					              <label class="control-label">Sq Ft :</label>
					              <div class="controls">
					                <form:input type="text" path="sqft" class="span11" placeholder="Sq Ft" />
					              </div>
					            </div>	
				            </div>
				            
				            <div class="span12" style="margin: 0;">
					            <div class="control-group span6">
					              <label class="control-label">Seller Name :</label>
					              <div class="controls">
					                <form:input type="text" path="sellerName" class="span11" placeholder="Seller Name" />
					              </div>
					            </div>
					             
					            <div class="control-group span6" style="margin: 0;">
					              <label class="control-label">Contact No :</label>
					              <div class="controls">
					                <form:input type="number" path="contactNo"  class="span11" placeholder="Contact No" />
					              </div>
					            </div>	
				            </div>
				            
				            <div class="span13" style="margin: 0;">
					            <div class="control-group span6">
					              <label class="control-label">Price :</label>
					              <div class="controls">
					                <form:input type="text" path="price" class="span11" placeholder="Price" />
					              </div>
					            </div>
					              
					            <div class="control-group span6" style="margin: 0;">
					              <label class="control-label">Site Zone :</label>
					              <div class="controls">
					                <form:input type="text" path="zone" class="span11" placeholder="Site Zone" />
					              </div>
					            </div>	
				            </div>
				            
				            <div class="span13" style="margin: 0;">
					            <div class="control-group span6">
					              <label class="control-label">Length :</label>
					              <div class="controls">
					                <form:input type="text" path="length" class="span11" placeholder="Length" />
					              </div>
					            </div>
					            
					            <div class="control-group span6" style="margin: 0;">
					              <label class="control-label">Width :</label>
					              <div class="controls">
					                <form:input type="text" path="width" class="span11" placeholder="Width" />
					              </div>
					            </div>	
				            </div>
				            
				            <div class="form-actions">
				              <br>
				              <button type="submit" class="btn btn-success">Save</button>
				            </div>
				          </form:form>
				        </div>
				      </div>
			</div>
			
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Data table</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                  <th>Sr No.</th>
                  <th>Date</th>
                  <th>Site Name</th>
                  <th>Address</th>
                  <th>Sq Ft</th>
				  <th>Price</th>
				  <th>Seller Name</th>
				  <th>Contact No</th>
				  <th>Action</th>                  
                </tr>
              </thead>
              <tbody>
              	 <%int count=1; %>
	    		 <c:forEach var="print" items="${sites}">
	                <tr class="gradeX">
	                  <td><%=(count++) %></td>
	                  <td>${ print.date}</td>
	                  <td>${ print.siteName}</td>
					  <td>${ print.address}</td>
					  <td>${ print.sqft}</td>
	                  <td>${ print.price}</td>
	                  <td>${ print.sellerName}</td>
	                  <td>${ print.contactNo}</td>
	                  <td class="center">
	                  		Update || 
	                  		<a href="#deleteEmp"  onclick="deleteEmp(${print.id})" data-toggle="modal">Delete</a>
	                  </td>
	                </tr>

	                <!--
	                	private int id;
	                  -->
	                
	             </c:forEach>   
              </tbody>
            </table>
          </div>
        </div>			
			
			
		</div>
	</div>
	

</div>
<!--end-main-container-part-->

<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12"> 2018 &copy; Matrix Admin. Brought to you by <a href="http://pustakosh.com">pustakosh.com</a> </div>
</div>


<!-- Delete Modal Start -->
<div class="modal fade" id="deleteEmp" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Delete Site</h4>
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

function deleteEmp(id)
{
	//alert(id);
	document.getElementById("emplDeleteId").value=id;
	
}

</script>

</body>
</html>