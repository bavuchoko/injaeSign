<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>
				
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/index_y.css">

	<link rel="stylesheet" href="css/sign.css">
	<link rel="stylesheet" href="css/subcss/style.css">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

		<div id="righter">
			<div class="document">
			
				<div class="col-md-8">
					<div class="confirm_btn">
						<input type="button" value="상신">
						<input type="button" value="회수">
						<input type="button" value="승인">
						<input type="button" value="반려">
						<input type="button" value="편집">
						<input type="button" value="결재선" id="people_icon" onclick="div_OnOff(this.value,'con');"/>
					</div>	
								
					<h3>출장보고서</h3>
					<section>		
						<div class="col-md-6">
							
						</div>
						<div class="col-md-6">
							<table class="confirm_line">
							<thead>
								<th rowspan="4"><p>결<p><p>재<p></th>
							</thead>
							<tbody>
								<tr>
									<td>기안</td>
									<td><div class="sign"> </div></td>
									<td>박보람 부장</td>
									<td>05/30 00:00</td>
									
								</tr>
								<tr>
									<td>팀원</td>
									<td><div class="sign"></div></td>
									<td>박보람 부장</td>
									<td>05/30 00:00</td>
								</tr>
								<tr>
									<td>팀장</td>
									<td><div class="sign"></div></td>
									<td>박보람 부장</td>
									<td>05/30 00:00</td>
								</tr>
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
									<td>박보람</td>
									<th>작성부서</th>
									<td>영업2팀</td>
									<th>문서번호</th>
									<td>20210530</td>
								</tr>
								<tr>
									<th>문서분류</th>
									<td>공통 > 출장보고서</td>
									<th>보안등급</th>
									<td>일반문서</td>
									<th>보존년한</th>
									<td>5년</td>
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
									<td><input type="text"></td>
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
									<td><textarea id="summernote" name="content" class="summernote"></textarea></td>
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
									<td><input type="file"></td>
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
								<button>확인</button>
							</div>
							<div id="orgt_list_div">
								<ul>
									<li>
										<span class="sdev">영</span>
										<span class="sgrade">부</span>
										<span class="sname">김길동</span>
										<span><i class="fas fa-times"></i></span>
									</li>
									<li>
										<span class="sdev">사</span>
										<span class="sgrade">대</span>
										<span class="sname">최길동</span>
										<span><i class="fas fa-times"></i></span>
									</li>
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
				
										<!-- <c:forEach var="def" items="${def_list}">   나중에 DB연결하고 주석 해제. 리턴은 def_list  -->
										<div class="panel panel-default" id="ogrt-pannel">

											<!-- 개별부서 -->
											<div class="panel-heading" role="tab" id="headingOne">
												<h4 class="panel-title">                             <!-- href 주소 = 하단 부서별 소속인원 div의 id값 -->
													<a data-toggle="collapse" data-parent="#accordion2" href="#aaa" aria-expanded="true" aria-controls="collapseOne">
														전략/기획
													</a>
												</h4>
											</div><!-- 개별부서 end-->


											<div class="panel-heading" role="tab" id="headingOne">
												<h4 class="panel-title">
													<a data-toggle="collapse" data-parent="#accordion2" href="#aaa" aria-expanded="true" aria-controls="collapseOne">
														영업
													</a>
												</h4>
											</div>
											<div class="panel-heading" role="tab" id="headingOne">
												<h4 class="panel-title">
													<a data-toggle="collapse" data-parent="#accordion2" href="#aaa" aria-expanded="true" aria-controls="collapseOne">
														사업
													</a>
												</h4>
											</div>
										</div>
										<!-- </c:forEach>    DB 연결시 주석 해제-->
						
									</div>

								</div>
							</div>
							<div id="crew">	
								<div id="crew_header">
									<button>소속원</button>
								</div>
								<div id="crew_body">

									<!--부서별 소속인원-->
									<div id="aaa" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
										<div class="panel-body orgt_pannel">
											<ul id="selected_list">
												<li class="select_this" data-code="a" data-dda="김김김">김김김<span>부</span></li>
												<li class="select_this" data-code="b"data-dda="이이이">이이이<span>과</span></li>
												<li class="select_this" data-code="c" data-dda="박박박">박박박<span>대</span></li>
												<li class="select_this" data-code="d" data-dda="최최최">최최최<span>대</span></li>
												<li class="select_this" data-code="e" data-dda="송송송">송송송<span>사</span></li>
												<li class="select_this" data-code="f" data-dda="한한한">한한한<span>사</span></li>
												<li class="select_this" data-code="g" data-dda="전전전">전전전<span>사</span></li>
												<li class="select_this" data-code="h" data-dda="유유유">유유유<span>사</span></li>
												<li class="select_this" data-code="i" data-dda="양양야">양양야<span>인</span></li>
											</ul>
										</div>	
									</div><!--//부서별 소속인원 end-->


								</div>
							</div>
						</div>
						</div>
					<div id="orgt_body_bottom"></div>
				</div>
			</div>
			
		</div>
	</section>
	
	
	<footer>
		<div id="footer">
			<div class="container">
				<div class="row">
					
				</div>
			</div>
		</div>
	</footer>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script src="js/pjs-action.js"></script>
	<script src="js/subjs/index.js"></script>
	
	
	
  </body>
</html>
