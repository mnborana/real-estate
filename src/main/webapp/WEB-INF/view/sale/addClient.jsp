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

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toast.css"  type='text/css'/>
</head>
<body onload="myFunction()">

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
	 <c:if test="${result != null}">
  		<div id="snackbar">${result}</div>
	 </c:if>

<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="/real-estate/hello" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
  </div>
<!--End-breadcrumbs-->
	
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
	        	<div class="widget-box">
		          <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
		            <h5>Add Client</h5>
		          </div>
		          <div class="widget-content nopadding">
		            <form:form modelAttribute="clients" action="saveClient"  method="Post" class="form-horizontal">
	
		              <div class="control-group">
		                <label class="control-label">Client Name :</label>
		                <div class="controls span4" style="margin-left: 20px;">
		                  <form:input type="text" value="" onkeyup="this.value=this.value.toUpperCase()" id="clientName" path="name" class="span11" placeholder="Enter Client name" required="required"  />
		                </div>
		              
		                <label class="control-label" style="margin-left: -4%;">Contact No. :</label>
		                <div class="controls span4" style="margin-left: 20px;">
		                  <form:input type="number" path="contactNo" max="9999999999"  class="span11" placeholder="Enter Client Contact No." required="required"  />
		                </div>
		              </div>
	              	 
		              <div class="control-group">
		                <label class="control-label">Permanent Address :</label>
		                <div class="controls span4" style="margin-left: 20px;">
		                  <form:textarea id="permAddress" onkeyup="this.value=this.value.toUpperCase()" path="permAddress" class="span11"  required="required"  />
		                </div>
		              
		                <label class="control-label" style="margin-left: -4%;">Current Address :</label>
		                <div class="controls span4" style="margin-left: 20px;">
		                  <form:textarea path="curAddress" onkeyup="this.value=this.value.toUpperCase()" class="span11" required="required"  />
		                </div>
		              </div>
	              
	              
		              <div class="control-group">
		                <label class="control-label">Nominee Name :</label>
		                <div class="controls span4" style="margin-left: 20px;">
		                  <form:input type="text" value="" onkeyup="this.value=this.value.toUpperCase()" id="nomineeName" path="nomineeName" class="span11" placeholder="Enter Nominee name" required="required"  />
		                </div>
		              
		                <label class="control-label" style="margin-left: -4%;">Nominee Contact No. :</label>
		                <div class="controls span4" style="margin-left: 20px;">
		                  <form:input type="number" path="nomineeContact" max="9999999999"   class="span11" placeholder="Nominee Contact No." required="required"  />
		                </div>
		              </div>
		              
		              <div class="control-group">
		                <label class="control-label">Nominee Relation :</label>
		                <div class="controls span4" style="margin-left: 20px;">
		                  <form:input type="text" value="" id="relation" pattern="[a-zA-Z]*" onkeyup="this.value=this.value.toUpperCase()" path="relation" class="span11" placeholder="Nominee's Relation with Client" required="required" />
		                </div>
		              </div>
		            
		              <div class="form-actions" style="padding-left: 500px;">
		                <input type="submit" value="Save" class="btn btn-success center">
		              </div>
		              
		            </form:form>
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
		                  <th>Sr.No.</th>
		                  <th>Client Name</th>
		                  <th>Contact No.</th>
		                  <th>Permanent Address</th>
		                  <th>Current Address</th>
		                  <th>Nominee Name</th>
		                  <th>Nominee Contact</th>
		                  <th>Relation</th>
		                  <th>Action</th>
		                </tr>
		              </thead>
		              
		              <tbody>
		              	<% int counter=1; %>
		                <c:forEach var="clientList" items="${clientList}">
		                	<tr>
		                		<td><%=counter%></td>
		                		<td>${clientList.name}</td>
		                		<td>${clientList.contactNo}</td>
		                		<td>${clientList.permAddress}</td>
		                		<td>${clientList.curAddress}</td>
		                		<td>${clientList.nomineeName}</td>
		                		<td>${clientList.nomineeContact}</td>
		                		<td>${clientList.relation}</td>
		                		<td>
		                			<a href="#updateClient" data-toggle="modal" onclick="updateClient(${clientList.id})"><i class="icon-pencil"></i></a> | 
		                			<a href="#deleteClient"  onclick="deleteClient(${clientList.id})" data-toggle="modal"><i class="icon-remove"></i></a>
		                		</td>
		                	</tr>
		                	
		                	<%counter++; %>
		                </c:forEach>
		                
		              </tbody>
		            </table>
		            
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


