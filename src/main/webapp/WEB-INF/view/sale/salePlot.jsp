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

<body>

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
		            <form:form modelAttribute="salePlot" action="salePlot"  method="Post" class="form-horizontal"> 


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
					              
					                <select id="plotInfo_1" path="plot_id" onchange="getPlotInfo(this.value)">
					                  

					                </select>
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
					                <input type="text" class="span12" id="price" placeholder="Price" readonly/>
					              </div>
					         </div>
					         
					         <div class="control-group span4" style="margin-left: 0px;"> 
					              <label class="control-label">Squre Foot :</label>
					              <div class="controls">
					                <input type="text" class="span12" id="sqft" placeholder="Sq. Ft."  readonly/>
					              </div>
					         </div>

			          		<div class="control-group span4" style="margin-left: 0px;">
					              <label class="control-label">Length :</label>
					              <div class="controls">
					                <input type="text" class="span12" id="len" placeholder="Length"  readonly/>
					              </div>
					         </div>

			          		<div class="control-group span4">
					              <label class="control-label">Width :</label>
					              <div class="controls">
					                <input type="text" class="span12" id="width" placeholder="Width" readonly/>
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
					                <form:select path="client_id" id="client_id" multiple="true" onchange="getPlotInfo1()">
					                	<c:forEach items="${listOfClientsList}" var="clientList">
					                		
					                		<form:option value="${clientList.id }" label="${clientList.name }"></form:option>
					                	
					                	</c:forEach>
					                </form:select>
				              	</div>
				             </div>
				             
  	 		    			 <div class="control-group span6" style="margin-left: -10px;">
					              <label class="control-label">Date</label>
					              <div class="controls">
					                	<form:input type="date" path="date" class="span11" required="required"/>
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
    
    var data="";
    
	$("#client_id option:selected").each(function () {
		   var $this = $(this);
		   if ($this.length) {
		    var selText = $this.text();
		    
		    
    data+="<tr align='center'>"+
            "<td style='text-align: center;'><input id='' class='form-control span12' value='"+selText+"' readonly='readonly'/></td>"+
            "<td style='text-align: center;'><input id='' class='form-control span12' value='"+plotName+"' readonly='readonly'/></td>"+
            "<td style='text-align: center;'><input id='' class='form-control span12' value='"+len+"' /></td>"+
            "<td style='text-align: center;'><input id='' class='form-control span12' value='"+width+"' /></td>"+
            "<td style='text-align: center;'><input id='' class='form-control span12' value='"+sqft+"' /></td>"+
            "<td style='text-align: center;'><input id='' class='form-control span12' value='"+price+"' /></td>"+
            "<td style='text-align: center;'>"+
            
		         "<select style='width: 150px;'>"+
		         	"<option> 1 </option>"+
		         	"<option> 2 </option>"+
		         	"<option> 3 </option>"+
		         	"<option> 4 </option>"+
		         "</select>"+
            
            " </td>"+
            "<td style='text-align: center;'><input id='' class='form-control span12'  /></td>"+
          "</tr>";
		    
		   }
		});
	document.getElementById("genPlot").innerHTML=data;
}

$("#selectClientDiv").hide();

function showDiv() {
	$("#selectClientDiv").show();	
}
</script>

</body>
</html>