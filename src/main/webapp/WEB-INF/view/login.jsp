<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
      	<title>Real Estate</title><meta charset="UTF-8" />
      	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matrix-login.css" />
		<link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
		
		<style>
		.add-on{
		 	height: 20px;	
		}
			   
		</style>
		
    </head>
    <body>
        <div id="loginbox">            
            <form id="loginform" class="form-vertical" method="post" action="submitLogin">  
            
				<div class="control-group normal_text"> 
					<h3>
						<img src="${pageContext.request.contextPath}/resources/img/logo.jpg" alt="Logo" style="width: 20%;" />
					</h3>
				</div>
                
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg" style=""><i class="icon-user"> </i></span>
                            <input type="text" name="username" placeholder="Username" />
                        </div>
                    </div>
                </div>
                
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-lock"></i></span>
                            <input type="password" name="password" placeholder="Password" />
                        </div>
                    </div>
                </div>
                
                <div class="form-actions" style="padding-right: 40%;">
                    <span class="pull-right"><input type="submit" value="Login" class="btn btn-success" /></span>
                </div>
            </form>
            
        </div>
        
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>  
        <script src="${pageContext.request.contextPath}/resources/js/matrix.login.js"></script> 
    </body>

</html>