<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="css/index_y.css">
<script src="js/common.js" defer></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">

		<div id="righter">
		<div class="set_tab">
			<header class="LocalHeader">
		      <p class="LocalHeader-title"><i class="fas fa-cog"></i> 인사관리</p>
		   </header>
			<div id ="detail_box">
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1" >사원등록</li>
				<li class="tab-link" data-tab="tab-2">사원관리</li>
				<li class="tab-link" data-tab="tab-3">부서관리</li>
				<li class="tab-link" data-tab="tab-4">직급관리</li>
				<li class="tab-link" data-tab="tab-5">회사정보</li>
			</ul>

			<div id="tab-1" class="tab-content current ">
				<div class="join_form">
					<form name="userJoin" method="post" action="UserJoinPro.do" enctype="multipart/form-data"> 
					<table>
						<colgroup>
							<col width="30%" />
							<col width="35%" />
							<col width="35%" />
						</colgroup>
						<tbody>
						
							<tr>
								<th><span>성명</span></th>
								<td><input type="text" placeholder="이름을 입력하세요." name="name" id="name"></td>
								<td rowspan="3">
									<div class="image-container">
										<label for="input-image">
											<img id="preview-image" src="../../images/plus.png" style="cursor:pointer"/>
										</label>
										<input style="display: none;" type="file" id="input-image" name="file">
									</div>
								</td>
							</tr>
							<tr>
								<th><span>부서</span></th>
								<td>
									<select name="department_name">
											<option value="">부서선택</option>
										<c:forEach var="list" items="${DepartmentList}">									
											<option value="${list.department_name}">${list.department_name}</option>
										</c:forEach>
									</select>
								</td>
								<td></td>
							</tr>
							<tr>
								<th><span>직급</span></th>
								<td>
									<select name="grade">
										<option value="">직급선택</option>
										<c:forEach var="list" items="${GradeList}">									
											<option value="${list.grade}">${list.grade}</option>
										</c:forEach>
									</select>
								</td>
								<td></td>
							</tr>
							<tr class="email">
								<th><span>이메일</span></th>
								<td colspan="2"><input type="text" class="email" placeholder="이메일입력" id="email1" name="email1" style="width:50%">
									<span class="mar10">@</span>
									<input type="text" class="email email2" id="email2" name="email2" style="width: 41.9%;">
									<input type="hidden" name="email" value="">
								</td>
							</tr>
							<tr>
								<th><span>비밀번호</span></th>
								<td colspan="2"><input type="password" placeholder="비밀번호를 입력하세요." name="pw" id="pw"></td>
							</tr>
							<tr>
								<th><span>비밀번호 확인</span></th>
								<td colspan="2"><input type="password" placeholder="비밀번호를 확인하세요." name="pwCheck" id="pwCheck"></td>
							</tr>
							<tr>
								<th><span>생년월일</span></th>
								<td colspan="2"><input type="date" name="birth"></td>
							</tr>
							<tr>
								<th><span>우편번호</span></th>
								<td colspan="2"><input type="text" name="zip_code" id="zip_code"> <input
									type="button" value="주소 찾기" class="dup" onclick="execDaumPostcode()"
									style="margin: 5px 0 0 0px;"></td>
							</tr>
							<tr>
								<th><span>주소</span></th>
								<td colspan="2"><input type="text" name="address" id="address" size="50"> <input
									type="text" name="address_detail" id="address_detail" size="25" style="margin: 5px 0 0 0px;">
								</td>
							</tr>
							<tr>
								<th><span>휴대전화</span></th>
								<td colspan="2"><input type="text" name="phone1" id="phone1" style="width:29%"><span class="mar10">-</span>
									<input type="text" name="phone2" id="phone2" style="width:29.5%"><span class="mar10">-</span>
									<input type="text" name="phone3" id="phone3" style="width:29.5%">
									<input type="hidden" name="phone" value="">
								</td>
							</tr>
						</tbody>
					</table>
					</form>
				</div>
				<div class="member-submit">
					<button type="button" class="submitbtn" onclick="javascript:check();">사원등록</button>
				</div>
			</div>
			<div id="tab-2" class="tab-content">
				<div class="ToolBar">
					<div class="documents-select">
						<select class="selectBox">
							<option class="selectBox-option" value="">사원명</option>
							<option class="selectBox-option" value="">부서</option>
						</select>
					</div>
					<fieldset class="field-container">
					  <input type="text" placeholder="Search..." class="field" />
					  <a href=""><i class="fas fa-search"></i></a>
					</fieldset>
				</div>
				<div id="member-list">
					<table class="table">
					<tr>
						<th>성명</th>
						<th>부서</th>
						<th>직급</th>
						<th>사원계정</th>
						<th>휴대전화</th>
						<th>입사일</th>
						<th></th>
						<th></th>
					</tr>
					<c:forEach var="list" items="${UserList}">
					<tr>
						<td>${list.name}</td>
						<td>${list.department_name}</td>
						<td>${list.grade}</td>
						<td>${list.email}</td>
						<td>${list.phone}</td>
						<td>${list.reg_date}</td>
						<td><a class="btn-delete" href="javascript:userDelete('${list.s_num}');" role="button"><i class="fas fa-sign-out-alt"></i>퇴사</a></td>
					</tr>
					</c:forEach>
					</table>
				</div>
			</div>
			
			<div id="tab-3" class="tab-content">
				<div id="member-list">
				<form name="department" method="post" action="departmentInsertPro.do">
					<table class="table">
						<colgroup>
							<col width="50%;">
							<col width="50%;">
						</colgroup>
					<tr>
						<th>부서명</th>
						<th></th>
					</tr>
					<c:forEach var="list" items="${DepartmentList}">
					<tr>
						<td>${list.department_name}</td>
						<td><a class="btn-delete" href="javascript:departmentDelete('${list.department_name}');" role="button"><i class="fas fa-sign-out-alt"></i> 삭제</a></td>
					</tr>
					</c:forEach>
					<tr>
						<td><input type="text" name="department_name" id="department_name"></td>
						<td><a class="btn-insert" href="javascript:departmentCheck();" role="button">부서등록</a></td>
					</tr>
					
					</table>
				</form>
				</div>
			</div>
			
			<div id="tab-4" class="tab-content">
				<div id="member-list">
				<form name="grade" method="post" action="gradeInsertPro.do">
					<table class="table">
						<colgroup>
							<col width="50%;">
							<col width="50%;">
						</colgroup>
					<tr>
						<th>직급명</th>
						<th></th>
					</tr>
					<c:forEach var="list" items="${GradeList}">
					<tr>
						<td>${list.grade}</td>
						<td><a class="btn-delete" href="javascript:gradeDelete('${list.grade}');" role="button"><i class="fas fa-sign-out-alt"></i> 삭제</a></td>
					</tr>
					</c:forEach>
					<tr>
						
						<td><input type="text" name="grade" id="grade_name"></td>
						<td><a class="btn-insert" href="javascript:gradeCheck();" role="button">직급등록</a></td>
						
					</tr>
					
					</table>
				</form>
				</div>
			</div>
			
			<div id="tab-5" class="tab-content">
				<div class="company">
					<table>
						<colgroup>
							<col width="25%" />
							<col width="25%" />
							<col width="25%" />
							<col width="25%" />
						</colgroup>
						<tbody>
						
							<tr>
								<th><strong>회사명</strong></th>
								<td>인재싸인</td>
								<th><strong>구분</strong></th>
								<td>법인</td>
							</tr>
							<tr>
								<th><strong>사업자등록번호</strong></th>
								<td>502-03-39735</td>
								<th><strong>법인등록번호</strong></th>
								<td>502-03-39735</td>
							</tr>
							<tr>
								<th><strong>대표자명</strong></th>
								<td>이명우</td>
								<th><strong>담당자명</strong></th>
								<td>박종수</td>
							</tr>
							<tr>
								<th><strong>전화번호</strong></th>
								<td>042-111-1111</td>
								<th><strong>팩스번호</strong></th>
								<td>111111</td>
							</tr>
							<tr>
								<th><strong>개업연월일</strong></th>
								<td>2021-06-02</td>
								<th><strong>이메일</strong></th>
								<td>service@injaesign.co.kr</td>
							</tr>
							<tr>
								<th><strong>주소</strong></th>
								<td colspan="3">대전광역시 중구 계룡로 825 희영빌딩 5층</td>
								<td style="border:0"></td>
								<td style="border:0"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			</div>
		</div>
		</div>

	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="js/bootstrap.js"></script>
  </body>
  
  
  <script>
		function readImage(input) {
			// 인풋 태그에 파일이 있는 경우
			if(input.files && input.files[0]) {
				// 이미지 파일인지 검사 (생략)
				// FileReader 인스턴스 생성
				const reader = new FileReader()
				// 이미지가 로드가 된 경우
				reader.onload = e => {
					const previewImage = document.getElementById("preview-image")
					previewImage.src = e.target.result
				}
				// reader가 이미지 읽도록 하기
				reader.readAsDataURL(input.files[0])
			}
		}
		// input file에 change 이벤트 부여
		const inputImage = document.getElementById("input-image")
		inputImage.addEventListener("change", e => {
			readImage(e.target)
		})
    </script>
    
    
      <script>
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	 
	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	 
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zip_code').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('address').value = fullRoadAddr;
	                document.getElementById('address_detail').focus();
	            }
	        }).open();
	    }
	    
	    
	    
	    
	    function check(){
	    	
	    	var phone1=userJoin.phone1.value;
	    	var phone2=userJoin.phone2.value;
	    	var phone3=userJoin.phone3.value;
	    	var phone=phone1+phone2+phone3;
	    	userJoin.phone.value = phone;
	    	
	    	var email1=userJoin.email1.value;
	    	var email2=userJoin.email2.value;
	    	var email=email1+email2;
	    	userJoin.email.value = email;
	    	
	    	
	        if(!userJoin.name.value){
	           alert("성명을 입력해주세요");
	           userJoin.name.focus();
	           return false;
	        }
	        if(!userJoin.department_name.value){
	           alert("부서를 선택해주세요");
	           userJoin.department_name.focus();
	           return false;
	        }
	        if(!userJoin.grade.value){
	           alert("직급을 선택해주세요");
	           userJoin.grade.focus();
	           return false;
	        }
	        if(!userJoin.email.value){
	           alert("이메일을 입력하세요");
	           userJoin.email.focus();
	           return false;
	        }
	        if(!userJoin.pw.value){
	           alert("비밀번호를 입력하세요");
	           userJoin.pw.focus();
	           return false;
	        }
	        if(!userJoin.pwCheck.value){
	           alert("비밀번호 확인을 입력하세요");
	           userJoin.pwCheck.focus();
	           return false;
	        }
	        if(userJoin.pw.value != userJoin.pwCheck.value){
	           alert("패스워드가 동일하지 않습니다.");
	           userJoin.pw.focus();
	           return false;
	        }
	        if(!userJoin.birth.value){
	           alert("생년월일을 입력해주세요");
	           userJoin.birth.focus();
	           return false;
		    }
	        if(!userJoin.zip_code.value){
	           alert("우편번호를 입력하세요");
	           userJoin.zip_code.focus();
	           return false;
	        }
	        if(!userJoin.address.value){
	           alert("주소를 입력하세요");
	           userJoin.pwCheck.focus();
	           return false;
	        }
	        if(!userJoin.address_detail.value){
	           alert("상세주소를 입력하세요");
	           userJoin.address_detail.focus();
	           return false;
	        }
	        if(!userJoin.address_detail.value){
	           alert("상세주소를 입력하세요");
	           userJoin.address_detail.focus();
	           return false;
	        }
	        if(!userJoin.phone1.value){
	           alert("휴대전화를 입력하세요");
	           userJoin.phone1.focus();
	           return false;
	        }
	        if(!userJoin.phone2.value){
	           alert("휴대전화를 입력하세요");
	           userJoin.phone2.focus();
	           return false;
	        }
	        if(!userJoin.phone3.value){
	           alert("휴대전화를 입력하세요");
	           userJoin.phone3.focus();
	           return false;
	        }
	        if(!userJoin.file.value){
	           alert("사진을 넣어주세요");
	           userJoin.image.focus();
	           return false;
	        }
	        
	        userJoin.submit();
	     }
	</script>
	
	
    <script>
		function departmentCheck(){
			if(!department.department_name.value){
				alert("부서명을 입력하세요");
				department.department_name.focus();
				return false;
			}
			alert("신규 부서 생성이 완료되었습니다")
			department.submit();
		}
		function gradeCheck(){
			if(!grade.grade.value){
				alert("부서명을 입력하세요");
				grade.grade.focus();
				return false;
			}
			alert("신규 직급 생성이 완료되었습니다")
			grade.submit();
		}
		function userDelete(s_num) {
			var chk = confirm("정말 퇴사처리하시겠습니까?");
			if (chk) {
				location.href='userDeletePro.do?s_num='+s_num;
			}
		}
		function departmentDelete(department_name) {
			var chk = confirm("정말 삭제하시겠습니까?");
			if (chk) {
				location.href='departmentDeletePro.do?department_name='+department_name;
			}
		}
		function gradeDelete(grade) {
			var chk = confirm("정말 삭제하시겠습니까?");
			if (chk) {
				location.href='gradeDeletePro.do?grade='+grade;
			}
		}
    </script>
    
    


</html>
