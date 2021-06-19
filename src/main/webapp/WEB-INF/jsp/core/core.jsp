<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

	<link rel="stylesheet" href="css/header.css">
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/index_y.css">
	
	<link rel="stylesheet" href="css/lee_teampro.css">
    <link rel="stylesheet" href="css/contract.css">
	
	
	
		<div id="righter">
			<div class="margin20">
				<div class="col-md-5">
					<div class="ing">
						<h4>나의 결재현황</h4>
					<c:forEach var="list" items="${approved}">
						<p class="date">――――――― <fmt:formatDate value="${list.reg_date}" pattern="yyyy 년  MM  월  dd 일"/> ―――――――</p>
						<div class="col-md-3">
							<div class="ing_imoge">
								<p><i class="far fa-file-alt"></i></p>
								<p>결재</p>
							</div>
						</div>
						<div class="col-md-9 eachdoc" id="${list.d_num}">
							<div class="ing_text">
								<p><b><span>[${list.title.substring(0,18)}]</span>를 결재하였습니다.</b></p>
								<p>양식명 : ${list.d_code}</p>
								<p>기안자 : ${list.name}</p>
								<p><i class="far fa-clock"></i>${list.end_date}</p>
							</div>
						</div>
					</c:forEach>
	
					</div>
				</div>
				<div class="col-md-7">
					<div class="other">
						<div class="col-md-6">
							<div class="other_1">
								<div><h5>&nbsp;미결함</h5></div>
								<div><h5><a href="workspace_yetList">MORE <i class="fas fa-chevron-right"></i>&nbsp;</a></h5></div>
	
								<c:forEach var="list" items="${yetList}">
								<table class="eachdoc" id="${list.d_num}">
									<colgroup>
									<col width ="20%"/>
									<col width ="80%"/>
									</colgroup>
	
									<tbody>
										<tr><th colspan="2"><p>${list.d_code}</p></th></tr>
										<tr>
										
										<td><img class="member" style="max-width:100%;" src="files/image/${list.image}"></td>
										<td>
											<p>기안자 : ${list.name}</p>
										</td>
										</tr>
									</tbody>
								</table>
	
								</c:forEach>


							</div>
							<div class="other_1">
								<div><h5>&nbsp;반려함</h5></div>
	
	
								<div><h5><a href="workspace_rejectList">MORE <i class="fas fa-chevron-right"></i>&nbsp; </a></h5></div>

								<c:forEach var="list" items="${rejectList}">
								<table class="eachdoc" id="${list.d_num}">
									<colgroup>
									<col width ="20%"/>
									<col width ="80%"/>
									</colgroup>
	
									<tbody>
										<tr><th colspan="2"><p>${list.d_code}<p></th></tr>
										<tr>
											<td><img class="member" src="files/image/${list.image}"></td>
										<td>
											<p>기안자 : ${list.name}</p>
										</td>
										</tr>
									</tbody>
								</table>
								</c:forEach>
	
	
							</div>
						</div>
						<div class="col-md-6">
							<div class="other_1">
								<div><h5>&nbsp;진행함</h5></div>
								<div><h5><a href="workspace_processingList">MORE <i class="fas fa-chevron-right"></i>&nbsp; </a></h5></div>
							<c:forEach var="list" items="${processingList}">
								<table class="eachdoc" id="${list.d_num}">
									<tbody>
									<tr>
										<th colspan="2">
											<span>${list.d_code}</span>
											<span style="font-size:12px;">&nbsp;-&nbsp;${list.title}</span>
										</th>
									</tr>
	
									<tr>
										<td>
								<c:forEach var="listg" items="${list.users}">
								<div>
									<img class="member" src="files/image/${listg.u_image}">
									<p class="eachUserName">${listg.u_name} ${listg.u_grade}</p>
									<span class="eachUserdep" style="font-size:13px;">${listg.u_department}</span>
								
								</div>
								
								<div class="arrow">
									<i class="fas fa-chevron-right"></i>
								</div>
											
								</c:forEach>

										</td>
									</tr>
	
									<tr>
										<td>
											<p>기안자 : ${list.name}</p>
										</td>
									</tr>
	
									</tbody>
								</table>
							</c:forEach>
							<c:forEach var="list" items="${mydoc}">
								<table class="eachdoc" id="${list.d_num}">
									<tbody>
									<tr>
										<th colspan="2">
											<span>${list.d_code}</span>
											<span style="font-size:12px;">&nbsp;-&nbsp;${list.title}</span>
										</th>
									</tr>

									<tr>
										<td>
								<c:forEach var="listg" items="${list.users}">
								<div>
									<img class="member" src="files/image/${listg.u_image}">
									<p class="eachUserName">${listg.u_name} ${listg.u_grade}</p>
									<span class="eachUserdep" style="font-size:13px;">${listg.u_department}</span>

								</div>

								<div class="arrow">
									<i class="fas fa-chevron-right"></i>
								</div>

								</c:forEach>

										</td>
									</tr>

									<tr>
										<td>
											<p>기안자 : ${list.name}</p>
										</td>
									</tr>

									</tbody>
								</table>
							</c:forEach>

							</div>
							<div class="other_1">
								<div><h5>&nbsp;완료함</h5></div>
								<div><h5><a href="workspace_doneList">MORE <i class="fas fa-chevron-right"></i>&nbsp; </a></h5></div>

								<c:forEach var="list" items="${doneList}">
									<table class="eachdoc" id="${list.d_num}">
									<colgroup>
									<col width ="20%"/>
									<col width ="80%"/>
									</colgroup>

									<tbody>
										<tr><th colspan="2">
											<span>${list.d_code}</span>
											<span style="font-size:12px;">&nbsp;-&nbsp;${list.title}</span>
										</th></tr>
										<tr>
											<td><img class="member" src="files/image/${list.image}"></td>
										<td>
											<p>기안자 : ${list.name}</p>
										</td>
										</tr>
									</tbody>
								</table>

								</c:forEach>

							</div>
						</div>
						
					</div>
				</div>
			</div>
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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>

  </body>
</html>