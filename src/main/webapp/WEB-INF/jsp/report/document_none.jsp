<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>
				
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/index_y.css">
	
	<link rel="stylesheet" href="css/lee_teampro.css">
    <link rel="stylesheet" href="css/contract.css">

	<link rel="stylesheet" href="css/sign.css">
	<link rel="stylesheet" href="css/subcss/style.css">
	
	<!-- SummerNote -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

	<script>
		function getUserListByDepartmentCode(name){
			 $.ajax({
				type:"post",
				url:"/getcrew",
				data:{department_name:name},
				success:function(user){
					console.log(user);
		            var html ="";
		                for(var i=0; i<user.length; i++) {
		                	html += "<li class='select_this' data-department='"+user[i].department_name+"' data-grade='"+user[i].grade+"' data-code='"+user[i].s_num+"' data-dda='"+user[i].name+"'>"+user[i].name+"<span>"+user[i].grade+"</span></li>"
		                }
		                $(".bb_"+name).append(html)
				},
				error:function(xhr, status, error){
					alert(error);
				}
			});
		}
	</script>
		
		<div id="righter">
		<form method="get" name="documentFRM">
		<input type="hidden" name="d_num" value="${details.d_num}">
			<div class="document">
			
				<div class="col-md-8">
					<h3>${details.d_code}</h3>
					<div class="confirm_btn">

						
					</div>
								
					<h3>${contractType}</h3>
					
					<section>		
						<div class="col-md-6">
							
						</div>
						<div class="col-md-6">
							<table class="confirm_line">
							<thead>
								<th rowspan="4"><p>결<p><p>재<p></th>
							</thead>
							<tbody class="signlines">
							<c:forEach var="listp" items="${details.process_line}">
								<tr>
									<td>${listp.p_grade }</td>
									<c:choose>
									<c:when test="${not empty listp.signiture }">
									<td><div class="sign"><img src="files/sign/${listp.signiture}" style="width:100%; height:100%;"</div></td>
									</c:when>
									<c:otherwise>
									<td><div class="sign"></div></td>
									</c:otherwise>
									</c:choose>
									<td>${listp.p_name }</td>
									<td>
										<input type="hidden" name="s_num" value="${listp.p_s_num}">
										<input type="hidden" name="signiture" value="${listp.signiture}">
									<td>
								</tr>
							</c:forEach>
							</tbody>
							</table>
						</div>
					</section>
					<section>
						<div class="col-md-12">
							<!--- 문서정보테이블 --->
							<table class="docu_info">
								<colgroup>
									<col width ="16%"/>
									<col width ="22%"/>
									<col width ="10%"/>
									<col width ="21%"/>
									<col width ="10%"/>
									<col width ="21%"/>
								</colgroup>
								
								<tbody>
									<tr>
										<th>작성자</th>
										<td>
											<input type="text" value="${details.name }" readonly>
											<input type="hidden" value="${details.s_num }" name="s_num">
										</td>
										
										<th>작성부서</th>
										<td>
											<input type="text" name="department_name" value="${details.department_name }" readonly>
										</td>
										
										<th>문서타입</th>
										<td>
											<input type="text" name="d_code" value="${details.d_code }" readonly>
										</td>
									</tr>
								</tbody>
							</table>
							
							<!---제목 테이블 --->
							<table class="docu_info">
								<colgroup>
									<col width ="16%"/>
									<col width ="84%"/>
								</colgroup>
								
								<tbody>
									<tr>
										<th>제목</th>
										<td><input type="text" value="${details.title}" readonly></td>
									</tr>
								</tbody>
							</table>
							
							<!---컨텐츠 --->
							<table class="docu_info">
								<colgroup>
									<col width ="16%"/>
									<col width ="84%"/>
								</colgroup>
								
								<tbody>
									<tr>
										<th>내용</th>
										<td><div>${details.content}</div></td>
									</tr>
									
									<script>
										$('#summernote').summernote({
									        tabsize: 2,
									        height: 300,
									        
									        toolbar: [
									          ['style', ['style']],
									          ['font', ['bold', 'underline', 'clear']],
									          ['color', ['color']],
									          ['para', ['ul', 'ol', 'paragraph']],
									          ['table', ['table']],
									          ['insert', ['link', 'picture', 'video']],
									          ['view', ['fullscreen', 'codeview', 'help']]
									        ]
									      });
									</script>
								
								</tbody>
							</table>
							
							<!---첨부파일 테이블 --->
							<table class="docu_info">
								<colgroup>
									<col width ="16%"/>
									<col width ="84%"/>
								</colgroup>
								
								<tbody>
								
									<tr>
										<th>첨부파일</th>
										<td><a href="files/documentfiles/${details.files }" download>${details.files}</a></td>
									</tr>
								</tbody>
							</table>
							
						</div>
					</section>					
				</div>		
			</div>
			
			<div class="col" id="sideup">
				<div id="orgt_header">
					<i class="fas fa-chevron-right" id="orgt_close"></i>
					<input name="whom" type="text" placeholder="검색..">
				</div>
				<div id="orgt_body">
					<div id="orgt_body_top">
						<div id="orgt_body_top_lefter">
							<div id="orgt_submit_div">
								<button class="send_checked_list">확인</button>
							</div>
							<div id="orgt_list_div">
								<ul id="checked_list">
									
								</ul>
							</div>
						</div>
						<div id="orgt_body_top_righter">
						
							<div id="dep">
								<div id="dep_header">
									<button>부서</button>
								</div>
								<div id="dep_body">
									
									<div class="panel-group" id="accordion2" role="tablist" aria-multiselectable="true">
										<c:forEach var="dep" items="${d_list}">
										<div class="panel panel-default yjjsl" id="ogrt-pannel" name="${dep.department_name}">
											<div class="panel-heading" role="tab" id="headingOne">
												<h4 class="panel-title">                             <!-- href 주소 = 하단 부서별 소속인원 div의 id값 -->
													<a data-toggle="collapse" data-parent="#accordion2" href="#aa_${dep.department_code}" aria-expanded="true" aria-controls="collapseOne">
														${dep.department_name}
													</a>
												</h4>
											</div>
										</div>
										</c:forEach>
									</div>
								</div>
							</div>
							
							<div id="crew">	
								<div id="crew_header">
									<button>소속원</button>
								</div>
								<div id="crew_body">
									<c:forEach var="dep" items="${d_list}">
									<div id="aa_${dep.department_code}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
										<div class="panel-body orgt_pannel">
											<ul id="selected_list" class="bb_${dep.department_name}">
												
											</ul>
										</div>									
									</div>
									<script>getUserListByDepartmentCode("${dep.department_name}")</script>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				<div id="orgt_body_bottom"></div>
			</div>
		</div>
	</form>
	</div>
