$("#cball").on('click', function(){
    cl =document.getElementsByName("cl");
    if($("#cball").is(":checked")){
        for(i=0; i<cl.length; i++){
            cl[i].checked=true;
        }
    }else{
        for(i=0; i<cl.length; i++){
            cl[i].checked=false;
        }
    }
})


function goSend(){
    if(xx){
        alert("선택된 대상이 없습니다.");
    }
    sendfrm.ation="#";
    sendfrm.method="post";
    sendfrm.submit();
    aaa. Modal.prototype.hideModal();
     this.$element.on('click.dismiss.bs.modal', '[data-dismiss="modal"]', $.proxy(this.hide, this))
}


$(document).on("click",".fa-times",function(){
    var check =$(this).parent().prev().attr("data-code");
    for(var i=0; i<arr.length; i++){

        if(arr[i]==check){
            arr.splice(i,1);
            // alert($(this).parent().parent().attr("id"));
            $(this).parent().parent().remove()
        }
    }
})

var arrGrade = new Array();
var arrNames = new Array();
var arr = new Array();

var aalist = document.getElementsByName("cl");
$(".select_this").on('click', function(){
	
    var a =$(this).attr("data-dda");
    var check =$(this).attr("data-code");

    if(arr.length>0){
        //alert(arr.length);
        
        for(var i=0; i<arr.length; i++){
            if(arr[i]==check){
                alert("이미 추가된 사람입니다.");
                return;
            }
        }         
        arr.push(check);
        $("#checked_list").append("<li id='dd'> <span class='sdev'>영</span><span class='sgrade'>부</span><span data-code='"+check+"' class='sname'>"+a+"</span><span><i class='fas fa-times'></i></span></li>");
        return

    }else{
        arr.push(check);
        $("#checked_list").append("<li> <span class='sdev'>영</span><span class='sgrade'>부</span><span data-code='"+check+"' class='sname'>"+a+"</span><span><i class='fas fa-times'></i></span></li>");
    }
})

$("#people_icon").on('click',function(){
    $("#sideup").css("right", "0px");
})

$("#orgt_close").on('click',function(){
    $("#sideup").css("right", "-100%");
})

/*var aalist =document.getElementsByName("cl");
$(".select_this").on('click', function(){
     var a =$(this).attr("data-dda");
  
         $("#checked_list").append("<li id='sman'><span class='a' data-key=''>"+a+"</span><i class='fas fa-times'></i></li>");
   
})*/

/*$(".yjjsl").on("click",function (){
   var department =$(this).attr("name");
     $.ajax({
         data:{department_name: department},
         url:"/getcrew",
         success : function(user){
    	 console.log(user);
            var html ="";
                for(var i=0; i<user.length; i++) {
                    html += "<div id='aa_" + user[i].department_code + "' className='panel-collapse collapse in' role='tabpanel' aria-labelledby='headingOne'>";
                    html += "<div className='panel-body orgt_pannel'> <ul id='selected_list'>";
                    html += "<li className='elect_this' data-code='a' data-dda='" + user[i].name + "'>"+user[i].name+"<span>"+user[i].grade+"</span></li>";
                    html += "</ul></div></div>";
                }
                alert(html);
            $("#crew_body").html("");
            $("#crew_body").append(html);
         }
     })
})*/
