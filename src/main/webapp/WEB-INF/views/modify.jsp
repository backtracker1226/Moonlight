<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="include/header.jsp" %>
<style>
#miniNav, #miniNav a {
	color: #BDBDBD;
}

input[type="file"] {
	
}
</style>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">  -->

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/resources/daumeditor/css/editor.css"
	type="text/css" charset="utf-8" />

<section id="pricing">
	<div id="blog" class="container">
		<div class="row col-md-12 st-pricing">
		

			<div class="col-sm-12">
				<div class="st-pricing" style="box-shadow: 0px 0px 18px #ddd;">
					<div class="st-border"></div>
					<!-- <form method="post" id="regForm"> -->
					<form name="regForm" id="regForm"
						method="post" accept-charset="utf-8">
						<div class="form-group">
							
							<label>작성자</label> <input type="text" class="form-control"
								name="uname" value="${boardVO.uname}" readonly="readonly" style="background-color: #F6F6F6;">
						</div>
						<div class="form-group">
							
							<label>제목</label> <input type="text" class="form-control"
								name="title" value="${boardVO.title}">
						</div>
						<div class="form-group">
							
							<label>내용</label>
							<!-- <div id="editorDiv"></div> -->
							<%-- <jsp:include page="/WEB-INF/views/pds/data/editor_template.jsp"></jsp:include> --%>
							<%@include file="editor_template.jsp"%>
							<input type="hidden" id="fileNames" name="files"> <input
								type="hidden" name="bno" value="${boardVO.bno}">
						</div>

						<div class="st-border" style="margin-top: 15px"></div>


					</form>


					<a class="btn btn-send" id="regBtn">수정</a> <a id="cancelBtn"
						class="btn btn-send">취소</a>


				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div style="top: 30%" class="modal fade" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document" style="z-index: 9999;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close pull-right" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h5 class="modal-title" id="exampleModalLabel">자료 수정</h5>
				</div>
				<div class="modal-body">
					<h4 style="text-align: center;">정말 등록하시겠습니까?</h4>
					<h6 style="text-align: center;">(확인시 등록)</h6>

				</div>

				<div class="modal-footer">

					<button type="button" class="btn btn-primary" id="yesBtn">예</button>

					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="${files}" id="fileList">
	<!-- Modal끝 -->

	<!-- 파라미터 전송을위한 HiddenForm  -->
	<form method="get" id="hiddenForm">
		<input type="hidden" name="bno" value="${boardVO.bno}" /> 
		<input type="hidden" name="type" value="${cri.type}" /> 
		<input type="hidden" name="keyword" value="${cri.keyword}" /> 
		<input type="hidden" name="page" value="${cri.page}" /> 
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}" />  
	</form>
</section>


<script src="/resources/daumeditor/js/editor_loader.js"
	type="text/javascript" charset="utf-8"></script>

<script>
	var config = {
		txHost : '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
		txPath : '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
		txService : 'sample', /* 수정필요없음. */
		txProject : 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
		initializedId : "", /* 대부분의 경우에 빈문자열 */
		wrapper : "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
		form : 'regForm', /* 등록하기 위한 Form 이름 */
		txIconPath : "/resources/daumeditor/images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
		txDecoPath : "/resources/daumeditor/images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
		canvas : {
			styles : {
				color : "#123456", /* 기본 글자색 */
				fontFamily : "굴림", /* 기본 글자체 */
				fontSize : "10pt", /* 기본 글자크기 */
				backgroundColor : "#fff", /*기본 배경색 */
				lineHeight : "1.5", /*기본 줄간격 */
				padding : "8px" /* 위지윅 영역의 여백 */
			},
			showGuideArea : false
		},
		events : {
			preventUnload : false
		},
		sidebar : {
			attacher : {
				file : {
					features : {
						left : 250,
						top : 65,
						width : 400,
						height : 181,
						scrollbars : 0
					}, // 팝업창 사이즈
					popPageUrl : '/pds/data/file', // 팝업창 주소
					boxonly : true
				},
				image : {
					features : {
						left : 250,
						top : 65,
						width : 400,
						height : 214,
						scrollbars : 0
					}, //팝업창 사이즈 
					popPageUrl : '/image', //팝업창 주소
					wysiwygonly : true
				}
			},

			attachbox : {
				show : true,
				confirmForDeleteAll : true
			}
		},
	//size : {
	//contentWidth : 700
	///* 지정된 본문영역의 넓이가 있을 경우에 설정 */}
	};

	EditorJSLoader.ready(function(Editor) {
		editor = new Editor(config);

	});
	
	var content = '${boardVO.reviewcon}';
	var attachments = {};
	attachments['file'] = [];

	var files = $('#fileList').val();
	var filename = files.substring(1, files.length - 1);
	var fileNames = filename.split(',');
	Editor.modify({
		'content' : content
	});
	if (fileNames[0].length != 0) {
		for (var i = 0; i < fileNames.length; i++) {
			var fname = fileNames[i];
			$
					.ajax({
						type : 'GET',
						url : '/pds/data/modify/fileinfo?filename=' + fname,
						success : function(fileinfo) {
							attachments['file']
									.push({
										'attacher' : 'file',
										'data' : {
											'attachurl' : 'http://cfile297.uf.daum.net/attach/207C8C1B4AA4F5DC01A644',
											'filemime' : fileinfo.filemime,
											'filename' : fileinfo.filename,
											'filesize' : fileinfo.filesize
										}
									});
							Editor.modify({

								'attachments' : function() {
									var allattachments = [];
									for ( var i in attachments) {
										allattachments = allattachments
												.concat(attachments[i]);
									}
									return allattachments;
								}()
							});
						}
					});
		}
	}

	function saveContent() {
		Editor.save(); // 이 함수를 호출하여 글을 등록하면 된다.
	}

	// submit 전 다음에디터 validation체크 
	function validForm(editor) {
		var validator = new Trex.Validator();
		var content = editor.getContent();
		if (!validator.exists(content)) {
			alert('내용을 입력하세요');
			return false;
		}

		return true;
	};



	//validForm 함수가 true로 return된 후에 동작하는 함수
	function setForm(editor) {
		var i, input;
		var form = editor.getForm();
		var content = editor.getContent();
		// 본문 내용을 필드를 생성하여 값을 할당하는 부분
		var textarea = document.createElement('textarea');
		textarea.name = 'reviewcon';//name값 수정
		textarea.value = content;
		form.createField(textarea);
		return true;
	};
