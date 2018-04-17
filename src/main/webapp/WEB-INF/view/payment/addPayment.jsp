<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Real Estate</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	type='text/css' />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.min.css"
	type='text/css' />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/uniform.css"
	type='text/css' />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/select2.css"
	type='text/css' />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/matrix-style.css"
	type='text/css' />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/matrix-media.css"
	type='text/css' />
<link
	href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" type='text/css' />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/toast.css"
	type='text/css' />
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
			<div id="breadcrumb">
				<a href="/real-estate/hello" title="Go to Home" class="tip-bottom"><i
					class="icon-home"></i> Home</a>
			</div>
		</div>
		<!--End-breadcrumbs-->

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-align-justify"></i>
							</span>
							<h5>Payment</h5>
						</div>
						<div class="widget-content nopadding">
							<form:form modelAttribute="payment" action="savePayment"
								method="Post" class="form-horizontal">
								<div class="control-group">
									<label class="control-label">Select Client :</label>
									<div class="controls span4" style="margin-left: 20px;">
										<form:select path="clientId"
											onchange="getClintInfo(this.value)">
											<form:option value="0" label="Select Client"></form:option>
											<c:forEach items="${listOfClientsList}" var="clientList">
												<form:option value="${clientList.id }"
													label="${clientList.name }"></form:option>
											</c:forEach>
										</form:select>
									</div>
									<label class="control-label" style="margin-left: -8%;">Select
										Plot :</label>
									<div class="controls span4" style="margin-left: 20px;">
										<select id="plotList" onchange="getAmountInfo(this.value)">
											<option value="0" label="Select Plot"></option>
										</select>
									</div>
									<form:hidden path="plotId" id="plotId"/>
								</div>
								<div class="control-group">
									<label class="control-label">Date :</label>
									<div class="controls span4" style="margin-left: 20px;">
										<form:input type="date" path="requiredDate" id="todaysDate" class="span11"
											required="required" />
									</div>
									<label class="control-label" style="margin-left: -2%;width: 10.5%;">Pay
										Amount :</label>
									<div class="controls span4" style="margin-left: 20px;">
										<form:input type="text" path="payAmount" id="payAmount" onkeyup="amountCal(this.value)" class="span11" placeholder="Pay Amount" required="required" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Next Installments Date :</label>
									<div class="controls span4" style="margin-left: 20px;">
										<form:input type="date" path="nextInstDate" id="instDate" class="span11"
											required="required" />
									</div>
									<label class="control-label" style="margin-left: -1%;width: 9.5%;">Mode
										:</label>
									<div class="controls span4" style="margin-left: 20px;">
										<input type="text" id="modeName" readonly class="span11" placeholder="Mode" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Remaining Amount :</label>
									<div class="controls span4" style="margin-left: 20px;">
										<input type="text" id="remAmount" readonly class="span11" placeholder="Remaining Amount"/>
									</div>
									<label class="control-label" style="margin-left: -8%;">Installments
										No :</label>
									<div class="controls span4" style="margin-left: 20px;">
										<form:input type="text" path="installmentNo" id="installamentNo" class="span11" placeholder="Installments" readonly="true"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Outstanding Amount :</label>
									<div class="controls span4" style="margin-left: 20px;">
										<form:input type="text" path="remAmount" id="outAmount" class="span11" placeholder="Outstanding Amount" readonly="true"/>
									</div>
									
								</div>
								<div class="form-actions" style="padding-left: 500px;">
									<input type="submit" value="Save"
										class="btn btn-success center">
								</div>
							</form:form>
						</div>
					</div>


					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"><i class="icon-th"></i></span>
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
										<th>Next Installments Date </th>
										<th>Installment No</th>
										<th>Pay Amount</th>
										<th>Remaining Amount</th>
									</tr>
								</thead>

								<tbody id="paymentList">

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
		<div id="footer" class="span12">
			2018 &copy; Matrix Admin. Brought to you by <a
				href="http://themedesigner.in">Themedesigner.in</a>
		</div>
	</div>

	<!--end-Footer-part-->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.ui.custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.uniform.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/select2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/matrix.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/matrix.tables.js"></script>


	<script type="text/javascript">


