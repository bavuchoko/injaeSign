<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/notice.css">

<link rel="stylesheet" href="css/lee_teampro.css">
<link rel="stylesheet" href="css/contract.css">
<link rel="stylesheet" href="css/sub.css">

<style>#righter {overflow-y:scroll; height : 85%;}

</style>
<div id="righter">
<header class="LocalHeader">
          <p class="LocalHeader-title"><i class="far fa-clipboard"></i> 게시판</p>
       </header>
	<div id="notice">
		<!-- ===== notice-header ====== -->
		<div class="notice-header">
			<div>
				<strong>전체 <span class="count">${PageMaker.total}</span>건
				</strong>
			</div>

			<div>
				<form action="notice" method="get" id="noticeSearch" name="noticeSearch">
					<select name="type">
						<option value="T" <c:out value="${PageMaker.cri.type == 'T'?'selected':''}"/>>제목</option>
						<option value="C" <c:out value="${PageMaker.cri.type == 'C'?'selected':''}"/>>내용</option>
						<option value="W" <c:out value="${PageMaker.cri.type == 'W'?'selected':''}"/>>작성자</option>
					</select>
					<input type="text" name="word" placeholder="검색어를 입력해주세요." value="${PageMaker.cri.word}">
					<input type="hidden" name="pageNum"	value="${PageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${PageMaker.cri.amount}">
					<a href=""><i class="fas fa-search"></i></a>
				</form>
			</div>
		</div>
		<!-- ===== End notice-header ====== -->

		<table>
			<colgroup>
				<col width="8%">
				<col width="62%">
				<col width="10%">
				<col width="10%">
				<col width="10%">

			</colgroup>

			<thead>
				<tr>
					<th>No.</th>
					<th style="text-align: left;">제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>

			<tbody>
				<c:set var="num" value="${PageMaker.total - ((PageMaker.cri.pageNum-1)*10)}"/>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${num}</td>
						<td style="text-align: left;"><a
							href="noticeView?n_num=${list.n_num}&pageNum=${pageMaker.cri.pageNum} &amount=${pageMaker.cri.amount}
	                                    &type=${pageMaker.cri.type}&word=${pageMaker.cri.word}"
							class="title"> ${list.title} </a></td>
						<td>${list.name}</td>
						<td>${list.reg_date}</td>
						<td>${list.view_count}</td>
						<c:set var="num" value="${num-1}"/>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<nav class="text-center">
			<ul class="pagination">
				<li>
					<c:if test="${PageMaker.prev}">
						<a href="${PageMaker.startPage-1}" aria-label="Previous"><span
							aria-hidden="true">&laquo;</span></a>
					</c:if>
				</li>
				
				<c:forEach var="num" begin="${PageMaker.startPage}" end="${PageMaker.endPage}">
					<li><a href="${num}" class="${PageMaker.cri.pageNum == num?'active':''}">${num}</a></li>
				</c:forEach>
				
				<li>
					<c:if test="${PageMaker.next}">
						<a href="${PageMaker.endPage+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
					</c:if>
				</li>
			</ul>
		</nav>
		<a href="noticeWrite" class="notice-write-btn">글쓰기</a>
		</section>
		<!-- End Notice -->

	</div>
</div>
</section>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        ...
      </div>
    </div>
  </div>
</div>

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


<form id="actionForm" method="get" action="notice">
	<input type="hidden" name="pageNum" value="${PageMaker.cri.pageNum}">
	<input type="hidden" name="amount" value="${PageMaker.cri.amount}">
	<input type="hidden" name="type" value="${PageMaker.cri.type}">
	<input type="hidden" name="word" value="${PageMaker.cri.word}">
</form>

<script>
$(function(){

	var actionForm = $("#actionForm");
	
	$(".pagination > li > a").on("click",function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	})
})
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
