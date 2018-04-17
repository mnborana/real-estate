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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fullcalendar.css"  type='text/css'/>
	<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/uniform.css" type='text/css'/> --%> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/select2.css" type='text/css'/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matrix-style.css"  type='text/css'/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matrix-media.css" type='text/css'/>
	<link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" type='text/css'/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.gritter.css" type='text/css'/>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
	

<style type="text/css">
  
  #snackbar {
	    visibility: hidden;
	    min-width: 250px;
	    margin-left: -125px;
	    background-color: #333;
	    color: #fff;
	    text-align: center;
	    border-radius: 50px;
	    padding: 16px;
	    position: fixed;
	    z-index: 1;
	    left: 50%;
	    top: 50px;
	    font-size: 17px;
	}
	
	#snackbar.show {
	    visibility: visible;
	    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
	    animation: fadein 0.5s, fadeout 0.5s 2.5s;
	}
	
	@-webkit-keyframes fadein {
	    from {top: 0; opacity: 0;} 
	    to {top: 50px; opacity: 1;}
	}
	
	@keyframes fadein {
	    from {top: 0; opacity: 0;}
	    to {top: 50px; opacity: 1;}
	}
	
	@-webkit-keyframes fadeout {
	    from {top: 50px; opacity: 1;} 
	    to {top: 0; opacity: 0;}
	}
	
	@keyframes fadeout {
	    from {top: 50px; opacity: 1;}
	    to {top: 0; opacity: 0;}
	}

</style>


</head>
<body onload="myFunction()">

<%	
	HttpSession httpSession = request.getSession(false);

	if(!(httpSession!=null && !session.isNew() && httpSession.getAttribute("username")!=null)){
		response.sendRedirect("/real-estate/logOut");
	}

%>

	 <c:if test="${status != null}">
  		<div id="snackbar">${status}</div>
	 </c:if>

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
	
	<div class="container-fluid">
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
					                <form:input type="text" path="siteName" class="span11" placeholder="Site Name" onkeyup="this.value=this.value.toUpperCase()" pattern="[a-zA-Z\s]*" required="required"/>
					              </div>
					            </div>
					            
					            <div class="control-group span6" style="margin: 0;">
					              <label class="control-label">Date :</label>
					              <div class="controls">
					                <form:input type="date" path="date" class="span11" required="required"/>
					              </div>
					            </div>	
				            </div>				            
				            <div class="span12" style="margin: 0;">
					            <div class="control-group span6">
					              <label class="control-label">Site Address :</label>
					              <div class="controls">
					                <form:input type="text" path="address"  class="span11" placeholder="Site Address" onkeyup="this.value=this.value.toUpperCase()" required="required"/>
					              </div>
					            </div>
					            
					            <div class="control-group span6" style="margin: 0;">
					              <label class="control-label">Sq Ft :</label>
					              <div class="controls">
					                <form:input type="text" path="sqft" class="span11" placeholder="Sq Ft" required="required"/>
					              </div>
					            </div>	
				            </div>
				            
				            <div class="span12" style="margin: 0;">
					            <div class="control-group span6">
					              <label class="control-label">Seller Name :</label>
					              <div class="controls">
					                <form:input type="text" path="sellerName" class="span11" placeholder="Seller Name" onkeyup="this.value=this.value.toUpperCase()" pattern="[a-zA-Z\s]*" required="required"/>
					              </div>
					            </div>
					             
					            <div class="control-group span6" style="margin: 0;">
					              <label class="control-label">Contact No :</label>
					              <div class="controls">
					                <form:input type="numbers" path="contactNo" maxlength="10" pattern="[0-9]*"  class="span11" required="required"/>
					              </div>
					            </div>	
				            </div>
				            
				            <div class="span13" style="margin: 0;">
					            <div class="control-group span6">
					              <label class="control-label">Price :</label>
					              <div class="controls">
					                <form:input type="text" path="price" class="span11" placeholder="Price" pattern="[0-9]*" required="required"/>
					              </div>
					            </div>
					              
					            <div class="control-group span6" style="margin: 0;">
					              <label class="control-label">Site Zone :</label>
					              <div class="controls">
					                <form:input type="text" path="zone" class="span11" placeholder="Site Zone" onkeyup="this.value=this.value.toUpperCase()"/>
					              </div>
					            </div>	
				            </div>
				            
				            <div class="span13" style="margin: 0;">
					            <div class="control-group span6">
					              <label class="control-label">Length :</label>
					              <div class="controls">
					                <form:input type="text" path="length" class="span11" pattern="[0-9]*" value="0" />
					              </div>
					            </div>
					            
					            <div class="control-group span6" style="margin: 0;">
					              <label class="control-label">Width :</label>
					              <div class="controls">
					                <form:input type="text" path="width" class="span11" pattern="[0-9]*" value="0" />
					              </div>
					            </div>	
				            </div>
				            
				            <div class="form-actions" style="padding-left: 500px;">
		                		<input type="submit" value="Save" class="btn btn-success center">
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
	                <tr class="gradeX" style="">
	                  <td><%=(count++) %></td>
	                  <td>${ print.date}</td>
	                  <td>${ print.siteName}</td>
					  <td>${ print.address}</td>
					  <td>${ print.sqft}</td>
	                  <td>${ print.price}</td>
	                  <td>${ print.sellerName}</td>
	                  <td>${ print.contactNo}</td>
	                  <td class="center"> &nbsp;&nbsp;
	                  		<a href="#updateSite" onclick="updateSite(${print.id})" data-toggle="modal" title="Update">
	                  			<i class="icon-pencil"></i>
	                  		</a>  | 
	                  		<a href="#deleteSite"  onclick="deleteSite(${print.id})" data-toggle="modal" title="Delete">
	                  			<i class="icon-remove"></i>
	                  		</a>
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
  <div id="footer" class="span12"> 2018 &copy; Brought to you by <a href="http://pustakosh.com">pustakosh.com</a> </div>
