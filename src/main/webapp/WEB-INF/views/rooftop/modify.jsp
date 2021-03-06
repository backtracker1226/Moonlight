<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>
<%-- <%@ include file="../include/script.jsp" %> --%>
<%-- <%@ include file="../include/banner.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
#class_checkbox {
    background-color: white;
}
#class_checkbox.checked {
	
    background-color: #75c5cf;
}
#class_checkbox.checked label i{
	color: #fff;
}

#ch_fire {
    background-color: white;
}
#ch_fire.checked {
	
    background-color: #75c5cf;
}
#ch_fire.checked label i{
	color: #fff;
}

#ch_microphone {
    background-color: white;
}
#ch_microphone.checked {
	
    background-color: #75c5cf;
}
#ch_microphone.checked label i{
	color: #fff;
}

#ch_wheelchair {
    background-color: white;
}
#ch_wheelchair.checked {
	
    background-color: #75c5cf;
}
#ch_wheelchair.checked label i{
	color: #fff;
}

#ch_car {
    background-color: white;
}
#ch_car.checked {
	
    background-color: #75c5cf;
}
#ch_car.checked label i{
	color: #fff;
}

#ch_animal {
    background-color: white;
}
#ch_animal.checked {
	
    background-color: #75c5cf;
}
#ch_animal.checked label i{
	color: #fff;
}

.mailbox-attachments li {
    float: left;
    width: 200px;
    border: 1px solid #eee;
    margin-bottom: 10px;
    margin-right: 10px;
}

.mailbox-attachment-icon.has-img {
    padding: 0;
}

.mailbox-attachment-icon {
    text-align: center;
    font-size: 65px;
    color: #666;
    padding: 20px 10px;
}


.mailbox-attachment-icon, .mailbox-attachment-info, .mailbox-attachment-size {
    display: block;
}

.mailbox-attachment-icon.has-img > img {
    max-width: 100%;
    height: auto;
}

.mailbox-attachments{
    list-style: none;
    margin: 0;
    padding: 0;
}

.fa-remove:before, .fa-close:before, .fa-times:before {
    content: "\f00d";
}

.map_wrap {position:relative;width:100%;height:350px;}
.title {font-weight:bold;display:block;}
.hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
#centerAddr {display:block;margin-top:2px;font-weight: normal;}
.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}

