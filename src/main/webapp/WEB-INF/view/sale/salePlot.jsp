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
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
  </div>
<!--End-breadcrumbs-->
	
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
	        	<div class="widget-box">
		          <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
		            <h5>Sale Plots</h5>
		          </div>
		          <div class="widget-content nopadding">
		            <form:form action="saveSalePlot" modelAttribute="salePlot" method="Post" class="form-horizontal"> 


		              <div>
			              <div class="control-group">
		    			     <div class="control-group span6">
					              <label class="control-label">Select Site</label>
					              <div class="controls">
					              
					                <form:select onchange="getSiteInfo(this.value)" id="sitesInfo" path="site_id">
					                  <form:option value="0" label="Select Site"></form:option>
					                  	<c:forEach items="${siteNames}" var="site">
					                  		<form:option value="${site.id}" label="${site.siteName}"></form:option>
					                  	</c:forEach>
					                </form:select>
				              	</div>
				             </div>
				             
 	 		    			     <div class="control-group span6" style="margin-left: -10px;">
					              <label class="control-label">Select Plot</label>
					              <div class="controls">
					              
					                <form:select id="plotInfo_1" path="plot_id" onchange="getPlotInfo(this.value)">
					                  

					                </form:select>
				              	</div>
				             </div> 				             
			              
			              </div>
		              </div>		              

	             <div class="span11" style="margin-left: 44px;">
		            <div class="widget-box">
		            	<div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
			            	<h5>Plot Information</h5>
			          	</div>
			          	<div class="widget-content nopadding">
			          		<div class="control-group span4">
					              <label class="control-label">Site Address :</label>
					              <div class="controls">
					                <input type="text" class="span12" id="address" placeholder="Address"  readonly/>
					              </div>
					         </div>

			          		<div class="control-group span4" style="margin-left: 0px;">
					              <label class="control-label">Site Zone :</label>
					              <div class="controls">
					                <input type="text" class="span12" id="zone" placeholder="Zone"  readonly/>
					              </div>
					         </div>

			          		<div class="control-group span4">
					              <label class="control-label">Price :</label>
					              <div class="controls">
					                <input type="text" class="span12" id="price" placeholder="Price" name="price" readonly/>
					              </div>
					         </div>
					         
					         <div class="control-group span4" style="margin-left: 0px;"> 
					              <label class="control-label">Squre Foot :</label>
					              <div class="controls">
					                <input type="text" class="span12" id="sqft" name="sqft" placeholder="Sq. Ft."  readonly/>
					              </div>
					         </div>

			          		<div class="control-group span4" style="margin-left: 0px;">
					              <label class="control-label">Length :</label>
					              <div class="controls">
					                <input type="text" class="span12" id="len" name="length" placeholder="Length"  readonly/>
					              </div>
					         </div>

			          		<div class="control-group span4">
					              <label class="control-label">Width :</label>
					              <div class="controls">
					                <input type="text" class="span12" id="width" name="width" placeholder="Width" readonly/>
					              </div>
					         </div>
				            
				            
			          	</div>
			        </div>	
		            
		         </div>

					  <br>
		              <div id="selectClientDiv">
			              <div class="control-group">
		    			     <div class="control-group span6">
					              <label class="control-label">Select Client</label>
					              <div class="controls">
					                <form:select path="client_id" id="client_id" onchange="getPlotInfo1()"><!-- for multiple select --><!--  multiple="true" -->
					                	<form:option value="0" label="Select Client"></form:option>
					                	<c:forEach items="${listOfClientsList}" var="clientList">
					                		
					                		<form:option value="${clientList.id }" label="${clientList.name }"></form:option>
					                	
					                	</c:forEach>
					                </form:select>
				              	</div>
				             </div>
				             
  	 		    			 <div class="control-group span6" style="margin-left: -10px;">
					              <label class="control-label">Date</label>
					              <div class="controls">
					                	<form:input type="date" path="date" id="todayDate" class="span11" required="required"/><!-- onchange="todayDate()" -->
				              	  </div>
				             </div>			             
			              </div>
		              </div>

		            <div class="span12" style="margin: 0;">
						<div class="widget-box">
				          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
				            <h5>Client & Plot Information</h5>
				          </div>
				          <div class="widget-content nopadding">
				            <table class="table table-bordered table-striped">
				              <thead>
				                <tr>
				                  <th>Client Name</th>
				                  <th>Plot</th>
				                  <th>Length</th>
				                  <th>Width</th>
				                  <th>Sq Ft</th>
				                  <th>Total Amount</th>
				                  <th>Mode</th>
				                  <th>Token Amount</th>
				                </tr>
				              </thead>
				              <tbody id="genPlot">
