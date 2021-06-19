var wrapper = document.getElementById("signature-pad");
var clearButton = wrapper.querySelector("[data-action=clear]");
var changeColorButton = wrapper.querySelector("[data-action=change-color]");
var undoButton = wrapper.querySelector("[data-action=undo]");
var savePNGButton = wrapper.querySelector("[data-action=save-png]");
var saveJPGButton = wrapper.querySelector("[data-action=save-jpg]");
var saveSVGButton = wrapper.querySelector("[data-action=save-svg]");
var canvas = wrapper.querySelector("canvas");
var signaturePad = new SignaturePad(canvas, {
  // It's Necessary to use an opaque color when saving image as JPEG;
  // this option can be omitted if only saving as PNG or SVG
  //backgroundColor: 'rgb(255, 255, 255)'
});

// Adjust canvas coordinate space taking into account pixel ratio,
// to make it look crisp on mobile devices.
// This also causes canvas to be cleared.
function resizeCanvas() {
  // When zoomed out to less than 100%, for some very strange reason,
  // some browsers report devicePixelRatio as less than 1
  // and only part of the canvas is cleared then.
  var ratio =  Math.max(window.devicePixelRatio || 1, 1);

  // This part causes the canvas to be cleared
  canvas.width = canvas.offsetWidth * ratio;
  canvas.height = canvas.offsetHeight * ratio;
  canvas.getContext("2d").scale(ratio, ratio);

  // This library does not listen for canvas changes, so after the canvas is automatically
  // cleared by the browser, SignaturePad#isEmpty might still return false, even though the
  // canvas looks empty, because the internal data of this library wasn't cleared. To make sure
  // that the state of this library is consistent with visual state of the canvas, you
  // have to clear it manually.
  signaturePad.clear();
}

// On mobile devices it might make more sense to listen to orientation change,
// rather than window resize events.
window.onresize = resizeCanvas;
resizeCanvas();

function download(dataURL, filename) {
  if (navigator.userAgent.indexOf("Safari") > -1 && navigator.userAgent.indexOf("Chrome") === -1) {
    window.open(dataURL);
  } else {
    var blob = dataURLToBlob(dataURL);
    var url = window.URL.createObjectURL(blob);

    var a = document.createElement("a");
    a.style = "display: none";
    a.href = url;
    a.download = filename;

    document.body.appendChild(a);
    a.click();

    window.URL.revokeObjectURL(url);
  }
}

// One could simply use Canvas#toBlob method instead, but it's just to show
// that it can be done using result of SignaturePad#toDataURL.
function dataURLToBlob(dataURL) {
  // Code taken from https://github.com/ebidel/filer.js
  var parts = dataURL.split(';base64,');
  var contentType = parts[0].split(":")[1];
  var raw = window.atob(parts[1]);
  var rawLength = raw.length;
  var uInt8Array = new Uint8Array(rawLength);

  for (var i = 0; i < rawLength; ++i) {
    uInt8Array[i] = raw.charCodeAt(i);
  }

  return new Blob([uInt8Array], { type: contentType });
}

clearButton.addEventListener("click", function (event) {
  signaturePad.clear();
});

undoButton.addEventListener("click", function (event) {
  var data = signaturePad.toData();

  if (data) {
    data.pop(); // remove the last dot or line
    signaturePad.fromData(data);
  }
});

savePNGButton.addEventListener("click", function (event) {
  if (signaturePad.isEmpty()) {
    alert("Please provide a signature first.");
  } else {
    var dataURL = signaturePad.toDataURL();
    download(dataURL, "signature.png");
  }
});

var _gaq = _gaq || [];
_gaq.push([ '_setAccount', 'UA-39365077-1' ]);
_gaq.push([ '_trackPageview' ]);

(function() {
	var ga = document.createElement('script');
	ga.type = 'text/javascript';
	ga.async = true;
	ga.src = ('https:' == document.location.protocol ? 'https://ssl'
			: 'http://www')
			+ '.google-analytics.com/ga.js';
	var s = document.getElementsByTagName('script')[0];
	s.parentNode.insertBefore(ga, s);
})();

//사인패드
function uploadCanvasToServer(){
document.getElementById('paint-layer').toBlob(function(blob){
    		datas.paintblob = blob
    	    getLoadData(url,datas,this.setTempStoreSuccess.bind(this))}.bind(this))
}


function getLoadData(url,datas,callback){
	const formdata = new FormData();
	formdata.enctype='multipart/form-data';
    formdata.method='post';
	
    Object.entries(datas).forEach((data)=>{
    	formdata.append(data[0],data[1]);
    })
   
    const xhr = new XMLHttpRequest();
    xhr.open("post", url, true);
	xhr.onreadystatechange = function() { // 폴백
		if (xhr.readyState == 4) {
			if (xhr.status == 200) { // 200은 잘넘어왔단 것이다.
				const data = JSON.parse(xhr.response);
				callback(data);
			} else {
				alert("요청오류 : " + xhr.status);
			}
		}
	}
	// post방식은 xhr객체에 데이터를 붙여서 전송
	xhr.send(formdata); 
}


var canvas = document.querySelector('canvas');
uploadCanvasToServer = function() {
	const id = document.getElementById("user").value;
	const imgBase64 = canvas.toDataURL('image/png','image/octet-stream');
	const decodImg = atob(imgBase64.split(',')[1]);

	let array = [];
	for (let i = 0; i < decodImg.length; i++) {
		array.push(decodImg.charCodeAt(i));
	}

	const file = new Blob([ new Uint8Array(array) ], {
		type : 'image/png'
	});
	const fileName = 'canvas_img_' + new Date().getMilliseconds()
			+ '.png';
	let formData = new FormData();
	formData.append('file', file, fileName);
	formData.append("id", id);
	$.ajax({
		type : 'post',
		url : 'signUpload',
		cache : false,
		data : formData,
		processData : false,
		contentType : false,
		success : function(data) {
			if (data == '1') {
				alert("업로드 성공!");
				location.href="setting";
			} else {
				alert("업로드 실패!");
			}
		}
	})
};