</style>
<!-- Contact form -->

  <div class="container">
    
    <section id="contact-form" class="mt50" >
      <div class="col-sm-12 ">
        <h1 class="lined-heading"><span>옥상 정보 입력</span></h1>
        
        <h2 style="border-bottom-color: #75c5cf; border-bottom-width: 3px; border-bottom-style: solid;"><p>옥상 정보를 입력해 주세요.</p></h2>        

        <div id="message"></div>
        <!-- Error message display -->
        <form class="clearfix mt50" role="form" method="post" name="contactform" id="contactform">
        	
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="rtname" accesskey="U"><h3><span class="required">*</span>옥상명</h3></label>
                <input name="rtname" type="text" id="rtname" class="form-control" value="${rtvo.rtname}"/>                
              </div>
            </div>
            
            <div class="col-md-6">
              <div class="form-group">
                <label for="rtemail" accesskey="E"><h3><span class="required">*</span>E-mail</h3></label>
                <input name="rtemail" type="text" id="rtemail" value="${rtvo.rtemail}" class="form-control"/>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="rtintroduction" accesskey="C"><h3><span class="required">*</span> 옥상 소개 </h3></label>
            <textarea name="rtintroduction" rows="10" id="rtintroduction" class="form-control">${rtvo.rtintroduction}</textarea>
          </div>
          
          <div class="form-group" >
          
            <label for="rthashtag" ><h3><span class="required">*</span> 옥상 태그 </h3></label>
            <!-- <label><span class="required">(최대 5개까지 입력가능)</span></label> -->
            <input name="rthashtag" type="text" maxlength="10" id="rthashtag" value="" 
            class="form-control"/>
            <div style="float: right;">
            	<button id="tagBtn" class="btn  btn-lg btn-primary">추가</button>
            </div>
            <div id=tagPlus class="form-control" style="width: 93.9%; height: 46px">
            </div>
            
            
          
          </div>
          <div class="form-group">
            <label><h3><span class="required">*</span>휴대폰 번호</h3></label>		  
            <input name="rtphonenumber" type="text" id="rtphonenumber" value="${rtvo.rtphonenumber}" class="form-control"/>
          </div>
          <%-- <div class="form-group">
            <label><h3><span class="required">*</span>주소(위치)</h3></label>		  
            <input name="rtaddress" type="text" id="rtaddress" value="${rtvo.rtaddress}" class="form-control"/>
          </div> --%>
          <div class="form-group">
            <label><h3><span class="required">*</span>주소(위치)</h3></label>
            
            <div>		  
            	<input name="rtaddress" type="text" id="rtaddress" value="${rtvo.rtaddress}" class="form-control" 
            	style="display:block; height: 46px; background-color: white;" readonly="readonly" placeholder="검색 버튼을 눌러주세요."/>
            	<input type="hidden" name="rtlat" id="lat" value="${rtvo.rtlat}">
            	<input type="hidden" name="rtlng" id="lng" value="${rtvo.rtlng}">
            	            	
            	<button type="button" id="modalBtn" class="btn btn-primary" 
            	data-toggle="modal" data-target="#myModal" style="float: right; height: 46px;">주소 검색</button>
 
            </div>
                 
          </div>
          
          <div class="form-group">
            <label><h3><span class="required">*</span>이미지</h3></label>		
            <label><span class="required">(최대 10장까지)</span></label>  
            <div id="div1" class="form-control" style="display: block; height: 300px;">
            <ul class="mailbox-attachments clearfix uploadedList">
            </ul>
            </div>
            
            
           <div class="btn_box" style="float: right;">
			<label class="btn  btn-lg btn-primary" for="img">
			<div>파일첨부</div>
			<input multiple="multiple" type="file" class="_fileRel" name="files" id="img" style="display:none;"
			 _single="true" accept="image/*">
			</label>
		
		   </div>
          </div>    
                 
          <div class="form-group">
            <label><h3><span class="required">*</span>옥상 이용가격</h3></label>		  
            <input name="price" type="text" id="price" value="${rtvo.price}" class="form-control"/>
          </div>
          
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="minpeople" ><h3><span class="required">*</span>최소 이용 인원</h3></label>
                <input name="minpeople" type="text" id="minpeople" class="form-control" value="${rtvo.minpeople}"/>
                
              </div>
            </div>
            
            <div class="col-md-6">
              <div class="form-group">
                <label for="maxpeople"><h3><span class="required">*</span>최대 이용 인원</h3></label>
                <input name="maxpeople" type="text" id="maxpeople" value="${rtvo.maxpeople}" class="form-control"/>
              
              </div>
            </div>
          </div>
          <div class="form-group">
                <label for="rtnotes" accesskey="U"><h3><span class="required">*</span>옥상 이용시 주의사항</h3></label>
                <textarea name="rtnotes" rows="10" id="rtnotes" class="form-control">${rtvo.rtnotes}</textarea>               
              </div>
            
          <div class="form-group">
            <label for="rtpurpose" accesskey="S"><h3><span class="required">*</span>옥상 용도 설정</h3></label>
            <select name="rtpurpose" id="rtpurpose" class="form-control">${rtvo.rtpurpose}
              <option value="partyroom" <c:out value="${rtvo.rtpurpose=='partyroom'?'selected':'' }"/>>파티룸</option>
              <option value="barbecu" <c:out value="${rtvo.rtpurpose=='barbecu'?'selected':'' }"/>>바베큐파티</option>
              <option value="culture" <c:out value="${rtvo.rtpurpose=='culture'?'selected':'' }"/>>문화공간</option>
            </select>
          </div>
          
          <div class="form-group">
          <label><h3><span class="required">*</span>옵션 선택</h3></label>
          <h1 class="lined-heading"></h1>
            <div class="facility_wrap">
				
		<div class="row">
          <div class="col-xs-4"><h5><span>컴퓨터, 노트북 제공</span></h5>
            <div class="box-icon">
              <input type="checkbox" name="options" id="pclap" value="pclap" class="input_class_checkbox"
              style="display: none; float: left">
              </div>
              </div>  
              
              <div class="col-xs-4"><h5><span>소화기 상비</span></h5>
            <div class="box-icon">
              <input type="checkbox" name="options" id="fire-extinguisher" value="fire-extinguisher" class="ch_fire" 
              style="display: none; float: left">
              </div>
              </div> 
              
              <div class="col-xs-4"><h5><span>마이크 제공</span></h5>
            <div class="box-icon">
              <input type="checkbox" name="options" id="microphone" value="microphone" class="ch_microphone"
              style="display: none; float: left">
              </div>
              </div>
                   
          </div>
          
          <div class="row">
          <div class="col-xs-4"><h5><span>휠체어 대여 가능</span></h5>
            <div class="box-icon">
              <input type="checkbox" name="options" id="wheelchair" value="wheelchair" class="ch_wheelchair"
              style="display: none; float: left">
              </div>
              </div>  
              
              <div class="col-xs-4"><h5><span>주차장 제공</span></h5>
            <div class="box-icon">
              <input type="checkbox" name="options" id="parking" value="parking" class="ch_car" 
              style="display: none; float: left">
              </div>
              </div> 
              
              <div class="col-xs-4"><h5><span>반려동물 동반가능</span></h5>
            <div class="box-icon">
              <input type="checkbox" name="options" id="animal" value="animal" class="ch_animal"
              style="display: none; float: left">
              </div>
              </div>
                   
          </div>
                    
        </div>
					
				</div>
				
			<input type="hidden" name="rtid" value="${rtvo.rtid}">
			<input type="hidden" name="page" value="${cri.page}">
			<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
			<input type="hidden" name="searchType" value="${cri.searchType}">
			<input type="hidden" name="keyword" value="${cri.keyword}">
         
          <button id="updateBtn" type="submit" class="btn  btn-lg btn-primary" style="float: right; ">수정하기</button>
          <button type="submit" id="cancleBtn" class="btn  btn-lg btn-danger" style="float:left">취소</button>
         
        </form>
      </div>
    </section>
    
    
    <div class="filebtn"></div>
   		<!-- <button type="button" class="fbtn">버튼</button> -->
    </div>  
    
    <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document" style="top: 20%;">
    <div class="modal-content">
      <div class="modal-header" style="background-color: #75c5cf; border-top-left-radius: 5px; border-top-right-radius: 5px;">
        <h2 class="modal-title" id="exampleModalLabel" style="color: white;">주소검색</h2>
              
      </div>
      <div class = "modal-header2">
      <input name="rtaddress2" type="text" id="rtaddress2" value="" class="form-control" 
      style="display: inline-block; height: 46px; background-color: white;" readonly="readonly" placeholder="지도를 클릭하면 주소가 들어갑니다."/>
      <!-- <button id="addrSearchBtn" type="button" class="btn btn-primary" style="height: 46px;">주소 검색</button> -->
      </div>
      <div class="modal-body">
        <div class="map_wrap">
    		<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    		
    		<div class="hAddr">
        		<span class="title">지도중심기준 행정동 주소정보</span>
        		<span id="centerAddr"></span>
    		</div>
			</div>
      </div>
      <div class="modal-footer" style="text-align: center;">
        <button type="button" class="btn btn-danger" data-dismiss="modal" style="width: 85.64px;">닫기</button>
        <button id="addAddressBtn" type="button" class="btn btn-primary">주소 등록</button>
      </div>
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" style="position: absolute; top: 23px; right: 15px;">X</span>
      </button>
    </div>
  </div>
