<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/index_y.css">

<!-- 최영제 css -->
<link rel="stylesheet" href="css/signature-pad.css">
<link rel="stylesheet" href="css/stamp.css"/>

<link rel="stylesheet" href="css/lee_teampro.css">
<link rel="stylesheet" href="css/contract.css">

<!-- 박보람 -->
<link rel="stylesheet" href="css/sub.css">


		<!-- Modal -->
		<div id="padDimA" class="aa hidden"></div>
		<div id="padWrapperA" class="aa">
		   <div id="signature-pad" class="signature-pad">
		      <div class="signature-pad--body" style="border : 1px solid black;">
		         <canvas></canvas>
		      </div>
		      <div class="signature-pad--footer">
		
		         <div class="signature-pad--actions">
		            <div style="position: relative">
		               <button type="button" class="button clear Lee-yellowBtn" data-action="clear" style="float: left;">지우기</button>
		               <button type="button" class="button Lee-yellowBtn" data-action="undo" style="float: left;">뒤로</button>
		               <input type="hidden" id="user" name="user" value="${user}">
		            </div>
		            <div>
		               <div style="width : 500px;"></div>
		               <button type="button" class="button save Lee-yellowBtn" onclick="location.href='javascript:uploadCanvasToServer()'" style="float : right">저장</button>
		               <button type="button" class="button save Lee-yellowBtnLong" data-action="save-png" style="float : right">내 컴퓨터로 저장</button>
		            </div>
		         </div>
		      </div>
		   </div>
		</div>
		
		<div id="padDimB" class="aa hidden"></div>
		<div id="padWrapperB" class="aa">
		     <div style="width:700px; height:550px; background:white; border-radius: 4px; text-align: center; padding-top:20px;">
		        <input type="text" id="imgData" class="input--text" placeholder="이름을 입력해주세요." name="imgData"/>
		        <input type="button" class="create Lee-yellowBtn" value="만들기" onclick="javascript:createDojang(a);">
		      <div id="mydojang">
		          
		      </div>
		   </div>
		</div>
		
		
		<!-- End Modal -->
		
	<!-- modal -->
   <div class="modal-uploadContract-wrapper">
      <div class="modal-uploadContract-content">
   
         <div class="modal-uploadContract-content__header">
            <img src="images/icon-upload.b71054ab.svg">
            <span class="title-uploadContract">문서 업로드</span>
            <a href="#" class="btnClose-uploadContract"><i class="fa fa-times LeecloseBtn" aria-hidden="true"></i></a>
         </div>
   
         <div class="modal-uploadContract-content__flexWrapper">
            <div class="modal-uploadContract-content__side">
               <ul>
                  <li><a id="근로계약서" class="active-arrow" href="#">근로계약서</a></li>
                  <li><a id="경력증명서" href="#">경력증명서</a></li>
                  <li><a id="업무출장보고서" href="#">업무출장보고서</a></li>
                  <li><a id="재직증명서" href="#">재직증명서</a></li>
                  <li><a id="지출내역서" href="#">지출내역서</a></li>
                  <li><a id="품의서" href="#">품의서</a></li>
                  <li><a id="휴가신청서" href="#">휴가신청서</a></li>
               </ul>
            </div>
   
            <div class="modal-uploadContract-content__visual" style="overflow-y:scroll; background:#fff;">
               <img id="contractPaper" src="images/contract/경력증명서.png" style="max-width:100%;">
            </div>
         </div>
   
         <div class="modal-uploadContract-content__footer">
            <a id="download-a" download class="active-yellow btnUploadContract">다운로드</a>
         </div>
         
      </div>
   </div>
   
   <!-- modal -->
   <div class="modal-uploadConfirm-wrapper">
      <div class="modal-uploadConfirm-content">
   
         <div><img src="/images/uploadConfirm.png"></div>
   
         <div><h3><strong>서명 요청 시작하기</strong></h3></div>
   
         <div>
            <strong>${userName}</strong>&nbsp;<span>(${userEmail })</span>
         </div>
   
         <div>
            <p>위 이름과 이메일로 서명이 요청됩니다.</p>
            <p>위 메일로 서명자들에게 메일이 발송됩니다.</p>
         </div>
         
         <div>
         <form action="report" method="get" name="contractUploadForm">
            <a class="btnCloseUploadModal" href="#"><strong>취소</strong></a>
            <a href="javascript:contractUploadForm.submit();"><strong>확인하고 시작하기</strong></a>
            <input type="hidden" name="contractType" id="contractType">
         </form>
         </div>
         
      </div>
   </div>

		<div id="righter">
			<div class="setting">
				<header class="LocalHeader">
			      <p class="LocalHeader-title"><i class="fas fa-cog"></i> 설정</p>
			   </header>
				<div id ="detail_cut">
					<div class="detail_cut1">
						<div class="col-md-2">
							<P>인사정보</p>
						</div>
						
						<div class="col-md-7">
							<P>사원번호 : <span>${uvo.s_num}</span> </p>
							<P>사원이름 : <span>${uvo.name}</span></p>
							<P>사원계정 : <span>${uvo.email }</span></p>
							<P>부서 : <span>${uvo.department_name }</span></p>
							<P>사원직책 : <span>${uvo.grade }</span></p>
						</div>

						<div class="col-md-3">
							<div class="info_photo">
								<img src="files/image/${userImage}" style="max-width:100%; cursor: pointer;">
							</div>
						</div>
					</div>
					
					<div class="detail_cut2">
						<div class="col-md-2">
							<P>사인</p>
