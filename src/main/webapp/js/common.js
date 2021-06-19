$(".insert_btn").on("click", function(e){
    $(".modal-uploadContract-wrapper").show();
})

$(".LeecloseBtn").on("click", function(e){
    $(".modal-uploadContract-wrapper").hide();
})


// 탭바
$(document).ready(function(){

	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

});

//contract 업로드
$(".btnUploadContract").on("click",function(e){
	 $(".modal-uploadContract-wrapper").hide();
	 $(".modal-uploadConfirm-wrapper").show();
})

//contract closeBtn
$(".btnCloseUploadModal").on("click",function(e){

	$(".modal-uploadConfirm-wrapper").hide();
})

// 관리자페이지
$(".lee_click_event").on("click", function(e){
    if($(this).parent().next().css("display")=="none"){
        $(this).parent().next().show()
    }else{
        $(this).parent().next().hide()
    }
})


$(".modal-uploadContract-content__side ul li").on("click", function(e){
	$(".modal-uploadContract-content__side ul li a").removeClass("active-arrow")
	$(this).children().addClass("active-arrow")
	var contractType = $(this).children().attr("id")
	$("#contractType").val(contractType)
	
	var path = "images/contract/"
	var contractName = ($(this).children().attr("id"))
	var extension = ".png"
	var finalName = path+contractName+extension
	
	$("#contractPaper").attr("src", finalName)
	
	$("#download-a").attr("href", "files/pdf/"+contractType+".pdf");
})

$(".approveBtn").on("click", function(){
	documentFRM.action="approve";
	documentFRM.submit();
})

$(".sangsin").on("click", function(){
	documentFRM.action="insertDocument";

	var s_array = [];
	s_array = document.getElementsByName("s_nums");

	if(s_array.length>0){

		documentFRM.submit();
	}else {
		alert("결재선을 추가해 주세요");
	}

})



$(".approveBtnUpdate").on("click", function(e){
	documentFRM.action="updateDocDone";
	documentFRM.submit();
})

$(".rejectBtn").on("click", function(e){
	documentFRM.action="reject";
	documentFRM.submit();
})

$(".updateBtn").on("click", function(e){
	documentFRM.action="updateDocGo";
	documentFRM.submit();
})

$(document).on("click", ".eachdoc", function(){
	var d_num =$(this).attr("id");
	location.replace("getDocument?d_num="+d_num);
})

$(document).on("click", ".eachdoc2", function(){
	var d_num =$(this).attr("id");
	location.replace("getDocument2?d_num="+d_num);
})






