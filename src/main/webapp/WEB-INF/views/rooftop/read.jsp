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
</style>
<!-- Contact form -->
<form method="post" class="rtread">
         	<input type="hidden" name="rtid" value="${rtvo.rtid}">
			<input type="hidden" name="page" value="${cri.page}">
			<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
			<input type="hidden" name="searchType" value="${cri.searchType}">
			<input type="hidden" name="keyword" value="${cri.keyword}">
		</form>

  <div class="container">
    
    <section id="contact-form" class="mt50">
      <div class="col-sm-12 ">
        <h1 class="lined-heading"><span>옥상 정보 입력</span></h1>
        
        <h2 style="border-bottom-color: #75c5cf; border-bottom-width: 3px; border-bottom-style: solid;"><p>옥상 정보를 입력해 주세요.</p></h2>        

        <div id="message"></div>
        <!-- Error message display -->
        <div class="clearfix mt50">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="rtname" accesskey="U"><h3><span class="required">*</span>옥상명</h3></label>
                <input name="rtname" type="text" id="rtname" class="form-control" value="${rtvo.rtname}" readonly="readonly"/>                
              </div>
            </div>
            
            <div class="col-md-6">
              <div class="form-group">
                <label for="rtemail" accesskey="E"><h3><span class="required">*</span>E-mail</h3></label>
                <input name="rtemail" type="text" id="rtemail" value="${rtvo.rtemail}" class="form-control" readonly="readonly"/>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="rtintroduction" accesskey="C"><h3><span class="required">*</span> 옥상 소개 </h3></label>
            <textarea name="rtintroduction" rows="10" id="rtintroduction" class="form-control" readonly="readonly">${rtvo.rtintroduction}</textarea>
          </div>
          
          <div class="form-group" >
          
            <label for="rthashtag" ><h3><span class="required">*</span> 옥상 태그 </h3></label>
            <!-- <label><span class="required">(최대 5개까지 입력가능)</span></label> -->
            <!-- <input name="rthashtag" type="text" maxlength="10" id="rthashtag" value="" 
            class="form-control"/> -->
            <!-- <div style="float: right;">
            	<button id="tagBtn" class="btn  btn-lg btn-primary">추가</button>
            </div> -->
            <div id=tagPlus class="form-control">
            </div>
            
            
          
          </div>
          <div class="form-group">
            <label><h3><span class="required">*</span>휴대폰 번호</h3></label>		  
            <input name="rtphonenumber" type="text" id="rtphonenumber" value="${rtvo.rtphonenumber}" class="form-control" readonly="readonly"/>
          </div>
          <div class="form-group">
            <label><h3><span class="required">*</span>주소(위치)</h3></label>		  
            <input name="rtaddress" type="text" id="rtaddress" value="${rtvo.rtaddress}" class="form-control" readonly="readonly"/>
            <input type="hidden" name="rtlat" id="lat" value="${rtvo.rtlat}">
            	<input type="hidden" name="rtlng" id="lng" value="${rtvo.rtlng}">
          </div>
          
          <div class="form-group">
            <label><h3><span class="required">*</span>이미지</h3></label>		
            <!-- <label><span class="required">(최대 10장까지)</span></label> -->  
            <div id="div1" class="form-control" style="display: block; height: 300px;">
            <ul class="mailbox-attachments clearfix uploadedList">
            </ul>
            </div>
            
            
           <!-- <div class="btn_box" style="float: right;">
			<label class="btn  btn-lg btn-primary" for="img">
			<div>파일첨부</div>
			<input multiple="multiple" type="file" class="_fileRel" name="files" id="img" style="display:none;"
			 _single="true" accept="image/*">
			</label>
		
		   </div> -->
          </div>    
                 
          <div class="form-group">
            <label><h3><span class="required">*</span>옥상 이용가격</h3></label>		  
            <input name="price" type="text" id="price" value="${rtvo.price}" class="form-control" readonly="readonly"/>
          </div>
          
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="minpeople" ><h3><span class="required">*</span>최소 이용 인원</h3></label>
                <input name="minpeople" type="text" id="minpeople" class="form-control" value="${rtvo.minpeople}" readonly="readonly"/>
                
              </div>
            </div>
            
            <div class="col-md-6">
              <div class="form-group">
                <label for="maxpeople"><h3><span class="required">*</span>최대 이용 인원</h3></label>
                <input name="maxpeople" type="text" id="maxpeople" value="${rtvo.maxpeople}" class="form-control" readonly="readonly"/>
              
              </div>
            </div>
          </div>
          <div class="form-group">
                <label for="rtnotes" accesskey="U"><h3><span class="required">*</span>옥상 이용시 주의사항</h3></label>
                <textarea name="rtnotes" rows="10" id="rtnotes" class="form-control" readonly="readonly">${rtvo.rtnotes}</textarea>               
              </div>
            
          <div class="form-group">
            <label for="rtpurpose" accesskey="S"><h3><span class="required">*</span>옥상 용도 설정</h3></label>
            <select name="rtpurpose" id="rtpurpose" class="form-control" disabled="disabled">
            <!-- dom객체에서 disabled는 완전히 사라진다고 한다. 그래서 controller에 값을 전해 줄 수 없는데 hidden값으로 값을 전해주라고 한다. -->
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
              <div class="circle" id="class_checkbox" style="cursor: pointer;" value="pclap">
              <label for="pclap"><i id="pc" class="fa fa-desktop fa-lg" style="cursor: pointer;  vertical-align: middle;">
              </i></label>
              </div>
              </div>
              </div>  
              
              
              <div class="col-xs-4"><h5><span>소화기 상비</span></h5>
            <div class="box-icon">
              <input type="checkbox" name="options" id="fire-extinguisher" value="fire-extinguisher" class="ch_fire" 
              style="display: none; float: left">
              <div class="circle" id="ch_fire" style="cursor: pointer;"><label for="fire">
		   	  <i id="fi" class="fa fa-fire-extinguisher fa-lg" style="cursor: pointer;  vertical-align: middle;">
		   	  </i></label>
		   	  </div>
              </div>
              </div> 
              
              <div class="col-xs-4"><h5><span>마이크 제공</span></h5>
            <div class="box-icon">
              <input type="checkbox" name="options" id="microphone" value="microphone" class="ch_microphone"
              style="display: none; float: left">
              <div class="circle" id="ch_microphone" style="cursor: pointer;" ><label for="microphone">
		      <i id="mc" class="fa fa-microphone fa-lg" style="cursor: pointer;  vertical-align: middle;"></i></label></div>
              </div>
              </div>
                   
          </div>
          
          <div class="row">
          <div class="col-xs-4"><h5><span>휠체어 대여 가능</span></h5>
            <div class="box-icon">
              <input type="checkbox" name="options" id="wheelchair" value="wheelchair" class="ch_wheelchair"
              style="display: none; float: left">
              <div class="circle" id="ch_wheelchair" style="cursor: pointer;"><label for="wheelchair">
		      <i id="wc" class="fa fa-wheelchair fa-lg" style="cursor: pointer;  vertical-align: middle;"></i></label></div>
              </div>
              </div>  
              
              <div class="col-xs-4"><h5><span>주차장 제공</span></h5>
            <div class="box-icon">
              <input type="checkbox" name="options" id="parking" value="parking" class="ch_car" 
              style="display: none; float: left">
              <div class="circle" id="ch_car" style="cursor: pointer;"><label for="parking">
		      <i id="ca" class="fa fa-car fa-lg" style="cursor: pointer;  vertical-align: middle;"></i></label></div>
              </div>
              </div> 
              
              <div class="col-xs-4"><h5><span>반려동물 동반가능</span></h5>
            <div class="box-icon">
              <input type="checkbox" name="options" id="animal" value="animal" class="ch_animal"
              style="display: none; float: left">
              <div class="circle" id="ch_animal" style="cursor: pointer;"><label for="animal">
		      <i id="ani" class="fa fa-paw fa-lg" style="cursor: pointer;  vertical-align: middle;"></i></label></div>
              </div>
              </div>
                   
          </div>
                    
        </div>
					
				</div>
		
          <button type="submit" id="listBtn" class="btn  btn-lg btn-primary" style="float:left; ">목록</button>
          <button type="submit" id="modifyBtn" class="btn  btn-lg btn-primary" style="float:right;">수정</button>
          <button type="submit" id="removeBtn" class="btn  btn-lg btn-danger" style="float:right;margin-right: 5px;">삭제</button>
          <!-- <button id="registerForm" type="submit" class="btn  btn-lg btn-primary" style="float: right; ">옥상 등록하기</button> -->
        </div>
      </div>
    </section>
    
    
    <div class="filebtn"></div>
   		<!-- <button type="button" class="fbtn">버튼</button> -->
    </div>    