</div>

<!-- Update Modal Start -->
<div id="updateSite" class="modal hide fade" role="dialog" style="width: 65%; margin-left: -32%;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Update Site Details</h4>
			</div>
			<div class="modal-body">
				<form:form action="saveSite" modelAttribute="addSite"  method="POST" class="form-horizontal">
					<div class="control-group">
						<div class="span4" style="margin-left: -75px;">
						<label class="control-label">Site Name :</label>
						<div class="controls">
							<form:hidden path="id" id="sId"/>
							<form:input	type="text" path="siteName" id="siteName1" class="span3" placeholder="Site Name" onkeyup="this.value=this.value.toUpperCase()" pattern="[a-zA-Z\s]*" required="required" />
						</div>
						</div>

						<div class="span4">
						<label class="control-label">Date :</label>
						<div class="controls">
							<form:input type="date" path="date" id="date1" class="span3" required="required" />
						</div>
						</div>
					</div>

					<div class="control-group">
						<div class="span4" style="margin-left: -75px;">
						<label class="control-label">Site Address :</label>
						<div class="controls">
							<form:input	type="text" path="address" id="address1" class="span3" placeholder="Site Address" onkeyup="this.value=this.value.toUpperCase()" required="required" />
						</div>
						</div>

						<div class="span4">
						<label class="control-label">Sq Ft :</label>
						<div class="controls">
							<form:input type="text" path="sqft" id="sqft1" class="span3" placeholder="Sq Ft" required="required"/>
						</div>
						</div>
					</div>

					<div class="control-group">
						<div class="span4" style="margin-left: -75px;">
						<label class="control-label">Seller Name :</label>
						<div class="controls">
							<form:input type="text" path="sellerName" id="sellerName1" class="span3" placeholder="Seller Name" onkeyup="this.value=this.value.toUpperCase()" pattern="[a-zA-Z\s]*" required="required" />
						</div>
						</div>

						<div class="span4">
						<label class="control-label">Contact No :</label>
						<div class="controls">
							<form:input type="numbers" path="contactNo" id="contactNo1" class="span3" maxlength="10" pattern="[0-9]*" placeholder="Contact No" required="required" />
						</div>
						</div>
					</div>

					<div class="control-group">
						<div class="span4" style="margin-left: -75px;">
						<label class="control-label">Price :</label>
						<div class="controls">
							<form:input	type="text" path="price" id="price1" class="span3" placeholder="Price" pattern="[0-9]*" required="required" />
						</div>
						</div>

						<div class="span4">
						<label class="control-label">Site Zone :</label>
						<div class="controls">
							<form:input type="text" path="zone" id="zone1" class="span3" placeholder="Site Zone" onkeyup="this.value=this.value.toUpperCase()" required="required" />
						</div>
						</div>
					</div>					

					<div class="control-group">
						<div class="span4" style="margin-left: -75px;">
						<label class="control-label">Length :</label>
						<div class="controls">
							<form:input	type="text" path="length" id="length1" class="span3" placeholder="Length" pattern="[0-9]*" required="required" />
						</div>
						</div>

						<div class="span4">
						<label class="control-label">Width :</label>
						<div class="controls">
							<form:input type="text" path="width" id="width1" class="span3" placeholder="Width" pattern="[0-9]*" required="required" />
						</div>
						</div>
					</div>					
					<div class="form-actions" style="padding-left: 345px;">
						<button type="submit" name="save" id="submitbtn" class="btn btn-success">Update</button>
						<button type="button" class="btn btn-danger" style="margin-left: 10px;" data-dismiss="modal">Close</button>
					</div>
				</form:form>
			</div>

		</div>

	</div>
</div>
<!-- Update Modal End -->



<!-- Delete Modal Start -->
<div class="modal hide fade" id="deleteSite" role="dialog">
	<form:form action="deleteSite" modelAttribute="delete"  class="form-horizontal">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Delete Site</h4>
        </div>
        <div class="modal-body">
        
        		<form:hidden path="id" id="siteDeleteId"/> 		
    		   <div class="alert alert-warning">
  					<strong>Warning!</strong> Are you sure you want to delete this record ?
				</div>   
  	    </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>
      </div>
    </div>
    </form:form>
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

function deleteSite(id){	
	document.getElementById("siteDeleteId").value=id;
}

function myFunction() {
	
	if(document.getElementById("snackbar")!=null){
		
		var x = document.getElementById("snackbar");
	    x.className = "show";
	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);	
	}    
}

function updateSite(id) {
	 
	 $.ajax({
		  type: "post",
		  url: "${pageContext.request.contextPath}/site.htm",
		  cache: false,    
		  data:'siteId='+id,
		  success: function(response){
		  var obj = JSON.parse(response);
		  alert(obj);
		  setInModal(obj);
		  },
		  error: function(){      
		   alert('Error while request..');
		  }
		 });
	 
}

function setInModal(obj) {

	document.getElementById("sId").value		=obj[0].id;
	document.getElementById("siteName1").value	=obj[0].siteName;
	document.getElementById("sellerName1").value=obj[0].sellerName;
	document.getElementById("date1").value		=obj[0].date;
	document.getElementById("contactNo1").value	=obj[0].contactNo;
	document.getElementById("sqft1").value		=obj[0].sqft;
	document.getElementById("address1").value	=obj[0].address;
	document.getElementById("price1").value		=obj[0].price;
	document.getElementById("length1").value	=obj[0].length;
	document.getElementById("width1").value		=obj[0].width;
	document.getElementById("zone1").value		=obj[0].zone;

}


</script>

</body>
</html>