</div>  

<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<!-- 핸들바 탬플릿 더 좋게 바꾸고 싶음 -->
<script id="template" type="text/x-handlebars-template">


<li>
<span class="mailbox-attachment-icon has-img">
	<img src="{{imgsrc}}" alt="Attachment" name="rtimg"/>
</span>
<div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" class="btn btn-danger btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
</div>
</li>
         
</script>    

<script>
$(document).ready(function(){
	
	var rtid = ${rtvo.rtid};
	//var block;
	var formObj = $("#contactform");
	//var formObj = $("form[role='form']");
	//var rtaddress = ${rtvo.rtaddress};
	//console.log($("#rtaddress").val());
	//console.log(${rtvo});
	var template = Handlebars.compile($("#template").html());
	//var index = 0;
	//console.log(rtaddress);
	/* $(".fbtn").on("click", function(e){
		
		checkboxArr();
		
	}); */
	
	 $(".uploadedList").on("dragenter dragover", function(event){
		event.preventDefault();
	});

	$(".uploadedList").on("drop", function(event){
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		
		var file = files[0];

		var formData = new FormData();
		
		formData.append("file", file);	
		//console.log(file.type);
		
		//파일이 있는지 없는지 검사
		if(file != null){
			if(file.type=='image/jpeg'||file.type=='image/png'||file.type=='image/gif'||file.type=='image/jpg'){//파일 타입을 검사
				if($("img[name='rtimg']").length < 10){//파일은 10개까지만 넣을 수 있게 한정
					$.ajax({
						  url: '/uploadAjax',
						  data: formData,
						  dataType:'text',
						  processData: false,
						  contentType: false,
						  type: 'POST',
						  success: function(data){
							  
							  var fileInfo = getFileInfo(data);
							  
							  var html = template(fileInfo);
							  
							  $(".uploadedList").append(html);
						  }
						});	
				}else{
					event.stopPropagation();
					//alert("이미지는 10개를 넘게 넣을 수 없습니다.");
					swal(
	  				'최대 10개까지 등록할 수 있습니다',
	  				'',
	  				'error'
					)
				}
			}else{
				event.stopPropagation();
				//alert("이미지 파일만 등록해 주세요.");
				swal(
	  				'이미지 파일만 등록해 주세요',
	  				'',
	  				'error'
				)
			}
		}
	});
		
	//옵션 체크박스 눌렀을 시 이벤트
	$("#img").on("change", function(event){
		
		event.preventDefault();
		
		console.log("change111");
		
		var clicked = event.target;
		var file = clicked.files[0];

		var formData = new FormData();
		
		console.log(file.type);
		
		formData.append("file", file);
		if(file != null){//파일이 있는지 확인
			if(file.type=='image/jpeg'||file.type=='image/png'||file.type=='image/gif'||file.type=='image/jpg'){//파일 타입 확인
				if($("img[name='rtimg']").length < 10){		
					$.ajax({
						  url: '/uploadAjax',
						  data: formData,
						  dataType:'text',
						  processData: false,
						  contentType: false,
						  type: 'POST',
						  success:  function(data){
							  
							  var fileInfo = getFileInfo(data);
							  
							  var html = template(fileInfo);
							  
							  $(".uploadedList").append(html);
							  
						  }
					});	
				}else{
					event.stopPropagation();
					//alert("이미지는 10개를 넘게 넣을 수 없습니다.");
					swal(
	  				'최대 10개까지 등록할 수 있습니다',
	  				'',
	  				'error'
					)
				}
			}else{
				event.stopPropagation();
				//alert("이미지 파일만 등록해 주세요.");
				swal(
	  				'이미지 파일만 등록해 주세요',
	  				'',
	  				'error'
				)
			}
		}
	});
	
	$(".uploadedList").on("click", ".delbtn", function(event){//이미지 템플릿에서 삭제버튼 눌렀을시 이벤트
		event.preventDefault();
		
		var that = $(this);
		 
		$.ajax({
			url: "/deleteFile",
			type: "post",
			data: {fileName:$(this).attr("href")},
			dataType: "text",
			success:function(result){
				if(result == 'deleted'){
					that.parents("li").remove();
				}
			}
		}); 
	});
	
	
	/* $("#div1").on("click", "i", function(event){
		
		 var that = $(this);
	
		 console.log("div1 del");
		 console.log(that.parent("div"));
	   $.ajax({
		   url:"/deleteFile",
		   type:"post",
		   data: {fileName:$(this).attr("data-src")},
		   dataType:"text",
		   success:function(result){
			   if(result == 'deleted'){
				   that.parent().parent("div").remove();//이거 누르면 폴더에는 삭제되는데 웹페이지 상에서 안 없어짐
				  
			   }
		   }
	   }); 
	   
	});*/
	
	$.getJSON("/rooftop/getImg/"+rtid, function(list){//이미지를 받아서 뿌려주기
		
		$(list).each(function(){
			
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			$(".uploadedList").append(html);
			
		});
		
	});
	
	$.getJSON("/rooftop/getHashtag/"+rtid, function(list){//해쉬태그 뿌려주기
			
		var block;
		
		$(list).each(function(index){
			console.log(list);
			console.log(list[index]);
			block = "<span style='color:black'>"+list[index]+"<input type='hidden' name='hashtags' value='"
			+list[index]+"' class='form-control'>"+"<a href='#' class='btn btn-danger btn-xs delbtn'>"+
			"<i class='fa fa-fw fa-remove'></i></a></span>";
			
			$("#tagPlus").append(block);
			
		});
		
	});
	
	$.getJSON("/rooftop/getOption/"+rtid, function(list){//옵션 체크박스 뿌려주기
		
		/* $(list).each(function(index){
			console.log(list);
			console.log(list[index]);
			
			
		}); */
		console.log(list);
		$(list).each(function(index){//각각의 옵션 체크박스를 만든다
			if($(".input_class_checkbox").val()==list[index]){
				$("#class_checkbox").attr('class', 'circle checked');
				$(".input_class_checkbox").attr("checked", true);
			}
		});
		
		$(list).each(function(index){
			
			if($(".ch_fire").val()==list[index]){
				$("#ch_fire").attr('class', 'circle checked');
				$(".ch_fire").attr("checked", true);
			}
		});
		
		$(list).each(function(index){
			
			if($(".ch_microphone").val()==list[index]){
				$("#ch_microphone").attr('class', 'circle checked');
				$(".ch_microphone").attr("checked", true);
			}
		});
		
		$(list).each(function(index){
			
			if($(".ch_wheelchair").val()==list[index]){
				$("#ch_wheelchair").attr('class', 'circle checked');
				$(".ch_wheelchair").attr("checked", true);
			}
		});
		
		$(list).each(function(index){
			
			if($(".ch_car").val()==list[index]){
				$("#ch_car").attr('class', 'circle checked');
				$(".ch_car").attr("checked", true);
			}
		});
		
		$(list).each(function(index){
			
			if($(".ch_animal").val()==list[index]){
				$("#ch_animal").attr('class', 'circle checked');
				$(".ch_animal").attr("checked", true);
			}
		});
		//checkboxArr();
		
	});
	/* $(".fbtn").on("click", function(e){
		
		checkboxArr();
		hashtagArr();
		
	});
	 */
	$("#tagBtn").on("click", function(e){//태그 추가 버튼 이벤트
		e.preventDefault();
		
		console.log("tagButton!");
		//var $this = $(this);
		var block = "";
		var rthashtag = $("#rthashtag");
		var hashtags = $("input[name='hashtags']");
		var tags = rthashtag.val().split("#");
		var tagval = tags.join('');
		//console.dir(hashtags);
		//console.log(rthashtag.html());
		//console.log(tags.join(''));
		
		console.log(hashtags.val());
		console.log(tags);
		console.log(tagval);
		if(tagval!=""){
			if(hashtags.length<5){//자동으로 #을 붙여줄 수는 없나?
				
				/* if(hashtags.val()!=null){ */
				/* block += "<span>"+rthashtag.val()+"<input type='hidden' name='hashtags' value='"
				+rthashtag.val()+"' class='form-control'></span> "; */
				block = "<span style='color:black'>"+"#"+tagval+"<input type='hidden' name='hashtags' value='#"
				+tagval+"' class='form-control'>"+"<a href='#' class='btn btn-danger btn-xs delbtn'>"+
				"<i class='fa fa-fw fa-remove'></i></a></span>"
				/* }else{
					
				} */
				
			//index++;
				
			}
			else{
				e.stopPropagation();
				//alert("해시태그는 5개를 넘게 입력할 수 없습니다.")
				swal(
		  				'태그는 최대 5개까지 넣을 수 있습니다',
		  				'',
		  				'error'
					)
			}
		}
			
		$("#tagPlus").append(block);
		/* console.dir(rthashtag);
		console.log(rthashtag.val());
		console.log(rthashtag.html()); */
		rthashtag.val("");
		
	});
	
	$("#tagPlus").on("click", ".delbtn", function(event){//태그의 삭제버튼 이벤트
		event.preventDefault();
		
		var that = $(this);
		 
		that.parents("span").remove();
				
			
		
	});
	
 
	$("#contactform").submit(function(event){//submit 이벤트
		event.preventDefault();
		
		var that = $(this);
		
		var str ="";
		$(".uploadedList .delbtn").each(function(index){
			 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
			 
		});

		that.append(str);
		checkboxArr();
		hashtagArr();
		
		formObj.attr("method", "post");
		formObj.attr("action", "/rooftop/modify");

		that.get(0).submit();
	});

	$("#cancleBtn").on("click", function(e){//취소 버튼 이벤트
		e.preventDefault();
		console.log(formObj);
		//formObj.attr("method", "get");
		//formObj.attr("action", "/rooftop/list");
		//formObj.submit();
		self.location = "/rooftop/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}";
		//formObj.submit();

	});
	
		/* formObj.submit(function(event){
		event.preventDefault();
		
		var that = $(this);
		
		var str ="";
		$(".uploadedList .delbtn").each(function(index){
			 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
		});
		
		that.append(str);
		checkboxArr();
		hashtagArr();
		
		console.log(str);
		
		that.get(0).submit();
	}); */
	
	function checkboxArr(){//옵션값을 배열에 저장하여 보냄
		
		var checkArr = [];
		//console.log($("input[name='options']:checked").find("#ch_animal"));
		console.log($("input[name='options']:checked").length);
		console.log($(this));
		$("input[name='options']:checked").each(function(i){
			//console.log($(this));
			checkArr.push($(this).val());
			console.log("111");
		});
		console.log(checkArr);
		$.ajax({
			
			url:"/uploadOption",
			type:"post",
			data:{options: checkArr},
			dataType:'text'
			
		});
				
	}
	
	function hashtagArr(){//해쉬태그를 배열에 저장하여 ajax로 보냄
		
		var tagArr = [];
		$("input[name='hashtags']").each(function(e){
			
			tagArr.push($(this).val());
		});
		console.log("태그함수임"+tagArr);
		$.ajax({
			
			url:"/uploadTags",
			type:"post",
			data:{hashtags:tagArr},
			dataType:'text'
			
		});
		
	}
	//채크박스를 만들어준다.
	$('.input_class_checkbox').each(function(){
	    $(this).hide().after('<div class="circle" id="class_checkbox" style="cursor: pointer;"><label for="PCLAP">'
	   + '<i id="pc" class="fa fa-desktop fa-lg" style="cursor: pointer;  vertical-align: middle;"></i></label></div>');

	});

	$('#class_checkbox').on('click', function(){
	    $(this).toggleClass('checked').prev().prop('checked',$(this).is('.checked'))
	});
	
	$('.ch_fire').each(function(){
	    $(this).hide().after('<div class="circle" id="ch_fire" style="cursor: pointer;"><label for="fire">'
	   + '<i id="fi" class="fa fa-fire-extinguisher fa-lg" style="cursor: pointer;  vertical-align: middle;"></i></label></div>');

	});

	$('#ch_fire').on('click', function(){
	    $(this).toggleClass('checked').prev().prop('checked',$(this).is('.checked'))
	});
	
	$('.ch_microphone').each(function(){
	    $(this).hide().after('<div class="circle" id="ch_microphone" style="cursor: pointer;"><label for="microphone">'
	   + '<i id="mc" class="fa  fa-microphone fa-lg" style="cursor: pointer;  vertical-align: middle;"></i></label></div>');

	});

	$('#ch_microphone').on('click', function(){
	    $(this).toggleClass('checked').prev().prop('checked',$(this).is('.checked'))
	});
	
	$('.ch_wheelchair').each(function(){
	    $(this).hide().after('<div class="circle" id="ch_wheelchair" style="cursor: pointer;"><label for="wheelchair">'
	   + '<i id="wc" class="fa fa-wheelchair fa-lg" style="cursor: pointer;  vertical-align: middle;"></i></label></div>');

	});

	$('#ch_wheelchair').on('click', function(){
	    $(this).toggleClass('checked').prev().prop('checked',$(this).is('.checked'))
	});
	
	$('.ch_car').each(function(){
	    $(this).hide().after('<div class="circle" id="ch_car" style="cursor: pointer;"><label for="parking">'
	   + '<i id="ca" class="fa fa-car fa-lg" style="cursor: pointer;  vertical-align: middle;"></i></label></div>');

	});

	$('#ch_car').on('click', function(){
	    $(this).toggleClass('checked').prev().prop('checked',$(this).is('.checked'))
	});
	
	$('.ch_animal').each(function(){
	    $(this).hide().after('<div class="circle" id="ch_animal" style="cursor: pointer;" value="animal"><label for="animal">'
	   + '<i id="ani" class="fa fa-paw fa-lg" style="cursor: pointer;  vertical-align: middle;"></i></label></div>');

	});

	$('#ch_animal').on('click', function(){
	    $(this).toggleClass('checked').prev().prop('checked',$(this).is('.checked'));
	});
	
});


