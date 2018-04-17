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
	          <form:form id="plotForm"  action="savePlotes" modelAttribute="plotes"  method="POST" class="form-horizontal">
    			     <div class="control-group span6">
			              <label class="control-label">Select input</label>
			              <div class="controls">
			              
			                <form:select onchange="getSiteInfo(this.id)"  id="sitesInfo" path="site_id">
			                  <form:option value="0" label="Select Site"></form:option>
			                  	<c:forEach var="site" items="${siteNames}">
			                  		<form:option value="${site.id}" label="${site.siteName}"></form:option>
			                  	</c:forEach>
			                </form:select>
		              </div>
		             </div>
		            <div class="control-group span6">
		              <label class="control-label">No of Plots :</label>
		              <div class="controls">
		                <input id="totalPlotes" type="number" class="form-control"  required="required" onblur="generatePlots(this.value)"/>
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
	              <button type="button" class="btn btn-success"  onclick="submitForm()">Save</button>
	            </div>
				</form:form>
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
                  <th>SiteName</th>
                  <th>Plot Name</th>
                  <th>Length</th>
                  <th>Width</th>
                  <th>Square Foot(Sq.Ft)</th>
				  <th>Total Amount</th>
				  <th style="width: 103px;">Action</th>                  
                </tr>
              </thead>
              <tbody id="plotInfo">
              	
              
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


<!-- Update Modal Start -->
<div id="updatePlot" class="modal hide fade" role="dialog" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Update Organization Details</h4>
			</div>
			<div class="modal-body">
				<form:form action="updatePlot" modelAttribute="plotes"  method="POST" class="form-horizontal">
					<div class="control-group">
						<div class="span4" >
						<label class="control-label">Site Name :</label>
						<div class="controls">
							<form:hidden path="id" id="pid"/>
							<form:hidden path="site_id" id="sid"/>
							 <input id="usiteName" type="text" class="form-control"  readonly required="required"/>
						</div>
						</div>
					</div>
						
					<div class="control-group">
						<div class="span4">
						<label class="control-label">Plot Name :</label>
						<div class="controls">
							 <form:input id="uplotName" class="form-control"  path="plot_name" required="required"/>
						</div>
						</div>
					</div>

					<div class="control-group">
						<div class="span4" >
						<label class="control-label">Length :</label>
						<div class="controls">
							 <form:input id="ulen" class="form-control"  path="length" required="required"/>
						</div>
						</div>
					</div>
					
					<div class="control-group">
						<div class="span4">
						<label class="control-label">Width :</label>
						<div class="controls">
							<form:input id="uwid" class="form-control"  path="width" required="required"/>
						</div>
						</div>
					</div>

					<div class="control-group">
						<div class="span4" >
						<label class="control-label">Square Foot :</label>
						<div class="controls">
							<form:input id="usqft" type="number" class="form-control"  path="sqft" required="required"/>
						</div>
						</div>
					</div>
					

					<div class="control-group">
						<div class="span4">
						<label class="control-label">Total Amount :</label>
						<div class="controls">
							<form:input id="uamt" class="form-control"  path="amt" required="required"/>
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

