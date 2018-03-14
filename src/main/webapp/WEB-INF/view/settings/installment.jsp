<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Vertical</title>
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
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
  </div>
<!--End-breadcrumbs-->
	
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
	        	<div class="widget-box">
		          <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
		            <h5>Add Installment</h5>
		          </div>
		          <div class="widget-content nopadding">
		            <form:form modelAttribute="installments" action="saveInstallments"  method="Post" class="form-horizontal">
		              
		              <div class="control-group">
		                <label class="control-label">No. Of Modes :</label>
		                <div class="controls span3" style="margin-left: 20px;">
		                  <input type="text" id="noOfModes" value="1" onblur="createInstallments(this.value)" class="span11" placeholder="Enter No. of Modes" required />
		                </div>
		              </div>
		              
		              <div id="installmentsDiv">
			              <div class="control-group">
			                <label class="control-label">Mode Name :</label>
			                <div class="controls span3" style="margin-left: 20px;">
			                  <form:input type="text" value="" id="modeName" path="modeName" class="span11" placeholder="Enter Mode name" required="required" readonly="true" />
			                </div>
			              
			                <label class="control-label">No. Of Installments :</label>
			                <div class="controls span3" style="margin-left: 20px;">
			                  <form:input type="text" path="noOfInstallment"  class="span11" placeholder="Enter No. of Installments" required="required"  />
			                </div>
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
		                  <th>Mode Name</th>
		                  <th>No. Of Installments</th>
		                  <th>Action</th>
		                </tr>
		              </thead>
		              
		              <tbody>
		              	<% int counter=1; %>
		                <c:forEach var="instaList" items="${installmentsList}">
		                	<tr>
		                		<td><%=counter%></td>
		                		<td id="modeName<%=counter%>">${instaList.modeName}</td>
		                		<td>${instaList.noOfInstallment}</td>
		                		<td><a href="" data-toggle="modal" onclick="updateInsta(${instaList.id})">Update</a> | <a href="#deleteMode"  onclick="deleteInsta(${instaList.id})" data-toggle="modal">Delete</a></td>
		                	</tr>
		                	
		                	<%counter++; %>
		                </c:forEach>
		                <%counter--; %>
		                
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
<div class="modal fade" id="deleteMode" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Confirm Delete Mode</h4>
        </div>
        <div class="modal-body">
   		   <div class="alert alert-warning">
   		   		<input type="hidden" id="ModeDeleteId"/>
 				<strong>Warning!</strong> <br> &nbsp;&nbsp;&nbsp; Are you sure you want to delete this record ?
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



<script type="text/javascript">

var firstDiv=document.getElementById("installmentsDiv").innerHTML;
var cnt=0;
var orgcnt = 0;

function createInstallments(num) { 
	
	var div = document.getElementById("installmentsDiv"); 
	var s = firstDiv;
	var r="";
	var i=num;
	var n=1;
	cnt = orgcnt;
	
	while(i>0){
		r = r + firstDiv.split("type")[0]+ "value='Mode_"+(++cnt)+"' type" + firstDiv.split("type")[1]+ " type"+firstDiv.split("type")[2];
		i--;
		n++;
	}
	
	div.innerHTML=r; 
	
}

function deleteInsta(id) {
	
	document.getElementById("ModeDeleteId").value=id;
	
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


function myFunction() {
	
	if(document.getElementById("snackbar")!=null)
	{
		var x = document.getElementById("snackbar");
	    x.className = "show";
	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);	
	}
	
	
    $.ajax({
	  type: "post",
	  url: "${pageContext.request.contextPath}/getLastMode.htm",
	  cache: false,    
	  data:'getLastMode=1',
	  success: function(response){
	  var obj = response;
	  
	  var s = obj.split("_");
	  cnt = s[1];
	  orgcnt = s[1];
	  
	  document.getElementById("modeName").value=s[0]+"_"+(++cnt);
	  },
	  error: function(){      
	   alert('Error while request..');
	  }
   }); 
	 
}


</script>
</body>
</html>
