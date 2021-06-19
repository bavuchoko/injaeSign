<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../header.jsp" %>

	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/sub.css">
	
	<link rel="stylesheet" href="css/lee_teampro.css">
    <link rel="stylesheet" href="css/contract.css">
	
		<div id="righter">
			
			<c:choose>
			<c:when test = "${not empty yetList}">
			<!-- empty -->
			<header class="LocalHeader">
				<h2 class="LocalHeader-title">내 문서</h2>
			</header>
			<div class="Main Main-container">
				<div class="DocumentsPage documents">
					<div class="ToolBar">
						<div class="documents-select">
							<select class="selectBox">
								<option class="selectBox-option" value="">문서명</option>
								<option class="selectBox-option" value="">기안자</option>
							</select>
						</div>
						<fieldset class="field-container">
						  <input type="text" placeholder="Search..." class="field" />
						  <a href=""><i class="fas fa-search"></i></a>
						</fieldset>
					</div>
					<div class="DocumentListHeader">
						<ul>
							<li class="DocumentListHeader-checkbox">
								<div aria-checked="false" class="CheckBox" role="checkbox tabindex="0">
									<input class="CheckBox-checkbox" type="checkbox" disabled>
									<div class="CheckBox-custom"></div>
								</div>
							</li>
							<li class="DocumentListHeader-writer"><b>기안자</b></li>
							<li class="DocumentListHeader-title"><b>제목</b></li>
							<li class="DocumentListHeader-file"><b>파일</b></li>
						</ul>
					</div>
					<div class="DocumentsEmptyList">
						<img src="../../images/icon-no-document.svg">
						<p>
							<b>서명 요청중인 문서가 없습니다.</b>
						</p>
					</div>
					
				</div>
			</div>
			<!-- End empty -->
			</c:when>
			
			<c:otherwise>
			<header class="LocalHeader">
				<h2 class="LocalHeader-title">내 문서  <span style="font-size:15px;">&nbsp;&nbsp;-&nbsp;&nbsp;${type}</span></h2>
			</header>
			<div class="Main Main-container">
				<div class="DocumentsPage documents">
					<div class="ToolBar">
						<div class="documents-select">
							<select class="selectBox">
								<option class="selectBox-option" value="">문서명</option>
								<option class="selectBox-option" value="">기안자</option>
							</select>
						</div>
						<fieldset class="field-container">
						  <input type="text" placeholder="Search..." class="field" />
						  <a href=""><i class="fas fa-search"></i></a>
						</fieldset>
					</div>
					<div class="DocumentListHeader">
						<ul>
							<li class="DocumentListHeader-checkbox">
								<div aria-checked="false" class="CheckBox" role="checkbox tabindex="0">
									<input class="CheckBox-checkbox" id="DocumentCheckbox" type="checkbox">
									<label for="DocumentCheckbox"></label>
								</div>
							</li>
							<li class="DocumentListHeader-writer"><b>기안자</b></li>
							<li class="DocumentListHeader-title"><b>제목</b></li>
							<li class="DocumentListHeader-file"><b>파일</b></li>
						</ul>
					</div>
					<div class="DocumentListBody">
						<div class="DocumentList-list" id="accordionList" role="tablist" aria-multiselectable="true">
							<ul class="DocumentList">
								
								<c:forEach var="list" items="${list}"> 
								<!-- li -->
								<li class="DocumentList-li">
									<div class="DocumentListItem">
									
										<div class="panel-list-head" role="tab" id="headingOne">
											<h4 class="panel--list-title">
												<a data-toggle="collapse" data-parent="#accordion" href="#${list.d_num }" aria-expanded="true" aria-controls="collapseOne">
													<ul>
														<li class="DocumentListItem-checkbox">
															<div aria-checked="false" class="CheckBox" role="checkbox tabindex="0">
																<input class="CheckBox-checkbox" type="checkbox" disabled>
																<div class="CheckBox-custom"></div>
															</div>
														</li>
														<li class="DocumentListItem-writer">
															<div class="member-writer">
																<img src="/files/image/${list.image }" style="max-width:100%; border-radius: 25px;">
															</div>
															<p class="member-writer-textb"><b>${list.name }</b></p>
															<p class="member-writer-textp">${list.department_name }</p>
														</li>
														<li class="DocumentListItem-title">
															<p>${list.title }</p>
															<span><fmt:formatDate value="${list.reg_date}" pattern="yy/MM/dd/"/></span>
														</li>
														<li class="DocumentListItem-file">
															<c:if test="${not empty list.files}">
															<i class="fas fa-paperclip"></i>
															</c:if>
														</li>
													</ul>
												</a>
											</h4>
										</div>
										
										<div id="${list.d_num }" class="panel-list-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
											<div class="panel-list-body">
											<div class="col-md-8">

												<c:if test="${list.status == 1 }">
													<h5 class="DocumentListInfo-title">나의 서명을 기다리고 있습니다.</h5>
												</c:if>
												<c:if test="${list.status == 7 }">
													<h5 class="DocumentListInfo-title">종료된 안건 입니다.</h5>
												</c:if>



												<ul>
													
													<c:forEach var="childlist" items="${list.users}" >
													<!-- li -->
													<li class="DocumentListInfo-writer">
														<div>
															<div class="member-writer">
																	<img src="/files/image/${childlist.u_image}" style="max-width:100%; border-radius: 25px;">
															</div>
															<div class="member-box">
																<p class="member-writer-textb"><b>${childlist.u_name}&nbsp; ${childlist.u_grade}</b>
																<p class="member-writer-textp">${childlist.u_department}</p>
															</div>
														</div>
														<div>
															<span class="Document-state-needsign">${childlist.email}</span>
														<c:choose>
															<c:when test="${childlist.u_status == 3}">
															<span class="Document-state-progress">서명 완료</span>
															</c:when>
															
															<c:when test="${childlist.u_status == 8 }">
															<span class="Document-state-stand">서명 대기</span>
															</c:when>


															<c:when test="${childlist.u_status == 4}">
																<span class="Document-state-rejected">반려</span>
															</c:when>


														</c:choose>
														</div>
													</li>
													<!-- End li -->
													</c:forEach>
													
												</ul>
											</div>
											<div class="col-md-4">
												<div class="Document-menuBox">
													<ul class="Document-menu-ul">
														<c:if test="${list.status eq 1}">



															<a href="getDocument?d_num=${list.d_num}"><li class="Document-menu">
																<i class="far fa-file-alt"></i><b>내용확인하고 서명하기</b>
															</li></a>



														</c:if>
														<c:if test="${list.status eq 7}">
															<a href="getDocument?d_num=${list.d_num}"><li class="Document-menu">
																<i class="far fa-file-alt"></i><b>내용확인하기</b>
															</li></a>
														</c:if>
													</ul>
												</div>
											</div>
											</div>
											
										</div>
									</div>
								</li>
								<!-- End li -->
								</c:forEach>
								<c:forEach var="list" items="${mydoc}">
								<!-- li -->
								<li class="DocumentList-li">
									<div class="DocumentListItem">

										<div class="panel-list-head" role="tab" id="headingOne">
											<h4 class="panel--list-title">
												<a data-toggle="collapse" data-parent="#accordion" href="#${list.d_num }" aria-expanded="true" aria-controls="collapseOne">
													<ul>
														<li class="DocumentListItem-checkbox">
															<div aria-checked="false" class="CheckBox" role="checkbox tabindex="0">
																<input class="CheckBox-checkbox" type="checkbox" disabled>
																<div class="CheckBox-custom"></div>
															</div>
														</li>
														<li class="DocumentListItem-writer">
															<div class="member-writer">
																<img src="/files/image/${list.image }" style="max-width:100%; border-radius: 25px;">
															</div>
															<p class="member-writer-textb"><b>${list.name }</b></p>
															<p class="member-writer-textp">${list.department_name }</p>
														</li>
														<li class="DocumentListItem-title">
															<p>${list.title }</p>
															<span><fmt:formatDate value="${list.reg_date}" pattern="yy/MM/dd/"/></span>
														</li>
														<li class="DocumentListItem-file">
															<c:if test="${not empty list.files}">
															<i class="fas fa-paperclip"></i>
															</c:if>
														</li>
													</ul>
												</a>
											</h4>
										</div>

										<div id="${list.d_num }" class="panel-list-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
											<div class="panel-list-body">
											<div class="col-md-8">

												<c:if test="${list.status == 1 }">
													<h5 class="DocumentListInfo-title">나의 서명을 기다리고 있습니다.</h5>
												</c:if>
												<c:if test="${list.status == 7 }">
													<h5 class="DocumentListInfo-title">종료된 안건 입니다.</h5>
												</c:if>



												<ul>

													<c:forEach var="childlist" items="${list.users}" >
													<!-- li -->
													<li class="DocumentListInfo-writer">
														<div>
															<div class="member-writer">
																	<img src="/files/image/${childlist.u_image}" style="max-width:100%; border-radius: 25px;">
															</div>
															<div class="member-box">
																<p class="member-writer-textb"><b>${childlist.u_name}&nbsp; ${childlist.u_grade}</b>
																<p class="member-writer-textp">${childlist.u_department}</p>
															</div>
														</div>
														<div>
															<span class="Document-state-needsign">${childlist.email}</span>
														<c:choose>
															<c:when test="${childlist.u_status == 3}">
															<span class="Document-state-progress">서명 완료</span>
															</c:when>

															<c:when test="${childlist.u_status == 8 }">
															<span class="Document-state-stand">서명 대기</span>
															</c:when>


															<c:when test="${childlist.u_status == 4}">
																<span class="Document-state-rejected">반려</span>
															</c:when>


														</c:choose>
														</div>
													</li>
													<!-- End li -->
													</c:forEach>

												</ul>
											</div>
											<div class="col-md-4">
												<div class="Document-menuBox">
													<ul class="Document-menu-ul">
														<c:if test="${list.status eq 1}">



															<a href="getDocument?d_num=${list.d_num}"><li class="Document-menu">
																<i class="far fa-file-alt"></i><b>내용확인하고 서명하기</b>
															</li></a>



														</c:if>
														<c:if test="${list.status eq 7}">
															<a href="getDocument?d_num=${list.d_num}"><li class="Document-menu">
																<i class="far fa-file-alt"></i><b>내용확인하기</b>
															</li></a>
														</c:if>
													</ul>
												</div>
											</div>
											</div>

										</div>
									</div>
								</li>
								<!-- End li -->
								</c:forEach>
							</ul>			
						</div>	
					</div>

				</div>
			</div>
			</c:otherwise>
		</c:choose>
		</div>
	</section>
	
	<section>
		<div class="container">
			<div class="row">
				
			</div>
		</div>
	</section>
	<section>
		<div class="container">
			<div class="row">
				
			</div>
		</div>
	</section>
	<section>
		<div class="container">
			<div class="row">
				
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
	<script src="js/bootstrap.min.js"></script>
	
</body>
</html>