var totalSqft = 0;
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
				+"<td><input id='' class='form-control span12' value='Plot_"+i+"'  name='plot_name' readonly='readonly'/></td>"
				+"<td><input id='len"+i+"' type='number' class='form-control span12'  name='length'  placeholder='Plot_"+i+" Length' /></td>"
				+"<td><input id='wid"+i+"' type='number' class='form-control span12'  name='width'  placeholder='Plot_"+i+" Width'/></td>"
				+"<td><input id='sqft"+i+"' type='number' class='form-control span12'  name='sqft' required='required' placeholder='Plot_"+i+" Sq. Ft.' /></td>"
				+"<td><input id='tamt"+i+"' type='number' class='form-control span12'  name='amt' required='required' placeholder='Plot_"+i+" Amount' /></td>"
				+"</tr>" ;
				
		}
		document.getElementById("genPlot").innerHTML=tableData;
	
 }
 
 /*--------------------- for generating plots ends--------------- */

 /*--------------------- AJAX for getting site information starts-------------------- */
 
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
		 //getting site info
		 $.ajax({
			  type: "post",
			  url: "http://localhost:8080/real-estate/siteinfo.htm",
			  cache: false,    
			  data:'siteid=' +siteVal,
			  success: function(response){
			  var obj = JSON.parse(response);
			  setInTextbox(obj);
			  },
			  error: function(){      
			   alert('Error while request..');
			  }
			 });	 
		 
		 //getting plot info for dataTable
		 $.ajax({
			  type: "post",
			  url: "http://localhost:8080/real-estate/plotDetails.htm",
			  cache: false,    
			  data:'siteid=' +siteVal,
			  success: function(response){
			  var obj = JSON.parse(response);
			  setInTable(obj);
			  },
			  error: function(){      
			   alert('Error while request..');
			  }
			 });	
	}
 }
 
 function setInTextbox(obj)
 {
	 document.getElementById("address").value=obj[0].address;
	document.getElementById("zone").value=obj[0].zone;
	document.getElementById("price").value=obj[0].price;
	document.getElementById("sqft").value=obj[0].sqft;
	document.getElementById("len").value=obj[0].length;
	document.getElementById("width").value=obj[0].width;
	
	totalSqft = obj[0].sqft 
 }
 
 function setInTable(obj)
 {
	 var tableData="";
	  for(var i=0;i<obj.length;)
	{
		
		tableData+="<tr>"
		+"<td>"+obj[i++]+"</td>"
		+"<td>"+obj[i++]+"</td>"
		+"<td>"+obj[i++]+"</td>"
		+"<td>"+obj[i++]+"</td>"
		+"<td>"+obj[i++]+"</td>"
		+"<td>"+obj[i++]+"</td>"
		+"<td>"+obj[i++]+"</td>"
		+"<td><a href='#updatePlot'  onclick='updatePlot(this.parentNode.parentNode.rowIndex)' data-toggle='modal'>Update</a> || Delete</td>"
		+"</tr>";
	} 
	 document.getElementById("plotInfo").innerHTML=tableData;
	 
 }

	
 function updatePlot(id)
 {
	 alert(id);
 }
 
 /*---------------------- AJAX for getting site information Ends ---------------------*/
 
 function submitForm()
 {
	 var enteredSqft = 0;
	 
	 var noOfPlotes = parseInt(document.getElementById("totalPlotes").value);
	 
	 if(totalSqft!=0 && noOfPlotes && noOfPlotes!=0)
	{
		 for(var i=1;i<=noOfPlotes;i++)
		{
			 if(document.getElementById("sqft"+i+"").value)
			{
				 enteredSqft += parseInt(document.getElementById("sqft"+i+"").value);	 
			}
				 
		}
		if(parseInt(totalSqft)<enteredSqft)
		{
			alert('Addition of you entered sqft in Plot Information is greater than all site Sq.Ft.');
			document.getElementById("sqft"+noOfPlotes+"").focus();
		}
		else if(parseInt(totalSqft)>enteredSqft)
		{
			var remainSqft = parseInt(totalSqft) - enteredSqft;
			var addPlotRow = confirm(remainSqft+" Sq.Ft still free on this site Do you want to add new Plot");
		    if (addPlotRow) {
		        //txt = "You pressed OK!";
		    	var noOfRows = $('#genPlot tr').length;
		    	
		    	var table = document.getElementById("genPlot");
		    	
		    	var row = table.insertRow(noOfRows);
		    	
		    	var cell1 = row.insertCell(0);
		    	
		    	var cell2 = row.insertCell(1);
		    	
		    	var cell3 = row.insertCell(2);
		    	
		    	var cell4 = row.insertCell(3);
		    	
		    	var cell5 = row.insertCell(4);
		    	
		    	var nextPlot = parseInt(noOfRows)+1;
		    	
		    	cell1.innerHTML = "<input id='' class='form-control span12' value='Plot_"+nextPlot+"'  name='plot_name' readonly='readonly'/>";
		    	
		    	cell2.innerHTML = "<input id='len"+nextPlot+"' type='number' class='form-control span12'  name='length' placeholder='Plot_"+nextPlot+" Length' />";
		    	
		    	cell3.innerHTML = "<input id='wid"+nextPlot+"' type='number' class='form-control span12'  name='width' placeholder='Plot_"+nextPlot+" Width'/>";
		    	
		    	cell4.innerHTML = "<input id='sqft"+nextPlot+"' type='number' class='form-control span12'  name='sqft' required='required' placeholder='Plot_"+nextPlot+" Sq. Ft.' />";
		    	
		    	cell5.innerHTML = "<input id='tamt"+nextPlot+"' type='number' class='form-control span12'  name='amt' required='required' placeholder='Plot_"+nextPlot+" Amount' />";
		    	
		    	document.getElementById("sqft"+nextPlot+"").focus();
		    	
		    	document.getElementById("totalPlotes").value = parseInt(noOfPlotes)+1;
		    	
		    } 
		    else
		    {
		    	var noOfRows = $('#genPlot tr').length;
		    	document.getElementById("sqft"+noOfRows+"").focus();
		    }
		        
		}
		else
		{
			//entered sqft and available sqft is equal
			var noOfRows = $('#genPlot tr').length;
			
			var sqftArr = [];
			for(var i=1;i<=noOfRows;i++)
			{
				//setting default value to len and width
				var len = document.getElementById("len"+i+"").value;
				var wid = document.getElementById("wid"+i+"").value;
				
				if(len==="")
				{
					document.getElementById("len"+i+"").value=0;
				}
				if(wid==="")
				{
					document.getElementById("wid"+i+"").value=0;
				}
				
				sqftArr.push(document.getElementById("sqft"+i).value);
				
			}
			
			var noOfPlotes = parseInt(document.getElementById("totalPlotes").value);
			if(noOfPlotes>1)
			{
				var totalArr=0;
				//addition of array element
				for(var i=0 ;i<sqftArr.length;i++) {
			 			if(sqftArr[i])
						{
			 				totalArr += parseInt(sqftArr[i]);		
						}
				}
				//checking empty element in array
				var empties = sqftArr.length - sqftArr.filter(String).length;
				
				var tempSqft = 0;
				for(var i=0;i<sqftArr.length;i++)
				{
					if(sqftArr[i]==totalSqft)
					{
						var remove = confirm('All Sq.Ft. filled with plotes.Do you want to remove remaining plotes?');
						if(remove)
						{
							//removing all rows below the one
							var noOfRows = $('#genPlot tr').length;
							for(var i=noOfRows-1;i>=1;i--)
							{
								document.getElementById("genPlot").deleteRow(i);	
								document.getElementById("totalPlotes").value = 1;
							}
							//checking amount field empty or not
							var tAmt = document.getElementById("tamt1").value;
							if(!tAmt)
							{
								document.getElementById("tamt1").focus();
							}
							else
							{
								//submit the form
								document.getElementById("plotForm").submit();
								//alert('first success');
							}
							break;
						}
						else
						{
							//focus on next empty text	
						}
						
						
					}
					else if(parseInt(totalArr)==parseInt(totalSqft))
					{
						//check empty elements	
						if(empties>0)
						{
							var deleteEmptyPlotes = confirm("You dont have Sq.Ft space for "+empties+" Plotes. Do you want to delete it? It will delete last rows.");

							if(deleteEmptyPlotes)
							{
								var noOfRows = $('#genPlot tr').length;
								
								for(var i=noOfRows-1;i>=noOfRows-empties;i--)
								{
									document.getElementById("genPlot").deleteRow(i);
									document.getElementById("totalPlotes").value = i;
								} 
								
								for(var i =1;i<=noOfRows;i++)
								{
									//checking amount input empty or not
									var tAmt = document.getElementById("tamt"+i).value;
									if(!tAmt)
									{
										document.getElementById("tamt"+i).focus();
										//break;
									}
									
									if(i==noOfRows)
									{
										//submit the form	
										document.getElementById("plotForm").submit();
										//alert('second success');		
									}
									
								}
								
							}
							else
							{
								//focus on next empty plote	
							}
							break;
							//removing last no. of(empties) rows from table
						}
						else
						{
							var noOfRows = $('#genPlot tr').length;
							for(var i =1;i<=noOfRows;i++)
							{
								//checking amount input empty or not
									var tAmt = document.getElementById("tamt"+i).value;
									if(!tAmt)
									{
										document.getElementById("tamt"+i).focus();
										break;
									}
									
									if(i==noOfRows)
									{
										//submit the form	
										document.getElementById("plotForm").submit();
										//alert('third success');		
									}
							}
							break;

						}
						
					}
					
				}
				
			}
			else
			{
				//checking amount field empty or not
				var tAmt = document.getElementById("tamt1").value;
				if(!tAmt)
				{
					document.getElementById("tamt1").focus();
				}
				else
				{
					//alert('final success');
					//submit the form
					document.getElementById("plotForm").submit();		
				}
				
			}
			
		}
		 
	}
	 else
	{
		 document.getElementById("totalPlotes").focus();
		
	}
		 
 }
 
function deletePlot()
{
	
}

</script>
</body>
</html>