<!-- 				                <tr align="center">
				                  <td style="text-align: center;">Trident</td>
				                  <td style="text-align: center;">Internet</td>
				                  <td style="text-align: center;">Win 95+</td>
				                  <td style="text-align: center;"> 4</td>
				                  <td style="text-align: center;">X</td>
				                  <td style="text-align: center;">Win 95+</td>
				                  <td style="text-align: center;"> 4</td>
				                  <td style="text-align: center;">X</td>
				                </tr> -->
				              </tbody>
				            </table>
				          </div>
	        			</div>
			        </div>

		              
		              <div class="form-actions" style="padding-left: 500px;">
		                <input type="submit" value="Save" class="btn btn-success center" style="margin-bottom: 20px; margin-top: 25px;">
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
	
//	todayDate();
	
	if(document.getElementById("snackbar")!=null)
	{
		var x = document.getElementById("snackbar");
	    x.className = "show";
	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);	
	}
}

/*--------------------- AJAX for getting drop down -------------------- */

function getSiteInfo(id)
{
	
 	document.getElementById("address").value	="";
	document.getElementById("zone").value		="";
	document.getElementById("price").value		="";
	document.getElementById("sqft").value		="";
	document.getElementById("len").value		="";
	document.getElementById("width").value		="";
	
	$.ajax({
  
		type: "post",
		url: "${pageContext.request.contextPath}/plot.htm",
		cache: false,    
		data:'siteId=' +id,
		success: function(response){
			
			var obj = JSON.parse(response);
			setInOption(obj);
		},
		error: function(){      
		   alert('Error while request..');
		}
	});	 
}

function setInOption(obj) {

	//document.getElementById("plotInfo_1").innerHTML="<option value='Select Plot' selected='selected'> Select Plot </option>";
	//$('#plotInfo_1 :selected').remove(); 
	$('#plotInfo_1').empty();
	//$('#plotInfo_1').find('option:not(:first)').remove();
	//var optionData = "";
	
	$("#plotInfo_1").append("<option selected='selected' value='0'> Select Plot </option>");
	for (var i = 0; i < obj.length; i++){
		$("#plotInfo_1").append("<option value='"+obj[i].id+"'>"+obj[i].plot_name+"</option>");
		//optionData +="<option value='"+obj[i].id+"' >"+obj[i].plot_name+"</option>";
	}

	$('#plotInfo_1').select2();
	//document.getElementById('plotInfo_1').selectedIndex = 0;
	//$('#plotInfo_1 option:first').attr('selected',true);
	//$('#plotInfo_1').val($(this).find('option:first').val());
	//$('#plotInfo_1').prop('selectedIndex',0);
	//$.uniform.update('#plotInfo_1');

	/* document.getElementById("plotInfo_1").innerHTML="<option selected='selected'> Select Plot </option>"+optionData;
	$("#plotInfo_1").trigger('chosen:updated'); */
	
}

/*--------------------- AJAX for getting plot information -------------------- */

function getPlotInfo(val) {
		
	showDiv();
	
	$.ajax({

		type: "post",
		url: "${pageContext.request.contextPath}/plotInfo.htm",
		cache: false,    
		data:'plotId=' +val,
		success: function(response){
			
			var obj = JSON.parse(response);
			setInTextField(obj);
		},
		error: function(){      
		   alert('Error while request..');
		}
	});
}

