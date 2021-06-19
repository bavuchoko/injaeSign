
var a=0;  //0 가로모드   1 세로모드
	
$(".change").on("click",function(){
	var b = vertical(a);
	a = a + b;
	return a;
});

function vertical(a){
	if(a==0){
		var d=1;
		a = a+d;
		alert("세로로 변경되었습니다");
		return a;
	}else if(a==1){
		var d=-2;
		a=a+d;
		alert("가로로 변경되었습니다");
		return a;
	}

}

// 도장생성
function createDojang(a){
     //가로 세로 변수
	var str = document.getElementById("imgData").value;
	var lss = Array.from(str);
	var ls =lss.length;
	var row = 0;  
	var col = 0;  
	
	
	if(ls==0){return;    
	}else if(ls==1){row=1;col=1;
	}else if(ls==2){row=1;col=2;
	}else if(ls==3){row=1;col=3;
	}else if(ls==4){row=2;col=2;
	}else if(ls>=5 && ls<7){row=2;col=3;
	}else if(ls>=7){row=3;col=3;}
	
	var html ="";
	var vt = "";
	
	for(let i = 0; i<3; i++){
		html += "<div class='each'><section>";
		html +="<div class='printDiv'><div id='circle'>"; 
		if(a==0){
			var ppp = create(lss, row, col, vt);
		}else if(a==1){
			vt = "vt";
			var ppp = create(lss, col, row, vt);
		}
		html = html + ppp;
		html+="</div></div>";
		html+="</section><button onclick='capture(this)'>도장 만들기</button>";
		html += "</div>";
		clearDojang()
		$("#mydojang").append(html);
		}
	
	for(let i = 0; i<3; i++){
		html += "<div class='each'><section>";
		html +="<div class='printDiv'><div id='square'>"; 
		if(a==0){
			var ppp = create(lss, row, col, vt);
		}else if(a==1){
			vt = "vt";
			var ppp = create(lss, col, row, vt);
		}
		html = html + ppp;
		html+="</div></div>";
		html+="</section><button onclick='capture(this)'>도장 만들기</button>";
		html += "</div>";
		clearDojang()
		$("#mydojang").append(html);
		}
str="";  
}	
	

function clearDojang(){
	$("#imgData").val("");
	$("#mydojang").children().remove();
}

function create(lss, row, col, vt, type){
	var html ="";
	var l=0; 
	
	for(var i=0; i<row; i++){ 
		
		html += "<div class='row row"+row+" "+vt+"'>"; 
		
		for(var j=0; j<col; j++){  
		
			if(lss[l]){
				
				
			html += "<div class='col col"+col+"'>"+lss[l]+"</div>";  
			
			
			
			l=l+1;
			}
		}
		html+="</div>";
	}
	return html;
}


/* ***********************************************모달*********************************************** */
$(".sign_yj").on("click",function(){
	$("#padDimA").removeClass("hidden");
	$("#padWrapperA").css("top","100px");
})

$("#padDimA").on("click",function(){
	$("#padWrapperA").css("top","-100%");
	$("#padDimA").addClass("hidden");
	signaturePad.clear();
})

$(".stamp_yj").on("click",function(){
	clearDojang();
	$("#padDimB").removeClass("hidden");
	$("#padWrapperB").css("top","100px");
})

$("#padDimB").on("click",function(){
	$("#padWrapperB").css("top","-150%");
	$("#padDimB").addClass("hidden");
	signaturePad.clear();
})




/* ***********************************************도장 이미지캡쳐*********************************************** */
function capture(e){
	sreenShot($(e).prev());
};

function sreenShot(target) {
	if (target != null && target.length > 0) {
		$(".printDiv").css("border","none");
		var t = target[0];
		html2canvas(t).then(function(canvas) {
		var myImg = canvas.toDataURL("image/png");
		myImg = myImg.replace("data:image/png;base64,", "");
			$.ajax({
				type : "POST",
				data : {"imgSrc" : myImg},
				dataType : "text",
				url : "ImgSaveTest",
				success : function(data) {
					console.log(data);
					$(".printDiv").css("border","2px solid black");
					location.href="setting";
				},
				error : function(a, b, c) {
					alert("error");
					$(".printDiv").css("border","2px solid black");
				}
			});
		});
	}
}