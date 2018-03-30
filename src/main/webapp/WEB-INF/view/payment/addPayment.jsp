<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"  %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
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
    <div id="breadcrumb"> <a href="/real-estate/hello" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
  </div>
<!--End-breadcrumbs-->
	
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
	        	<div class="widget-box">
		          <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
		            <h5>Payment</h5>
		          </div>
		          <div class="widget-content nopadding">
		            <form:form modelAttribute="payment" action="addPayment"  method="Post" class="form-horizontal">
		              		
		              		
		              			 <div class="control-group">
					                <label class="control-label">Select Client :</label>
					                <div class="controls span4" style="margin-left: 20px;">
					                
					                <form:select path="clientId">
					                	<form:option value="0" label="Select Client"></form:option>
					                	<c:forEach items="${listOfClientsList}" var="clientList">
					                		
					                		<form:option value="${clientList.id }" label="${clientList.name }"></form:option>
					                	
					                	</c:forEach>
					                </form:select>
					                	
		                			</div>
		                			
		                			<label class="control-label">Select Plot :</label>
					                <div class="controls span4" style="margin-left: 20px;">
					                	<form:select path="plotId">
					                	 <form:option value="0" label="Select Plot"></form:option>
					                		<c:forEach items="${selectPlotting}" var="plotList">
					                		
					                		<form:option value="${plotList.id }" label="${plotList.plot_name }"></form:option>
					                	
					                	</c:forEach>
					                	</form:select>
		                			</div>
		                			
		            			  </div>
		              			<div class="control-group">
		                			<label class="control-label">Date :</label>
		              				  <div class="controls span4" style="margin-left: 20px;">
		                				  <form:input type="date" path="requiredDate" class="span11" required="required"/>
		               				  </div>
		               				  
		               				  <label class="control-label">Toten Amount :</label>
		              				  <div class="controls span4" style="margin-left: 20px;">
		                				  <input type="text"  path="tokenAmount" class="span11" placeholder="Toten Amount" required />
		               				  </div>
		            		    </div>
		              	
		              		
		              			<div class="control-group">
		                			<label class="control-label">Rem.Amount :</label>
		              				  <div class="controls span4" style="margin-left: 20px;">
		              				  <c:forEach items="${listRemAmt}" var="listRem">
		                				  <input type="text" path="remAmount" readonly value="${listRem.remAmount}" class="span11" placeholder="Rem Amount"  />
		               				  </c:forEach>
		               				  </div>
		               				  
		               				  
		               				  <label class="control-label">Pay Amount :</label>
		              				  <div class="controls span4" style="margin-left: 20px;">
		                				  <input type="text"  path="payAmount" class="span11" placeholder="Pay Amount" required />
		               				  </div>
		               				  
		            		    </div>
			            		 <div class="control-group">
			                			<label class="control-label">Mode :</label>
			                			<c:forEach items="${theModes}" var="theModes">
				              				  <div class="controls span4" style="margin-left: 20px;">
				              				 	 <form:hidden path="mode" value="${theModes.id}" />
				                				  <input type="text" value="${theModes.modeName}" readonly  class="span11" placeholder="Mode" />
				               				  </div>
			               				  </c:forEach>
			               				  <label class="control-label">Installments No :</label>
			               				  <c:forEach items="${installmentNo}" var="installmentsNo">
			               				  	<div class="controls span4" style="margin-left: 20px;">
			               				  	
			                				  <input type="text" readonly path="installamentNo" class="span11" value="${installmentsNo.installmentNo +1}" placeholder="Installments" />
			               				  </div>
			               				  </c:forEach>
			              				  
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
		                  <th>Plot</th>
		                  <th>Date</th>
		                  <th>Remaining Amount</th>
		                  <th>Token Amount</th>
		                  <th>Pay Amount</th>
		                  <th>Mode</th>
		                  <th>Installment No</th>
		                  <th>Action</th>
		                </tr>
		              </thead>
		              
		              <tbody>
		                <% int counter=1; %>
		                <c:forEach var="paymentList" items="${listOfPayments}">
		                	<tr>
		                	
		                		<td style="align:center" id="${paymentList.id}"><%=counter%></td>
		                		<td style="align:center">${paymentList.clientId}</td>
		                		<td style="align:center">${paymentList.plotId}</td>
		                		<td style="align:center">${paymentList.requiredDate}</td>
		                		<td style="align:center">${paymentList.remAmount}</td>
		                		<td style="align:center">${paymentList.tokenAmount}</td>
		                		<td style="align:center">${paymentList.payAmount}</td>
		                		<td style="align:center">${paymentList.mode}</td>
		                		<td style="align:center">${paymentList.installmentNo}</td>
		                		<td style="align:center"><a href="#updateMode" data-toggle="modal" onclick="updateInsta(${paymentList.id})">Update</a> | <a href="#deleteMode"  onclick="deleteInsta(${paymentList.id})" data-toggle="modal">Delete</a></td>
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
  <div id="footer" class="span12"> 2018 &copy; Matrix Admin. Brought to you by <a href="http://themedesigner.in">Themedesigner.in</a> </div>
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


</script>
</body>
</html>
