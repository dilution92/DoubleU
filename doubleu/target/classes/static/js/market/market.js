/**
 * 
 */


	//-----------사진미리보기------------------//
	function previewImage(targetObj, View_area) {
		var preview = document.getElementById(View_area); //div id

			var files= targetObj.files;
			
			console.log("files.length:"+files.length);//한 번 들어갈 때 갯수
			
			var ele = document.getElementById('View_area');
			var eleCount = ele.childElementCount;		
			console.log("eleCount:"+eleCount);//총 갯수
			
			if(files.length<6 && files.length+eleCount<6){
		
			for ( var i = 0; i < files.length; i++) {
				var file = files[i];
				var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
				if (!file.type.match(imageType))
					continue;
				var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
				if (prevImg) {
					preview.removeChild(prevImg);
				}
				var img = document.createElement("img"); 
				img.id = "prev_"+ [i];
				img.classList.add("obj");
				img.file = file;
				img.style.width = '100px'; 
				img.style.height = '100px';
				preview.appendChild(img);
				if (window.FileReader) { // FireFox, Chrome, Opera 확인.
					var reader = new FileReader();
					reader.onloadend = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
						};
					})(img);
					reader.readAsDataURL(file);
					console.log(files[i]);
				} else { // safari is not supported FileReader
					//alert('not supported FileReader');
					if (!document.getElementById("sfr_preview_error_"
							+ View_area)) {
						var info = document.createElement("p");
						info.id = "sfr_preview_error_" + View_area;
						info.innerHTML = "not supported FileReader";
						preview.insertBefore(info, null);
					}
				}
}
						console.log("eleCount:"+eleCount);//총 갯수
						if(eleCount>5) return;
			}
			else $('#PhotoAlertModal').modal("show");
		}

//------숫자 천단위 쉼표----------//
	function numberWithCommas(x) {
		  x = x.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
		  x = x.replace(/,/g,'');          // ,값 공백처리
		  $("#marketPrice").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ",")); // 정규식을 이용해서 3자리 마다 , 추가 
		}
		
		
//-----------무료나눔 버튼클릭 시 disabled 및 모달창띄우기----//
 $(function() {
    $("#btnFree").click(function() { 
		
		if($("#marketPrice").is(":disabled")){
			$('#FreeText').html("아쉽네요😢");
			$('#marketPrice').attr("disabled", false); 
		}
		else{
			
		$('#marketPrice').val("0");
		$('#marketPrice').attr("disabled", true); 
		$('#FreeText').html("무료나눔을 하는 당신, 멋져요👍");
	
		}
});
})		
			

//----------계좌번호  숫자만 입력 -----------------//
function accountCheck(x) {
  x = x.replace(/[^0-9]/g,'');   
		  x = x.replace(/,/g,'');         
		  $("#marketAccount").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, "")); // 공백처리


		}
//---------계좌번호 길이체크하고 17이상이면 자르기---------------//
	  $(document).ready(function () {
        $('.js-sms-content').keyup(function(){
            cut_5(this);
        });

        
    });

    function getTextLength(str) {
        var len = 0;
        for (var i = 0; i < str.length; i++) {
            if (escape(str.charAt(i)).length == 6) {
                len++;
            }
            len++;
        }
        return len;
    }

    function cut_5(obj){
        var text = $(obj).val();
        var leng = text.length;
        while(getTextLength(text) > 17){
            leng--;
            text = text.substring(0, leng);
        }
        $(obj).val(text);
    }

