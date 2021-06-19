<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="ko">
<head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- jquery 3.4.1 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- font-awesome Version 5 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

	<!-- font-awesome Version 4 -->
	<link rel="stylesheet" href="css/subcss/style.css">
	<link rel="stylesheet" href="css/sign.css">


	<!-- bootstrap -->
	<link href="css/bootstrap.min.css" rel="stylesheet">

	<!-- js -->
	<script src="js/common.js" defer></script>
	<script src="js/subjs/index.js" defer></script>
	
	<script>
    function getUserList(e){
      var name = $(e).attr("id");
   
      $.ajax({
            type:"post",
            url:"/organmap",
            data:{name:name},
            success:function(data){
               
               var html=""
               
               for(var i=0; i<data.length; i++){
                   html+="<div>"+data[i].name+"</div>";
                   $("#div"+name).empty;
               }
               
               $("#div"+name).empty();
                $("#div"+name).append(html);
                html=""
                
            },
            error:function(xhr, status, error){
               alert(status);
            }
         });
    }
   </script>   
	

</head>
<body>
	<c:if test="${not empty msg}">
		<script>

			alert('<c:out value="${msg}"/>');
		</script>
	</c:if>
	<% session.removeAttribute("msg");%>
	<header id="header">
		<nav class="navbar navbar-static-top nav_line" style="margin-bottom:0px;">
		  <div class="container">
			<div class="navbar-header">
			  <a class="navbar-brand" href="core"><div class="logo"><img src="../../images/logo.png"></div></a>
			</div>
			<div id="navbar nav_line" class="collapse navbar-collapse">
			  <ul class="nav navbar-nav ">
				<li><a href="notice"><b>공지사항</b></a></li>
			  </ul>
			  <ul class="nav navbar-nav pull-right menu_right">
				<li>
					<div class="member">
						<img src="files/image/${userImage}" style="max-width:100%; cursor: pointer;">
					</div>
				</li>
				<li><p class="member_text"><b>${userName}&nbsp;${userGrade}</b></p><p class="member_text">${userDepartment }</p></li>
			  </ul>
			  <ul class="nav navbar-nav pull-right">
				<li><a href="#contact"><i class="fas fa-sitemap" id="orgtopen" data-toggle="modal" data-target="#myModal"></i></a></li>
			  </ul>
			 
		  </div>
		  
		</nav>
		
		<dialog>
			<div class="dialog__inner">
				<button class="button button-close close"><i class="fas fa-times-circle"></i></button>
				<div class="dialog__content">
					<h3 style="color: #333; padding-left:10px;">조직도</h3>
				</div>
				<section id="wrapper">
					<div class="container2">
						<ul class="accordion">
							<li class="item">
								 <c:forEach var="dep" items="${d_list}">
			                        <h2 class="accordionTitle" onclick="getUserList(this);" id="${dep.department_name}">${dep.department_name}<span class="accIcon"></span></h2>
			                        <div class="text" id="div${dep.department_name}">
			                           
			                        </div>
			                     </c:forEach>
							</li>
							
						</ul>
					</div>
				</section>
			</div>
		</dialog>
	</header>
	
	<section id="main">
		<div id="lefter">
			<div class="container">
				<div class="row ">
					<div class="col-md-2 menu_left2">
						<div class="menu_left">
							<div class="menu-title">
								<h2>전자결재</h2>
							</div>
							<input type="button" class="insert_btn" value="기안작성">
							<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									
									<i class="fas fa-user"></i> 개인함
									</a>
								</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse in" aria-labelledby="headingOne">
								<div class="panel-body">
									<ul>
										<li><a href="workspace_yetList">미결함</a></li>
										<li><a href="workspace_processingList">진행함</a></li>
										<li><a href="workspace_rejectList">반려함</a></li>
										<li><a href="workspace_doneList">완료함</a></li>
										
									</ul>
								</div>
								</div>
							</div>
							<div class="hr-box">
								<hr class="hr-line">
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingTwo">
								<h4 class="panel-title">
									<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									
									<i class="fas fa-paste"></i> 부서함
									</a>
								</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse in" aria-labelledby="headingTwo">
								<div class="panel-body">
									<ul>
										<li><a href="#">완료함</a></li>
										<li><a href="#">발신함</a></li>
										<li><a href="#">수신함</a></li>
										<li><a href="#">참조/회람함</a></li>
										<li><a href="#">진행함</a></li>
									</ul>
								
								</div>
								</div>
							</div>
							<div class="hr-box">
								<hr class="hr-line">
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingThree">
								<h4 class="panel-title">
									<a href="setting">
									<i class="fas fa-cog"></i> 설정
									</a>
								</h4>
								</div>
							</div>
							
							<c:if test="${userDepartment != '인사부'}">
		                        <div class="panel panel-default">
		                           <div class="panel-heading" role="tab" id="headingThree">
		                           <h4 class="panel-title">
		                              <a href="/core">
		                              <i class="fas fa-file-alt"></i> 업무문서함
		                              </a>
		                           </h4>
		                           </div>
		                        </div>
		                     </c:if>
		                     <c:if test="${userDepartment == '인사부'}">
		                        <div class="panel panel-default">
		                           <div class="panel-heading" role="tab" id="headingThree">
		                           <h4 class="panel-title">
		                              <a href="admin_hr">
		                              <i class="fas fa-user-cog"></i> 인사관리
		                              </a>
		                           </h4>
		                           </div>
		                        </div>
		                     </c:if>
		                     
		                     <div class="panel panel-default">
		                        <div class="panel-heading" role="tab" id="headingThree">
		                        <h4 class="panel-title">
		                           <a href="userlogout" class="logout-btn">
		                           <i class="fas fa-door-closed"></i><i class="fas fa-door-open"></i> 로그아웃
		                           </a>
		                        </h4>
		                        </div>
		                     </div>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		