<%--							<button class="btn_sign sign_yj"><i class="fas fa-plus"></i> 사인 그리기</button>--%>
							<button class="btn_sign stamp_yj"><i class="fas fa-plus"></i> 도장 만들기</button>
						</div>
						
						<!-- 최영제 -->
						<div class="col-md-10">

                            <div class="stamp_sign">
                                 <div>
                                    <c:if test="${list.stamp ne '1'}">
                                          <img src="/files/sign/${list.stamp}" style="width:100%; height:151px; object-fit:cover;">
                                    </c:if>
                                 </div>
                                 <div>
                                    <a href="javascript:stampDelete(${list.s_num})"><i class="fas fa-trash-alt"></i> 삭제</a>
                                 </div>
                              </div>
                           </div>
	                  	</div>
						<!-- End 최영제 -->						
					
					<div class="detail_cut3">
						<div class="col-md-2">
							<P>비밀번호</p>
						</div>
						
						<div class="col-md-10">
						<form action="changeUserPw" method="post" name="changePwForm" onsubmit="return check();">
							<P>이전 비밀번호</p>
							<input type="password" name="expw" class="input_pwd" placeholder="현재비밀번호를 입력하세요">
							<P>새 비밀번호</p>
							<input type="password" name="newpw" class="input_pwd"placeholder="새 비밀번호를 입력하세요">
							<P>비밀번호 확인</p>
							<input type="password" name="newpw2" class="input_pwd" placeholder="새 비밀번호를 확인해주세요">
							<input type="submit" class="btn_pwd" value="저장하기">
						</form>
						</div>
					</div>

					<div>
						<div class="col-md-2">
							<P>개인정보</p>
						</div>
						
					<form method="post" action="changeUserInfo" name="changeInfoForm" onsubmit="return check2();">
						<div class="col-md-10">
							<P style="margin-top:15px;">연락처</p>
							<input type="text" name="phone" class="input_address" placeholder="연락처를 입력하세요" value="${uvo.phone }">
							<P>주소</p>
                            <input type="text" class="input_post" name="zip_code" id="sample6_postcode" placeholder="우편번호" value="${uvo.zip_code }">
							<input type="button" class="btn btn_post ml-20" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="border: 1px solid #e8e8e8; outline:none;"><br>
							<input type="text" class="input_address" name="address" id="sample6_address" placeholder="주소" value="${uvo.address }"><br>
							<input type="text" class="input_address" name="address_detail" id="sample6_detailAddress" placeholder="상세주소" value="${uvo.address_detail }">
							<input type="hidden" name="reference" id="sample6_extraAddress" placeholder="참고항목">
							<input type="submit" class="btn_address" value="저장하기" style="margin-right: 15px;">
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script>
		function check(){
			if(changePwForm.expw.value==""){
				alert("이전 비밀번호를 입력해주세요.");
				changePwForm.expw.focus()
				return false;
			}
			
			if(changePwForm.newpw.value==""){
				alert("새 비밀번호를 입력해주세요.");
				changePwForm.newpw.focus()
				return false;
			}
			
			if(changePwForm.newpw2.value==""){
				alert("새 비밀번호를 확인을 입력해주세요.");
				changePwForm.newpw2.focus()
				return false;
			}
			
			if(changePwForm.newpw2.value != changePwForm.newpw.value){
				alert("새 비밀번호가 틀립니다. 다시 입력해주세요.");
				changePwForm.newpw.focus()
				return false;
			}
			
			return true;
		}
		
		function check2(){
			if(changeInfoForm.phone.value==""){
				alert("연락처를 입력해주세요.")
				changeInfoForm.phone.focus()
				return false;
			}
			
			if(changeInfoForm.zip_code.value==""){
				alert("우편번호를 입력해주세요.")
				changeInfoForm.zip_code.focus()
				return false;
			}
			
			if(changeInfoForm.address.value==""){
				alert("주소를 입력해주세요.")
				changeInfoForm.address.focus()
				return false;
			}
			
			if(changeInfoForm.address_detail.value==""){
				alert("상세주소를 입력해주세요.")
				changeInfoForm.address_detail.focus()
				return false;
			}
			
			return true;
		}
	</script>
	
	<script>
		$(function() {
			var result = '${msg}';
			
			checkModal(result);
			history.replaceState({}, null, null);
			
			function checkModal(result){
				if(result=='' || history.state){
					return;
				}
				
				if(result== 'changedpw'){
					alert("비밀번호를 성공적으로 변경하였습니다.")
				}
				
				if(result== 'failedchangespw'){
					alert("비밀번호 변경에 실패하였습니다. 다시 시도해주세요.")
				}
				
				if(result== 'changedinfo'){
					alert("회원정보를 성공적으로 변경하였습니다.")
				}
				
				if(result=='failedchangesinfo'){
					alert("회원정보 변경에 실패하였습니다. 다시 시도해주세요.")
				}
			}	
		})
	</script>
	
	<!-- 다음지도 API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>
	
	<!-- 최영제 js -->
	<script>
		function signDelete(e){
	         location.href="signDelete?s_num="+e;
	      }
	   
	   function stampDelete(e){
	         location.href="stampDelete?s_num="+e;
	      }
	</script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="js/html2canvas.js"></script>
    <script src="js/stamp.js"></script>
    <script src="js/signature_pad.umd.js"></script>
    <script src="js/app.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