</script>
<script type="text/javascript">
	$(document).ready(function() {

		//등록버튼 click event.
		$('#regBtn').on('click', function(e) {
			e.preventDefault();
			$('#myModal').modal();
		});

		//모달창 내부 '예'버튼 클릭이벤트		
		$('#yesBtn').on('click', function(e) {
			e.preventDefault();
			var fileNames = [];
			console.log(fileNames.length);
			var files = Editor.getSidebar().getAttachments('file');
			for (var i = 0, len = files.length; i < len; i++) {
				if (files[i].deletedMark == false) {
					fileNames.push(files[i].data.filename);
				}
			}
			if (fileNames.length != 0) {
				$('#fileNames').val(fileNames);
			}
			
			saveContent();
		});
		
		//삭제 아이콘 클릭 이벤트
		$('#tx_attach_list').on('click','li dl dd a',function(e){
			e.preventDefault(); 
			e.stopPropagation(); 
			var fullname = $(this).parent().parent().eq(0).text().split('(')[0]; 
			var idx = fullname.lastIndexOf('.') + 1;
			var fileExt = fullname.substring(idx,fullname.length-1);
			console.log(fileExt);
			var sMsg = "";
			if(fileExt=='jpg'||fileExt=='png'||fileExt=='gif'||fileExt=='bmp'){
				$.ajax({
					type:'DELETE',
					url:'/pds/data/delimage?fileName='+fullname,
					success:function(msg){
						sMsg = msg;
						console.log(sMsg);
					}
				});
			}else{
				$.ajax({
					type:'GET',
					url:'/pds/data/delfile?fileName='+fullname,
					success:function(msg){
						sMsg = msg;
						console.log(sMsg);
					}
				});
			}
			
			
		});

		//취소버튼 click 이벤트
		$('#cancelBtn').on('click', function(e) {
			e.preventDefault();
			$('#hiddenForm').attr('action', '/board').submit();
		});
		
		
		
		
		//iframe 내부 img 클릭 이벤트(이미지 파일크기조절)--
		
		var dragable=false;
		var name = null;
		var fullId= null;
		
		$('#tx_canvas_wysiwyg').contents().on('click', 'img',	function(e) {
					e.preventDefault();
					e.stopPropagation();
					name = $(this).attr('name');
					var id=$(this).attr('id');
					fullId="#"+id;
					console.log('id: '+ id);
					var mouseX ;
					var mouseY ;
					console.log(name);
					$(this).css('opacity','0.5');
					
					$(this).on('mousedown',function(e){
						e.preventDefault();
						e.stopPropagation();
					//console.log("다운fullid:"+fullId);
						if(id!=null){
							$(this).attr('name',fullId);
						}
						dragable=true;
						console.log("다운name: "+name);
						return false;
					});
					
					$(this).closest('body').not('p').on('mouseup',function(e){
						e.preventDefault();
						e.stopPropagation();
						dragable=false;
					/* 	if(dragable&&fullId!=null){
							$(this).contents().find(fullId).css('opacity','1');
							
							return;
						} */
						fullId=null;
						dragable=false;
						$(this).contents().find('img[name='+name+']').css('opacity','1');
						return false;
					});
													
					$(this).closest('body').not('p').on('mousemove',function(e){ 
						e.preventDefault();
						e.stopPropagation();
						
						var x = e.offsetX;
						var y = e.offsetY;
						if(dragable&&name!=null){
							console.log("무브name:"+name); 
							$(this).contents().find('img[name='+name+']').attr('width',x).attr('height',y);
							return false;
						}
						if(dragable&&fullId!=null){
							$(this).contents().find(fullId).attr('width',x).attr('height',y);
							return false;
						}
					});
					return false;
				});
			//이미지 크기조절 끝--

	});
</script>

</body>
</html>