<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style> /* css */
.header {
	background-image: none;
	background-color: #027dfc;
} /* 파일첨부(.file) */
.file {
	display: inline-block;
	margin-top: 8px;
	overflow: hidden;
}

.file .file-text {
	display: inline-block;
	padding: 6px 10px 8px 10px;
	border: 1px solid #c7c7c7;
	width: 179px;
	font-size: 14px;
	color: #8a8a8a;
	float: left;
}

.file .file-text:FOCUS {
	border-color: #54c4e5;
	outline: 0;
	-webkit-box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.075), 0px 0px 8px
		rgba(102, 175, 233, 0.6);
	box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.075), 0px 0px 8px
		rgba(102, 175, 233, 0.6);
}

.file .file-btn {
	margin-left: 2px;
	padding: 6px 8px 4px 8px;
	height: 20px;
	line-height: 20px;
	font-size: 12px;
	font-weight: bold;
	background-color: #fff;
	border: 1px solid #989898;
	color: #989898;
	cursor: pointer;
	float: left;
}

.file .file-btn:HOVER {
	background-color: #edfbff;
	border: 1px solid #009bc8;
	color: #009bc8;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Daum에디터 - 파일 첨부</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<!-- 다음오픈에디터 라이브러리 -->
<link rel="stylesheet" href="/resources/daumeditor/css/popup2.css" type="text/css"
	charset="utf-8" />
<script src="/resources/daumeditor/js/popup.js" type="text/javascript"
	charset="utf-8"></script>
<script type=text/javascript src="/resources/js/jquery.min.js"></script>


<script>

	//잘못된 경로로 접근할 때 호출되는 함수
	function initUploader() {
		var _opener = PopupUtil.getOpener();
		if (!_opener) {
			alert('잘못된 경로로 접근하셨습니다.');
			return;
		}

		var _attacher = getAttacher('file', _opener);
		registerAction(_attacher);
	}
	
</script>


</head>

<body onload="initUploader();">

	<div class="wrapper">
		<div class="header">
			<h1>파일 첨부</h1>
		</div>
		<div class="body">
			<dl class="alert">
				<dt>5MB이하만 가능합니다.</dt>
				<dd>
					<form id=daumOpenEditorForm encType=multipart/form-data method=post
						action="">
						<!-- 파일첨부 -->
						<div class=file>
							<input disabled class=file-text id="fname"> <label class=file-btn
								for=uploadInputBox style="height: 33px">파일첨부</label> <input id=uploadInputBox
								style="display: none" type=file name=Filedata>
							<!-- 버튼대체용(안보임) -->
						</div>
						<!-- //파일첨부 -->
					</form>
				</dd>
			</dl>
		</div>
		<div class="footer" style="margin: 0px;padding: 0px;">
			<p>
				<a href="#" onclick="closeWindow();" title="닫기" class="close">닫기</a>
			</p>
			<ul>
				<!--onclick="done();"  -->
				<li class="submit"><a href="#" title="등록" class="btnlink"
					id="regBtn">등록</a></li>
				<li class="cancel"><a href="#" onclick="closeWindow();"
					title="취소" class="btnlink">취소</a></li>
			</ul>
		</div>
	</div>
		<!-- Small modal 시작 -->
	<div style="top: 32%" id="smallModal"
		class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<h4 style="text-align: center;" id="modalText">이미지파일은<br />사진첨부 기능을 이용해주세요</h4>
					<div style="text-align: right; margin-top: 20px;">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<!-- Small modal 끝 -->
	<script src="/resources/js/jquery.form.js"></script>
	<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script><!-- Bootstrap -->
	<script>
$(document).ready(function(){
	
	$('#uploadInputBox').on('change',function(e){
		var inputObj = $(this).prev().prev();
		var fileLocation = $(this).val();
		inputObj.val(fileLocation.replace('C:\\fakepath\\',''));
	});
	
	// 첨부한 파일을 에디터에 적용시키는 함수
	function done(fileInfo) {
		// fileInfo는 Ajax 요청 후 리턴하는 JSON형태의 데이터를 담을 객체
		if (typeof(execAttach) == 'undefined') {
			return; 
			} 
		var _mockdata = { 
				'attachurl': fileInfo.attachurl, 
				'filemime': fileInfo.filemime,
				'filename': fileInfo.filename,
				'filesize': fileInfo.filesize 
				}; 
		execAttach(_mockdata); // 다음오픈에디터에 붙이기
		closeWindow(); // 파일 팝업 종료 
	} 
		
	// 확장자 체크 (서버단에서도 검사함)
	function validation(fileName) {
		var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1; // .뒤부터 확장자
		var fileNameExtension = fileName.toLowerCase().substring(
				fileNameExtensionIndex, fileName.length); // 확장자 자르기
		if (((fileNameExtension === 'jpg') || (fileNameExtension === 'gif')
				|| (fileNameExtension === 'png') || (fileNameExtension === 'bmp'))) {
			$('#smallModal').modal();
			return true;
		} else {
			return false;
		}
	};

	//등록버튼 클릭 이벤트
	$('#regBtn').on('click',function(e){
		e.preventDefault();
		var fileName = $('#fname').val();
		$('#daumOpenEditorForm').ajaxSubmit({
				type:'POST',
				url:'/up/editorfile',
				dataType:'JSON',
				beforeSubmit: function(){ 
					if(validation(fileName)) { 
						return false;
					}
				},
				success:function(fileData){
					done(fileData);
				}
				
			});
	});
	
	
});

</script>
</body>
</html>