<!-- Delete Modal Start -->
<div class="modal fade" id="deleteClient" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Confirm Delete Client</h4>
        </div>
        <form action="deleteClient" method="post">
	        <div class="modal-body">
	   		   <div class="alert alert-warning">
	   		   		<input type="hidden"  name="clientDeleteId" id="ClientDeleteId"/>
	 				<strong>Warning!</strong> <br> &nbsp;&nbsp;&nbsp; Are you sure you want to delete this record ?
				</div>   
	  	    </div>
	        <div class="modal-footer">
	          <button type="submit" class="btn btn-primary"  >Yes</button>
	          <button type="button" style="background-color: #f64c4c; color: white;" class="btn btn-default" data-dismiss="modal">No</button>
	        </div>
        </form>
      </div>
    </div>
  </div>
<!-- Delete Modal End -->


<!-- update Modal Start -->
<div class="modal fade hide" id="updateClient" style="margin-left: -35%; width: 70%;" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Update Client Details</h4>
        </div>
        <div class="widget-content nopadding">
        <form:form modelAttribute="clients" action="saveClient"  method="Post" class="form-horizontal">
             <div class="control-group">
               <label class="control-label">Client Name :</label>
               <div class="controls span4" style="margin-left: 20px; width:25%; ">
               	 <form:hidden path="id" id="updateId"/>
                 <form:input type="text" value="" onkeyup="this.value=this.value.toUpperCase()" id="updateClientName" path="name" class="span3" placeholder="Enter Client name" required="required"  />
               </div>
             
               <label class="control-label">Contact No. :</label>
               <div class="controls span4" style="margin-left: 20px; width:25%;">
                 <form:input type="number" id="updateContactNo" max="9999999999" path="contactNo" maxlength="10" class="span3" placeholder="Enter Client Contact No." required="required"  />
               </div>
             </div>
            	 
             <div class="control-group">
               <label class="control-label">Permanent Address :</label>
               <div class="controls span4" style="margin-left: 20px; width:25%; ">
                  <form:textarea id="updatePermAddress" onkeyup="this.value=this.value.toUpperCase()" path="permAddress" class="span3"  required="required"  />
               </div>
             
               <label class="control-label">Current Address :</label>
               <div class="controls span4" style="margin-left: 20px; width:25%;">
                 <form:textarea id="updateCurAddress" onkeyup="this.value=this.value.toUpperCase()"  path="curAddress" class="span3" required="required"  />
               </div>
             </div>
            
            
             <div class="control-group">
               <label class="control-label">Nominee Name :</label>
               <div class="controls span4" style="margin-left: 20px; width:25%; ">
                 <form:input type="text" value="" onkeyup="this.value=this.value.toUpperCase()" id="updateNomineeName" path="nomineeName" class="span3" placeholder="Enter Nominee name" required="required"  />
               </div>
             
               <label class="control-label">Nominee Contact No. :</label>
               <div class="controls span4" style="margin-left: 20px; width:25%;">
                 <form:input type="number" path="nomineeContact" max="9999999999" id="updateNomineeContact" maxlength="10"  class="span3" placeholder="Nominee Contact No." required="required"  />
               </div>
             </div>
             
             <div class="control-group">
               <label class="control-label">Nominee Relation :</label>
               <div class="controls span4" style="margin-left: 20px; width:25%; ">
                 <form:input type="text" value="" onkeyup="this.value=this.value.toUpperCase()" pattern="[a-zA-Z]*" id="updateRelation" path="relation" class="span3" placeholder="Nominee's Relation with Client" required="required" />
               </div>
             </div>
           
             <div class="form-actions" style="padding-left: 780px;">
               <input type="submit" value="Update" class="btn btn-success center">
               <button type="button" style="background-color: #f64c4c; color: white;" class="btn btn-default" data-dismiss="modal">Close</button>
             </div>
             
           </form:form>
           </div>
      </div>
    </div>
  </div>
<!-- update Modal End -->



<script type="text/javascript">


function myFunction() {
	
	if(document.getElementById("snackbar")!=null)
	{
		var x = document.getElementById("snackbar");
	    x.className = "show";
	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);	
	}
}

function deleteClient(id) {
	
	document.getElementById("ClientDeleteId").value=id;
}


function updateClient(id) {
	
 	$.ajax({
		  type: "post",
		  url: "${pageContext.request.contextPath}/updateClient",
		  cache: false,    
		  data:'clientId='+id,
		  success: function(response){
			var obj = JSON.parse(response);
			//alert(obj[0].name);
		
			document.getElementById("updateId").value=obj[0].id;
			document.getElementById("updateClientName").value=obj[0].name;
			document.getElementById("updateContactNo").value=obj[0].contactNo;
			document.getElementById("updatePermAddress").value=obj[0].permAddress;
			document.getElementById("updateCurAddress").value=obj[0].curAddress;
			document.getElementById("updateNomineeName").value=obj[0].nomineeName;
			document.getElementById("updateNomineeContact").value=obj[0].nomineeContact;
			document.getElementById("updateRelation").value=obj[0].relation;
			
		  },
		  error: function(){      
		   alert('Error while request..');
		  }
	   });  
	
}

	
</script>

<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.uniform.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/matrix.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/matrix.tables.js"></script>


<script type="text/javascript">




</script>
</body>
</html>
