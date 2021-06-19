<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<title>인재싸인/서비스신청</title>
</head>
<body style="background:#f5f5f5">
<header>
	<div class="Header Header-trans">
		<div class="Header-container">
			<a href="/"><img src="../../images/logo.png" class="Header-logo"></a>
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
					<a href="" class="login-btn" data-toggle="modal" data-target="#myModal"><b>로그인</b></a>
					<a href="" class="start-btn"><b>서비스신청</b></a>
				</li>
			</ul>
		</div>
	</div>
	<div class="MainTitle MainTitle-service">
		<div class="LandingContainer">
			<h1>
				서비스신청
			</h1>
			<p style="font-size:18px;">기업의 업무 환경에 맞는 최상의 솔루션을 성심성의껏 안내해 드리겠습니다.</p>
		</div>
	</div>
	
	<div class="container" style="margin-top:50px;">
		<section class="InquiryArea">
			<div class="InquiryContact">
				<ul>
					<li>
						<div class="Comp_tb">
							<div class="Comp_cell">
								<span class="Comp_img">
									<img src="../../images/icon_tel.png">
								</span>
								<span class="CompTxt1">전화문의</span>
								<span class="CompTxt2 big">02.6965.3218</span>
							</div>
						</div>
					</li>
					<li>
						<div class="Comp_tb">
							<div class="Comp_cell">
								<span class="Comp_img">
									<img src="../../images/icon_mail.png">
								</span>
								<span class="CompTxt1">메일문의</span>
								<span class="CompTxt2 big">service@injaesign.co.kr</span>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="InquiryBox">
			<form>
				<div class="boardType1">
					<ul>
						<li>
							<strong class="boTit">회사명<span class="star">*</span></strong>
							<input type="text" name="company" maxlength="50" placeholder="회사명">
						</li>
						<li>
							<strong class="boTit">임직원 수<span class="star">*</span></strong>
							<input type="text" name="member" maxlength="50" placeholder="임직원 수">
						</li>
						<li>
							<strong class="boTit">담당자명<span class="star">*</span></strong>
							<input type="text" name="writer" maxlength="50" placeholder="담당자명">
						</li>
						<li>
							<strong class="boTit">연락처<span class="star">*</span></strong>
							<input type="text" name="tel" maxlength="50" placeholder="연락처">
						</li>
						<li class="addr">
							<strong class="boTit">메일주소<span class="star">*</span><span></span></strong>
							<input type="text" name="company" maxlength="50" placeholder="메일주소">
						</li>
					</ul>
				</div>
				<div class="boardType3">
					<strong class="boTit">상담내용</strong>
					<textarea name="content" placeholder="도입시 주요하게 검토중이신 사항에 대하여 입력해주세요"></textarea>
				</div>
				<div class="boardType5">
					<strong class="boTit">방문경로<span class="star">*</span></strong>
					<select name="">
						<option value>(필수선택)제품정보를 처음 접하신 경로를 알려주세요.</option>
						<option value>네이버검색</option>
						<option value>다음검색</option>
						<option value>구글검색</option>
						<option value>블로그</option>
						<option value>카페</option>
						<option value>이미지 배너</option>
						<option value>언론보도</option>
						<option value>지인소개</option>
						<option value>기타</option>
					</select>
				</div>
				<div class="agreeBox">
					<p class="check">
						<input type="checkbox" id="agree" name="agree">
						<label for="agree">
							개인정보처리방침에 동의합니다.
						</label>
					</p>
					<a href="" class="detail">[자세히보기]</a>
				</div>
			</form>
			</div>
			<div class="BtnArea">
				<a href="apply_service" class="btnCircle">서비스신청하기</a>
			</div>
		</section>
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
			<img src="../../images/logo2.png" class="login-logo">
			<p>간편 전자결재 서비스, 인재싸인</p>
		</div>
		<div class="login-main">
			<form method="post" id="authForm" action="login_pro.do">
			
			<fieldset>
			  <div class="login-box">
				<div class="inp_text">
				  <label for="loginId" class="screen_out"></label>
				  <input type="text" id="id" name="id" placeholder="ID" >
				</div>
				<div class="inp_text">
				  <label for="loginPw" class="screen_out"></label>
				  <input type="password" id="pwd" name="pwd" placeholder="Password" >
				</div>
			  </div>
			  <div class="inp_chk"> <!-- 체크시 checked 추가 -->
				  <input type="checkbox" id="keepLogin" class="inp_radio"  name="keepLogin">
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

</body>
</html>