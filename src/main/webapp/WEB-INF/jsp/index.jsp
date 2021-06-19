<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="css/index.css" type="text/css"/>
	
	<title>인재싸인</title>
</head>
<body>
<header>
	<div class="Header Header-trans">
		<div class="Header-container">
			<a href="/core"><img src="images/logo2.png" class="Header-logo"></a>
			<ul class="main-menu-group">
				<li class="main-menu-box">
					<span class="main-menu">
						<a href="">서비스소개</a>
					</span>
				</li>
				<li class="main-menu-box">
					<span class="main-menu">
						<a href="">고객사례</a>
					</span>
				</li>
				<li class="main-menu-box">
					<span class="main-menu">
						<a href="">법적효력</a>
					</span>
				</li>
				<li class="btn-box">
				<c:choose>
					<c:when test="${user eq null}">
					<a href="#" class="login-btn" data-toggle="modal" data-target="#myModal" onclick="document.getElementById('id').focus();"><b>로그인</b></a>
					</c:when>
					<c:otherwise>
					<a href="userlogout" class="login-btn"><b>로그아웃</b></a>
					</c:otherwise>
				</c:choose>
					<a href="apply_service" class="start-btn"><b>서비스신청</b></a>
				</li>
			</ul>
		</div>
	</div>
	
	<div class="MainTitle MainTitle-home">
		<div class="LandingContainer">
			<h1>
				계약도 얼마든지<br>
				간편해질 수 있습니다
			</h1>
		</div>
	</div>
	<div class="gray-back">
		<div class="LandingContainer">
			<div class="Grid">
				<div class="col-md-7">
					<video autoplay class="video" loop muted playsinline>
						<source src="images/video.mp4" type="video/mp4">
					</video>
				</div>
				<div class="col-md-5" style="margin-top: 70px;">
					<h2>
						<b>5분 만에</b>
						<br>
						끝내는 계약업무
					</h2>
					<img src="images/mainflow.png">
					<p>비즈니스를 위한 빠른 의사결정 및 유연한 업무 프로세스를 마련하세요.<br>누구나 쉽고, 간편하게 사용하는 ONE-STEP 전자결제 솔루션입니다.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
	<div class="productInner">
		<div class="subTitBox">
			<strong class="subTit">제품 기능</strong>
			<p>검증받은 INJAESIGN 전자결재 솔루션의 주요 기능입니다.</p>
		</div>
		<div role="tabpanel">

		  <!-- Nav tabs -->
		  <ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab"><span class="p_icon p_icon3_3"></span>결재 문서 및 현황 확인</a></li>
			<li role="presentation"><a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab"><span class="p_icon p_icon3_3"></span>편리한 결재라인 등록</a></li>
			<li role="presentation"><a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab"><span class="p_icon p_icon3_3"></span>업무 히스토리 생성</a></li>
			<li role="presentation"><a href="#tab4" aria-controls="tab4" role="tab" data-toggle="tab"><span class="p_icon p_icon3_3"></span>첨부 파일 미리보기</a></li>
			<li role="presentation"><a href="#tab5" aria-controls="tab5" role="tab" data-toggle="tab"><span class="p_icon p_icon3_3"></span>기감계 시스템 연동</a></li>
		  </ul>

		  <!-- Tab panes -->
		  <div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="tab1">
				<div class="func_tb">
					<div class="func_cell">
						<div class="func_cnt">
							<span class="func_icon"><img src="images/product_icon3_3.png"></span>
							<strong class="func_txt1">전용 대쉬보드와<br>다양한 문서함</strong>
							<p class="func_txt2">
							-결재현황 확인을 위한 전용 대쉬보드 제공<br>
							-단계와 용도에 따라 개인/부서함 사용 가능<br>
							-부서, 기안자, 일시 등 분류별 문서 확인 가능
							</p>
						</div>
						<div class="func_img">
							<img src="images/product_img3_3.jpg">
						</div>
					</div>
				</div>
			</div>
			<div role="tabpanel" class="tab-pane" id="tab2">
				<div class="func_tb">
					<div class="func_cell">
						<div class="func_cnt">
							<span class="func_icon"><img src="images/product_icon3_2.png"></span>
							<strong class="func_txt1">조직도 기준<br>결재라인 생성</strong>
							<p class="func_txt2">
							-조직도 기준의 개인별 수신/참조/회람자 그룹 등록<br>
							-일반결재, 전결, 후결, 후열 등 다양한 결재 방식<br>
							-반복되는 문서는 자동 지정으로 결재라인 생성
							</p>
						</div>
						<div class="func_img">
							<img src="images/product_img3_2.jpg">
						</div>
					</div>
				</div>
			</div>
			<div role="tabpanel" class="tab-pane" id="tab3">
				<div class="func_tb">
					<div class="func_cell">
						<div class="func_cnt">
							<span class="func_icon"><img src="images/product_icon3_1.png"></span>
							<strong class="func_txt1">의사결정에 필요한<br>다양한 편의 기능</strong>
							<p class="func_txt2">
							-문서 연결, 파일 첨부 등 업무 히스토리 생성<br>
							-결재문서 작성 시 문서 분류 코드로 업무 관리<br>
							-Non Active 방식의 웹 에디터 제공 
							</p>
						</div>
						<div class="func_img">
							<img src="images/product_img3_1.jpg">
						</div>
					</div>
				</div>
			</div>
			<div role="tabpanel" class="tab-pane" id="tab4">
				<div class="func_tb">
					<div class="func_cell">
						<div class="func_cnt">
							<span class="func_icon"><img src="images/product_icon3_4.png"></span>
							<strong class="func_txt1">다운로드 없이<br>첨부파일 확인</strong>
							<p class="func_txt2">
							-워드, 엑셀, PDF, 이미지, 한글 등 첨부 미리보기<br>
							-HD 와이드 대화면에 맞춰 좌우분할 보기 제공
							</p>
						</div>
						<div class="func_img">
							<img src="images/product_img3_4.jpg">
						</div>
					</div>
				</div>
			</div>
			<div role="tabpanel" class="tab-pane" id="tab5">
				<div class="func_tb">
					<div class="func_cell">
						<div class="func_cnt">
							<span class="func_icon"><img src="images/product_icon3_5.png"></span>
							<strong class="func_txt1">기안단계부터<br>ERP와 연동</strong>
							<p class="func_txt2">
							-기간계와 I/F를 통하여 관련 데이터를 조회/입력<br>
							-결재 완료 후 처리 결과값을 다시 기간계로 전달<br>
							-모든 연동작업에 대한 A to Z 자동화 처리
							</p>
						</div>
						<div class="func_img">
							<img src="images/product_img3_5.jpg">
						</div>
					</div>
				</div>
			</div>
		  </div>

		</div>
	</div>
	</div>
	
	<div class="container">
	<div class="SafeSec onview">
		<div class="LandingContainer">
			<div class="col-md-6">
				<img src="images/img-security.svg" class="SafeSec_img">
			</div>
			<div class="SafeSec_margin">
				<div class="Grid">
					<div class="col-md-6">
						<h3 class="SafeSec_title" style="font-size:40px; color:#2e3949; margin-bottom:20px;line-height:1.4;">
							법적효력, 보안까지<br>
							INJAESIGN은 확실합니다
						</h3>
					</div>
					<div class="col-md-6">
						<p class="space" style="line-height:1.6;">
							INJAESIGN은 [전자서명법] 및<br>
							[전자문서 및 전자거래 기본법]에 따라<br>
							확실한 법적효력을 갖는 전자계약 서비스입니다.
						</p>
						<div class="SafeSec-link">
							<div class="">
								<a href="">
									<img src="images/icon-small-legality.svg" class="link-icon">
									<span class="TextBtn">법적효력 자세히 알아보기</span>
								</a>
							</div>
						</div>
						<br>
						<div class="SafeSec-link">
							<div class="">
								<a href="">
									<img src="images/icon-small-security.svg" class="link-icon">
									<span class="TextBtn">서비스 보안 자세히 알아보기</span>
								</a>
							</div>
						</div>
						<br>
						<div class="SafeSec-link">
							<div class="">
								<a href="">
									<img src="images/icon-small-identify.svg" class="link-icon">
									<span class="TextBtn">위변조 검증 자세히 알아보기</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	
	<div class="container">
	<div class="LastCtaSec align-center">
		<div class="LastCtaSec-container">
			<div class="LastCtaSec-card">
				<h2><strong>지금 바로 시작하세요!</strong></h2>
				<h6 class="LastCtaSec-description">
					설명이 필요 없는 간단한 계약 과정, 직접 경험해 보세요
				</h6>
				<div class="service-btn">
					<a href=""><b>서비스신청하기▷</b></a>
				</div>
			</div>
		</div>
	</div>
	</div>