function myFunction() {
	todayDate();
	getPaymentList();
	if(document.getElementById("snackbar")!=null)
	{
		var x = document.getElementById("snackbar");
	    x.className = "show";
	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);	
	}
	
}
function todayDate(){
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1;
	var yyyy = today.getFullYear();
	
	if(dd<10){
	    dd='0'+dd;
	} 
	if(mm<10){
	    mm='0'+mm;
	} 
	var today = yyyy+'-'+mm+'-'+dd;
	document.getElementById('todaysDate').value = today;
	
	var date = new Date(new Date().setDate(new Date().getDate() + 30));
	dd = date.getDate();
	mm = date.getMonth()+1;
	yyyy = date.getFullYear();
	
	if(dd<10){
	    dd='0'+dd;
	} 
	if(mm<10){
	    mm='0'+mm;
	} 
	var date = yyyy+'-'+mm+'-'+dd;
	document.getElementById('instDate').value = date;
	//alert(date)
}
//====================================Payment List=========================================
	function getPaymentList(){
		$.ajax({
			  type: "post",
			  url: "${pageContext.request.contextPath}/getPaymentList",
			  cache: false,    
			 // data:'clientId='+str,
			  success: function(response){
				var obj = JSON.parse(response);
				
				$('#paymentList').empty();
				for (var i = 0; i < obj.length; i++){
					var j=obj[i];
					$("#paymentList").append("<tr><td>"+(i+1)+"</td><td>"+j[0]+"</td><td>"+j[1]+"</td><td>"+j[2]+"</td><td>"+j[3]+"</td><td>"+j[4]+"</td><td>"+j[5]+"</td><td>"+j[6]+"</td></tr>");
				}
				
				
			  },
			  error: function(){      
			   alert('Error while request..');
			  }
		   });  
}
//====================================Plot List============================================
function getClintInfo(str){
	
	$.ajax({
		  type: "post",
		  url: "${pageContext.request.contextPath}/getClintInfo",
		  cache: false,    
		  data:'clientId='+str,
		  success: function(response){
			var obj = JSON.parse(response);
			
			$('#plotList').empty();
			$("#plotList").append("<option selected='selected' value='0'> Select Plot </option>");
			for (var i = 0; i < obj.length; i++){
				var j=obj[i];
				$("#plotList").append("<option value='"+j[0]+"'>"+j[1]+"</option>");
			}
			$('#plotList').select2();
			
			
		  },
		  error: function(){      
		   alert('Error while request..');
		  }
	   });  
}
//================================= other Info=================================
function getAmountInfo(str){
	
	$.ajax({
		  type: "post",
		  url: "${pageContext.request.contextPath}/getAmountInfo",
		  cache: false,    
		  data:'plotId='+str,
		  success: function(response){
			var obj = JSON.parse(response);
			
			var j=obj[0];
			if (obj[0]!=null) {
				document.getElementById("remAmount").value=j[0];
				document.getElementById("installamentNo").value=(j[1]+1);
				document.getElementById("modeName").value=j[2];
				document.getElementById("plotId").value=j[3];
			}else{
				document.getElementById("remAmount").value='';
				document.getElementById("installamentNo").value='';
				document.getElementById("modeName").value='';
				document.getElementById("plotId").value='';
			}
			
		  },
		  error: function(){      
		   alert('Error while request..');
		  }
	   });  
}	
//==============================Outstanding Amount=============================
function amountCal(str){
	var remAmt=document.getElementById("remAmount").value;
	var outAmt=remAmt-str;
	document.getElementById("outAmount").value=outAmt;
}
</script>
</body>
</html>