function setInTextField(obj) {
			
 	document.getElementById("address").value	=obj[0].address;
	document.getElementById("zone").value		=obj[0].zone;
	document.getElementById("price").value		=obj[1].amt;
	document.getElementById("sqft").value		=obj[1].sqft;
	document.getElementById("width").value		=obj[1].width;
	document.getElementById("len").value		=obj[1].length;
	
}

 

function getPlotInfo1() {
	
//	alert(value+" "+label);
	//alert(document.getElementsByTagName("client_id")[0].getAttribute("value"));
	/* alert(document.getElementById("client_id").value);
	alert(document.getElementById("client_id").id);
	alert(document.getElementById("client_id").option); */
	
/* 	var el = document.getElementById('client_id');
	var text = el.options[el.selectedIndex].innerHTML;
	alert(text); */
	
/* 	$('#client_id').change(function(){
	    var selected = $(this).find('option:selected');
	    alert(selected.val() + ' ' + selected.text());
	}); */

	//alert($('#client_id').multiSelect());
/* 	alert($("#client_id option:selected").text());
	var multiselect = $('#client_id').val();
	alert(multiselect) */

    var selectedText = "";
    var selectedValue = "";
    $(function () {
    	plotName = $("#plotInfo_1").find("option:selected").text();
    	plotValue = $("#plotInfo_1").val();
    });
    
/*     var x = document.getElementById("client_id").selectedIndex;
    alert(document.getElementsByTagName("options")[x].label); */

    var len = document.getElementById("len").value;
    var width = document.getElementById("width").value;
    var sqft = document.getElementById("sqft").value;
    var price = document.getElementById("price").value;
    var selectOptions = "";
    var data=""; 
   
    
	$("#client_id option:selected").each(function () {
		   var $this = $(this);
		   //alert("$this.length = "+$this.length);
		   if ($this.length) {
			    var selText = $this.text();
				
				$.ajax({

					type: "post",
					url: "${pageContext.request.contextPath}/modeInfo.htm",
					cache: false,    
					data:'modeId=1',
					success: function(response){
						
						var obj = JSON.parse(response);
						
						for (var i = 0; i < obj.length; i++){
							selectOptions+="<option value='"+obj[i].id+"'>"+obj[i].modeName+"</option>";							
						}
						
					    data+="<tr align='center'>"+
			            "<td style='text-align: center;'><input id='' class='form-control span12' value='"+selText+"' readonly='readonly'/></td>"+
			            "<td style='text-align: center;'><input id='' class='form-control span12' value='"+plotName+"' readonly='readonly' name='plotName' /></td>"+
			            "<td style='text-align: center;'><input id='' class='form-control span12' value='"+len+"' readonly='readonly' /></td>"+
			            "<td style='text-align: center;'><input id='' class='form-control span12' value='"+width+"' readonly='readonly' /></td>"+
			            "<td style='text-align: center;'><input id='' class='form-control span12' value='"+sqft+"' readonly='readonly' /></td>"+
			            "<td style='text-align: center;'><input id='' class='form-control span12' value='"+price+"' readonly='readonly' /></td>"+
			            "<td style='text-align: center;'>"+
			            
					         "<select style='width: 150px;' name='mode_id'>"+
					         	selectOptions+
					         "</select>"+
			            
			            " </td>"+
			            "<td style='text-align: center;'><input id='' name='token_amt' value='0' class='form-control span12'  /></td>"+
			          "</tr>";
					    document.getElementById("genPlot").innerHTML=data;
					},
					error: function(){      
					   alert('Error while request..');
					}
				});
		    
		   }
		   
		});
	
}

$("#selectClientDiv").hide();

function showDiv() {
	$("#selectClientDiv").show();	
}

/* function todayDate(){

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
	alert("today : "+today);
	//document.getElementById('todayDate').value = today;
	
	
	
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
//	document.getElementById('nextDate1').value = date;
	alert(date)
} */
</script>

</body>
</html>