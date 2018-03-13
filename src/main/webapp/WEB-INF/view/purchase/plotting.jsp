<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Plotting & Rates</title>
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
<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
<!--close-Header-part-->


<!--sidebar-menu-->
<jsp:include page="/WEB-INF/view/leftnavbar.jsp"></jsp:include>
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
    <a href="#">Purchase</a>
    <a class="current" href="#" >Plotting Rates</a>
    </div>
  </div>
<!--End-breadcrumbs-->

<div class="container-fluid">
	
	
	  
	<div class="row-fluid">
		<div class="span12">
			<div class="widget-box">
	        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
	          <h5>Plotes & Rates</h5>
	        </div>
	        <div class="widget-content nopadding">
	          <form action="saveOrganization" modelAttribute="orgnization"  method="POST" class="form-horizontal">
    			     <div class="control-group span6">
			              <label class="control-label">Select input</label>
			              <div class="controls">
			              
			                <select onchange="getSiteInfo(this.id)"  id="sitesInfo">
			                  <option value="0">Select Site</option>
			                  	<c:forEach var="site" items="${siteNames}">
			                  		<option value="${site.id}">${site.siteName}</option>
			                  	</c:forEach>
			                </select>
		              </div>
		             </div>
		            <div class="control-group span6">
		              <label class="control-label">No of Plots :</label>
		              <div class="controls">
		                <input id="" class="form-control"  path="plotes" required="required" onblur="generatePlots(this.value)"/>
		              </div>
		            </div>
		            
	            
	             <div class="span12" style="margin: 0;">
		            <div class="widget-box">
		            	<div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
			            	<h5>Site Information</h5>
			          	</div>
			          	<div class="widget-content nopadding">
			          		<div class="control-group span4">
					              <label class="control-label">Site Address :</label>
					              <div class="controls">
					                <input type="text" class="span12" placeholder="Address"  readonly/>
					              </div>
					         </div>

			          		<div class="control-group span4" style="margin-left: 0px;">
					              <label class="control-label">Site Zone :</label>
					              <div class="controls">
					                <input type="text" class="span12" placeholder="Zone"  readonly/>
					              </div>
					         </div>

			          		<div class="control-group span4">
					              <label class="control-label">Price :</label>
					              <div class="controls">
					                <input type="text" class="span12" placeholder="Price" readonly/>
					              </div>
					         </div>
					         
					         <div class="control-group span4" style="margin-left: 0px;"> 
					              <label class="control-label">Squre Foot :</label>
					              <div class="controls">
					                <input type="text" class="span12" placeholder="Sq. Ft."  readonly/>
					              </div>
					         </div>

			          		<div class="control-group span4" style="margin-left: 0px;">
					              <label class="control-label">Length :</label>
					              <div class="controls">
					                <input type="text" class="span12" placeholder="Length"  readonly/>
					              </div>
					         </div>

			          		<div class="control-group span4">
					              <label class="control-label">Width :</label>
					              <div class="controls">
					                <input type="text" class="span12" placeholder="Width" readonly/>
					              </div>
					         </div>
				            
				            
			          	</div>
			        </div>	
		            
		         </div>

	            <div class="span12" style="margin: 0;">
					<div class="widget-box">
			          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
			            <h5>Plotes Information</h5>
			          </div>
			          <div class="widget-content nopadding">
			            <table class="table table-bordered table-striped">
			              <thead>
			                <tr>
			                  <th>Plot Name</th>
			                  <th>Length</th>
			                  <th>Width</th>
			                  <th>Square Foot(Sq.Ft.)</th>
			                  <th>Total Amount</th>
			                </tr>
			              </thead>
			              <tbody id="genPlot">
			                <tr align="center">
			                  <td style="text-align: center;">Trident</td>
			                  <td style="text-align: center;">Internet Explorer 4.0</td>
			                  <td style="text-align: center;">Win 95+</td>
			                  <td style="text-align: center;"> 4</td>
			                  <td style="text-align: center;">X</td>
			                </tr>
			              </tbody>
			            </table>
			          </div>
        			</div>
		        </div>
	            
	            <div class="form-actions text-center"">
	              <button type="submit" class="btn btn-success">Save</button>
	            </div>
	            </form>
	        </div>
	      </div>
		
		
		
		
	      <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Plotes Details</h5>
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
              	
              
              </tbody>
            </table>
          </div>
        </div>	
    </div>
	</div>
</div>
</div>

<!-- Delete Modal Start -->
<div class="modal hide fade" id="deleteOrg" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Delete Plotes</h4>
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

/*--------------------- for generating plots starts--------------- */
 
 function generatePlots(val)
 {
		var tableData="";
		for(var i=1;i<=val;i++)
		{
				tableData+="<tr>"
				+"<td><input id='' class='form-control span12' value='Plot_"+i+"'  path='plotname' required='required' readonly/></td>"
				+"<td><input id='' class='form-control span12'  path='length' required='required' placeholder='Plot_"+i+" Length' /></td>"
				+"<td><input id='' class='form-control span12'  path='width' required='required' placeholder='Plot_"+i+" Width'/></td>"
				+"<td><input id='' class='form-control span12'  path='sqft' required='required' placeholder='Plot_"+i+" Sq. Ft.' /></td>"
				+"<td><input id='' class='form-control span12'  path='tamt' required='required' placeholder='Plot_"+i+" Amount' /></td>"
				+"</tr>" ;
				
		}
		document.getElementById("genPlot").innerHTML=tableData;
	
 }
 
 /*--------------------- for generating plots ends--------------- */

 function getSiteInfo(id)
 {
	 var e = document.getElementById(id);
	 var siteVal = e.options[e.selectedIndex].value;
	 
	 if(siteVal==0)
	 {
		 alert("Add atleast 1 site information");		 
	 }
	 else
	{
		 $.ajax({
			  type: "post",
			  url: "http://localhost:8080/real-estate/siteinfo.htm",
			  cache: false,    
			  data:'siteid=' +siteVal,
			  success: function(response){
			  var obj = response;
			  //setInTable(obj);
			  alert(obj);
			  },
			  error: function(){      
			   alert('Error while request..');
			  }
			 });	 
	}
 }
 
function deletePlot()
{
	
}

</script>
</body>
</html>