</header>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">로그인</h4>
      </div>
      <div class="modal-body">
        <div class="login-header">
			<img src="images/logo.png" class="login-logo">
			<p>간편 전자결재 서비스, 인재싸인</p>
		</div>
		<div class="login-main">
			<form method="post" id="authForm" name="loginForm" action="userlogin" onsubmit="return checkIt();">
			
			<fieldset>
			  <div class="login-box">
				<div class="inp_text">
				  <label for="loginId" class="screen_out"></label>
				  <input type="text" id="id" name="email" placeholder="ID" >
				</div>
				<div class="inp_text">
				  <label for="loginPw" class="screen_out"></label>
				  <input type="password" id="pwd" name="pw" placeholder="Password" >
				</div>
			  </div>
			  <div class="inp_chk"> <!-- 체크시 checked 추가 -->
				  <input type="checkbox" id="keepLogin" class="inp_radio" name="keepLogin">
				  <label for="keepLogin" class="lab_g">
					<span class="img_top ico_check"></span>
					<span class="txt_lab">로그인 상태 유지</span>
					</label>
			  </div>
			  <button type="submit" class="btn-login" >로 그 인</button>
			  
			</fieldset>
		  </form>
		</div>
      </div>
    </div>
  </div>
</div>

<script>
	$(function() {
		//보안 때문에 c:out으로
		var result = "${msg}";
		
		checkModal(result);
		history.replaceState({}, null, null);
		
		function checkModal(result){
			if(result=='' || history.state){
				return;
			}
			
			if(result== 'loginfail'){
				alert("로그인에 실패하였습니다.")
			}
			
			if(result== 'logout'){
				alert("성공적으로 로그아웃 되었습니다.")
			}
			
			if(result== 'wrongAccess'){
				alert("잘못된 접근입니다.")
			}
		}	
		
	})
</script>

<script>
	function checkIt(){
		if(loginForm.s_num.value==""){
			alert("아이디를 입력해주세요.")
			loginForm.s_num.focus();
			return false;
		}
		
		if(loginForm.pw.value==""){
			alert("비밀번호를 입력해주세요.")
			loginForm.pw.focus();
			return false;
		}
		return true;
	}
</script>
</body>
</html>