</section>

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
            <strong>${uvo.name}</strong>&nbsp;<span>(${uvo.email })</span>
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

	<script>
	
		$(function (){
			$("body").on("click",".select_this", function(event){
			 
			 	var a =$(this).attr("data-dda");
			    var check = $(this).attr("data-code");
			    var b =$(this).attr("data-grade");
			    var dname = $(this).attr("data-department")
			    
			    if(arr.length>0){ 
			        for(var i=0; i<arr.length; i++){
			            if(arr[i]==check){
			                alert("이미 추가된 사람입니다.");
			                return;
			            }
			        }         
			        arr.push(check);
			        arrNames.push(a);
			        arrGrade.push(b); 
			        $("#checked_list").append("<li id='dd'> <span class='sdev'>"+b+"</span><span class='sgrade'>"+dname+"</span><span data-code='"+check+"' class='sname'>"+a+"</span><span><i class='fas fa-times'></i></span></li>");
			        return

			    }else{
			        arr.push(check);
			        arrNames.push(a);
			        arrGrade.push(b);
			        $("#checked_list").append("<li> <span class='sdev'>"+b+"</span><span class='sgrade'>"+dname+"</span><span data-code='"+check+"' class='sname'>"+a+"</span><span><i class='fas fa-times'></i></span></li>");
			    }
			});
			
			$(".send_checked_list").on("click", function(e){
				e.preventDefault();
				var arr2 = arr;
				var arrNames2 = arrNames;
				var arrGrade2 = arrGrade;
				
				var html="";
				
				$(".signlines").html("")
				for(var i=0; i<arr2.length; i++){
					html += "<tr>"
					html += "<td>"+arrGrade2[i]+"</td>"
					html += "<td><div class='sign'><img src=''></div></td>"
					html += "<td>"+arrNames2[i]+"</td>"
					html += "<td><input type='hidden' name='s_num[]' value='"+arr[i]+"'></td>"
					html += "</tr>"
					$(".signlines").append(html);
					html="";
				}
				
				 $("#sideup").css("right", "-100%");
				
				
			})
		});
		/* li class='select_this' data-code='"+user[i].s_num+"' data-dda='"+user[i].name+"'>"+user[i].name+"<span>"+user[i].grade+"</span></li>" */
		
	</script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script src="js/pjs-action.js"></script>
	<script src="js/subjs/index.js"></script>
	
  </body>
</html>