<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<!-- 핸들바 탬플릿 더 좋게 바꾸고 싶음 -->
<script id="template" type="text/x-handlebars-template">


<li data-src="{{fullName}}">
<span class="mailbox-attachment-icon has-img">
	<img src="{{imgsrc}}" alt="Attachment" name="rtimg"/>
</span>
<div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
</div>
</li>
         
</script>    

<script>
$(document).ready(function(){
	
	var rtid = ${rtvo.rtid};
	var block;
	var template = Handlebars.compile($("#template").html());
	//var index = 0;
	//console.log($("#rtaddress").val());
	
	var formObj = $(".rtread");
	
	console.log(formObj);
	
	$("#removeBtn").on("click",function(e){//글 삭제 버튼 이벤트
				
		var arr = [];
		var tagarr = [];
		var optionarr = [];
		
		
		$(".uploadedList li").each(function(index){//이미지를 배열에 저장
			arr.push($(this).attr("data-src"));			
		});
		
		$("input[name='hashtags']").each(function(e){//해쉬태그를 배열에 저장
			
			tagarr.push($(this).val());
		});
		
		$("input[name='options']:checked").each(function(i){	//옵션을 배열에 저장
						
			optionarr.push($(this).val());
			
		});
		
		console.log(arr);
		console.log(tagarr);
		console.log(optionarr);
		
		//console.log($("input[name='options']:checked").val());
		
		if(arr.length > 0){//배열의 길이가 0이 아닐때
			$.post("/deleteAllFiles", {files:arr}, function(){
			});
		}
		
		
		if(tagarr.length > 0){
			$.post("/deleteAllHashTags", {hashtags:tagarr}, function(){
			});
		}
		
		if(optionarr.length > 0){
			$.post("/deleteAllOptions", {options:optionarr}, function(){
			});
		}
		
		formObj.attr("method", "post");
		formObj.attr("action", "/rooftop/remove")
		formObj.submit();
	});

	
	$("#modifyBtn").on("click",function(e){//수정버튼 이벤트
		//e.preventDefault();
		formObj.attr("method", "get");
		formObj.attr("action", "/rooftop/modify")
		formObj.submit();
	});
	
	$("#listBtn").on("click",function(e){//리스트로 가는 버튼 이벤트
		//e.preventDefault();
		formObj.attr("method", "get");
		formObj.attr("action", "/rooftop/list")
		formObj.submit(); 
		/* self.location = "list"
			   + "${pageMaker.makeQuery(1)}"
			   + "&searchType="
			   + $("select option:selected").val()
			   + "&keyword="
			   + encodeURIComponent($("#keywordInput").val()); */
	});
	/* $(".fbtn").on("click", function(e){
		
		checkboxArr();
		hashtagArr();
		
	}); */
	function checkboxArr(){
		console.log("check start")
		var checkArr = [];
		$("input[name='options']:checked").each(function(i){
			
			checkArr.push($(this).val());
		});
		console.log(checkArr);
		$.ajax({
			
			url:"/uploadOption",
			type:"post",
			data:{options: checkArr},
			dataType:'text'
			
		});
				
	}
	function hashtagArr(){
		
		var tagArr = [];
		
		$("input[name='hashtags']").each(function(e){
			
			tagArr.push($(this).val());
		});
		console.log(tagArr);
		$.ajax({
			
			url:"/uploadTags",
			type:"post",
			data:{hashtags:tagArr},
			dataType:'text'
			
		});
		
	}
	$.getJSON("/rooftop/getImg/"+rtid, function(list){
		
		$(list).each(function(){
			
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			$(".uploadedList").append(html);
			
		});
		
	});
	
	$.getJSON("/rooftop/getHashtag/"+rtid, function(list){
				
		$(list).each(function(index){
			
			console.log(list);
			block = "<span style='color:black'>"+list[index]+"</span> "+"<input type='hidden' name='hashtags' value='"
			+list[index]+"' class='form-control'>";
			
			$("#tagPlus").append(block);
			
		});
		
	});
	
	$.getJSON("/rooftop/getOption/"+rtid, function(list){
		console.log(list);
		$(list).each(function(index){
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
		
		
		

		
		
	});

	
	
});


</script>


<%@include file="../include/footer.jsp" %>