</script>

<script>
	//지도 관련 스크립트
	var rtaddress = $("#rtaddress");
	var rtaddress2 = $("#rtaddress2");
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(37.494609, 127.027988), // 지도의 중심좌표
	        level: 1 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption);
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	    infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	
	// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	
	// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
	    searchDetailAddrFromCoords(mouseEvent.latLng, function(status, result) {
	        if (status === daum.maps.services.Status.OK) {
	            var detailAddr = !!result[0].roadAddress.name ? '<div>도로명주소 : ' + result[0].roadAddress.name + '</div>' : '';
	            detailAddr += '<div>지번 주소 : ' + result[0].jibunAddress.name + '</div>';
	            
	            var content = '<div class="bAddr">' +
	                          '<span class="title">법정동 주소정보</span>' + 
	                          detailAddr + 
	                       	  '</div>';
				
	            rtaddress2.val(result[0].jibunAddress.name);
	            
	            // 마커를 클릭한 위치에 표시합니다 
	            //$("#lat").val(mouseEvent.latLng.getLat());
				$("#lng").val(mouseEvent.latLng.getLng());
				$("#address").val(rtaddress2.val());
	            marker.setPosition(mouseEvent.latLng);
	            marker.setMap(map);
	            panTo(mouseEvent.latLng.getLat(), mouseEvent.latLng.getLng());
	
	            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	            infowindow.setContent(content);
	            infowindow.open(map, marker);
	        }   
	    });
	});
	
	//주소등록 버튼 눌렀을 때 이벤트.
	$("#addAddressBtn").on("click", function(e){
		
		e.preventDefault();
			
		rtaddress.val(rtaddress2.val());
		console.log(rtaddress.val());
	    $('#myModal').modal('hide')
	    
	});
	
	// 클릭만이 아니라 직접 주소를 쳐서 주소를 가져올 수도 있다.
	/* $("#addrSearchBtn").on("click", function(){
		geocoder.addr2coord(rtaddress2.val(), function(status, result) {
			
		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
	
		        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
				console.log(coords);
				$("#lat").val(result.addr[0].lat);
				$("#lng").val(result.addr[0].lng);
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });
	
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
		        });
		        infowindow.open(map, marker);
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		     }
		        
		    }); 
		
		
	}); */

	$('#myModal').on('shown.bs.modal', function () {

	   
		    map.relayout();
		    setMapCenter();
	});
	
	// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	daum.maps.event.addListener(map, 'idle', function() {
	    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	});
	
	function searchAddrFromCoords(coords, callback) {
	    // 좌표로 행정동 주소 정보를 요청합니다
	    geocoder.coord2addr(coords, callback);         
	}
	
	function searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2detailaddr(coords, callback);
	}
	
	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(status, result) {
	    if (status === daum.maps.services.Status.OK) {
	        var infoDiv = document.getElementById('centerAddr');
	        infoDiv.innerHTML = result[0].fullName;
	    }    
	}
	
	// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomIn() {
	    map.setLevel(map.getLevel() - 1);
	}

	// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomOut() {
	    map.setLevel(map.getLevel() + 1);
	}
	
	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({  
	        map: map, 
	        position: locPosition
	    }); 
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;

	    // 인포윈도우를 생성합니다
	    var infowindow = new daum.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    infowindow.open(map, marker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);      
	}
	
	function getMarker(locPosition){
		
		var marker = new daum.maps.Marker({
			position: locPosition
		});
		
		map.setCenter(locPosition);
	}
	
	function setMapCenter(){
		
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
		        
		        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		        navigator.geolocation.getCurrentPosition(function(position) {
		            
		            var lat = position.coords.latitude, // 위도
		                lon = position.coords.longitude; // 경도
		            
		            /* var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		                message = '<div style="padding:5px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
		            console.log(locPosition);
		            // 마커와 인포윈도우를 표시합니다
		            displayMarker(locPosition, message); */
		            var locPosition = new daum.maps.LatLng(lat, lon);
		            
		            getMarker(locPosition);
		            
		          });
		        
		    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		        
		        var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
		            message = 'geolocation을 사용할수 없어요..'
		            
		        displayMarker(locPosition, message);
		    }
	}
	
	function panTo(lat, lng) {
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new daum.maps.LatLng(lat, lng);
	    
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	    map.panTo(moveLatLon);            
	}
	
</script>
<%@include file="../include/footer.jsp" %>



