<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

	<!-- css -->
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/notice.css">
	
	<link rel="stylesheet" href="css/lee_teampro.css">
	<link rel="stylesheet" href="css/contract.css">
	<link rel="stylesheet" href="css/sub.css">
	
        <!-- 이명우 작성 -->
		<div id="righter">
		<header class="LocalHeader">
            <p class="LocalHeader-title"><i class="far fa-clipboard"></i> 게시판</p>
         </header>
            <div class="container">
                <div class="noticeViewWrapper">
                    <h1>${view.title}</h1>
        
                    <div class="dataInfo">
                        <div>
                            <span class="writer">${view.name}</span>
                            <span class="date">${view.reg_date}</span>
                        </div>
                        <div>조회 <span class="count">${view.view_count}</span>
                        </div>
                    </div>
                   
                    <!-- 박보람 -->
                    <div class="content">
                    	<div class="text-right noticeViewfile">
                            <i class="fas fa-paperclip"></i> 첨부파일 <a style="color:#2880b9;" href="/files/notice/${view.file}" download="${view.file}">${view.file}</a>
                        </div>
                        <div class="content-main">
                              ${view.content}
                        </div>
                    </div>
                </div>
            </div>

            <div class="container text-center noticeView_btnGroup">
                <a href="notice">뒤로</a> 
                <a href="noticeUpdate?n_num=${view.n_num}" class="nike-btn">수정</a> 
                <a href="javascript:getdel()" class="nike-btn">삭제</a> 
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

	<script>
		function getdel(){
			if(confirm("정말로 삭제하시겠습니까?")){
				location.href = "getDelete?n_num=${view.n_num}";
			}
		}
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
