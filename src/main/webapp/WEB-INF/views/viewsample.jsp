<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<style>

/* reply */
.timeline {position: relative; /*margin: 0 0 30px 0;*/ padding: 0; list-style: none;}

.timeline > li {position: relative; margin-right: 10px; margin-bottom: 15px;}
.timeline > li:before,
.timeline > li:after {content: " "; display: table;}
.timeline > li:after {clear: both;}
.timeline > li > .timeline-item {-webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1); box-shadow: 0 1px 5px #333;
  border-radius: 3px; margin-top: 0; background: #fff; color: #444; margin-right: 10px; margin-left: 15px; padding: 0; position: relative;}
.timeline > li > .timeline-item > .time {color: #999; float: right; padding: 10px; font-size: 12px;}
.timeline > li > .timeline-item > .timeline-header {margin: 0; color: #555; border-bottom: 1px solid #f4f4f4; padding: 10px;
  font-size: 12px; font-weight:bold; line-height: 1.1;}
.timeline > li > .timeline-item > .timeline-header > a {font-weight: 600;}
.timeline > li > .timeline-item > .timeline-body,
.timeline > li > .timeline-item > .timeline-footer {padding: 10px;}
.timeline > li > .fa,
.timeline > li > .glyphicon,
.timeline > li > .ion {width: 30px; height: 30px; font-size: 15px; line-height: 30px; position: absolute; color: #666; background: #d2d6de;
  border-radius: 50%; text-align: center; left: 18px; top: 0;}
.timeline > .time-label > span {font-weight: 600; padding: 5px; display: inline-block; background-color: #fff; border-radius: 4px;}
.timeline-inverse > li > .timeline-item {background: #f0f0f0; border: 1px solid #ddd; -webkit-box-shadow: none; box-shadow: none;}
.timeline-inverse > li > .timeline-item > .timeline-header {border-bottom-color: #ddd;}

.commentArea {height: auto; position: relative; display: inline-block;}
.commentArea textarea {resize: none; min-height: 70px; line-height: 20px; max-height: 350px;}
.commentArea span {position: absolute; bottom: 5px; right: 20px;}
#commentCounter {background:#ff6351; border-radius: 0.5em; padding: 0 .5em 0 .5em; font-size: 0.75em; color: #fff;}
#commentAddBtn {width:100%; height:70px;}



.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    transform: translate(0, 0);
}


.bg-green, .callout.callout-success, .alert-success, .label-success, .modal-success .modal-body {
    background-color: #00a65a !important;
    color: #fff;
}

</style>

<style>
#miniNav, #miniNav a {
	color: #BDBDBD;
}
</style>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
		
	
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


<link rel="stylesheet" href="/resources/daumeditor/css/editor.css"
	type="text/css" charset="utf-8" />
	
<section id="pricing">
	<div id="blog" class="container">

		<div class="row col-md-12 st-pricing">
			<div class="col-md-12" style="height: 50px">
				
			</div>

			<div class="col-sm-12">
				<div class="st-pricing"
					style="box-shadow: 0px 0px 18px #ddd; padding-bottom: 0px">
					<div class="st-border"></div>
					<table class="table">
						<thead>
							<tr>
								<th><h2 align="left">${boardVO.title}</h2></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<!-- 2017-05-29 10:39 -->
								<th><h6 align="left">
										<i class="glyphicon glyphicon-time"></i> 작성일자 :
										${boardVO.regdate} <i class="glyphicon glyphicon-eye-open"
											style="padding-left: 50px"></i> 조회수 : ${boardVO.viewctn} <i
											class="glyphicon glyphicon-user" style="padding-left: 50px"></i>
										작성자 : ${boardVO.uname}
									</h6></th>

							</tr>

							<tr>
								<th height="300px">
					
									${boardVO.reviewcon }

								</th>
							</tr>
							<tr>
								<%-- <th id="downFile"><c:forEach items="${files}" var="files"
										varStatus="idx">
										<h6 align="left" style="padding-right: 50px;" id="addedFile">

											<i class="glyphicon glyphicon-save"></i> 첨부파일${idx.count} : <a
												href="/up/filedown?fileName=${files.fname}">
												${files.fname}</a>
										</h6>
									</c:forEach></th> --%>
							</tr>
		
							

						</tbody>
						

					</table>
										<div class="pull-right" style="padding-top: 15px">
					<c:if test="${login.role eq 'owner'}">
						<c:if test="${login.mid eq pdsData.pwriter}">
						<a id="modBtn" href="#" class="btn btn-send" style="margin-top: 0px;">수정</a>
					  <a id="delBtn" href="#" class="btn btn-send"	style="margin-top: 0px;">삭제</a>
					</c:if> 
  					</c:if>
					<c:if test="${login.role eq 'admin'}">
					<a id="modBtn" href="#" class="btn btn-send" style="margin-top: 0px;">수정</a> 
					<a id="delBtn" href="#" class="btn btn-send" style="margin-top: 0px;">삭제</a> 
					</c:if> 
					
							<a id="listBtn" href="#"class="btn btn-send" style="margin-top: 0px;">목록</a>
						
					</div>

	
				</div>
				
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div style="top: 30%" class="modal fade" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close pull-right" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h5 class="modal-title" id="exampleModalLabel">자료 삭제</h5>
				</div>
				<div class="modal-body">
					<h4 style="text-align: center;">정말 삭제하시겠습니까?</h4>
					<h6 style="text-align: center;">(첨부파일도 함께 삭제)</h6>

				</div>

				<div class="modal-footer">

					<button type="button" class="btn btn-primary" id="yesBtn">예</button>

					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal끝 -->
	<form action="/delete" method="POST" id="modalForm">
		<input type="hidden" name="bno" value="${boardVO.bno}" /> 
		<input type="hidden" name="type" value="${cri.type}" /> 
		<input type="hidden" name="keyword" value="${cri.keyword}" /> 
		<input type="hidden" name="page" value="${cri.page}" /> 
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}" />  
	</form>
	<!--Modal 끝  -->
	<!-- Small modal 시작 -->
	<div style="top: 32%" id="smallModal"
		class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
				<input type="hidden" value="${msg}" id="sfMsg">
					<h4 style="text-align: center;" id="modalText">등록되었습니다.</h4>
					<div style="text-align: right; margin-top: 20px;">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<!-- Small modal 끝 -->
	<!-- 파라미터 전송을위한 HiddenForm  -->
	<form method="get" id="hiddenForm">
		<input type="hidden" name="bno" value="${boardVO.bno}" /> 
		<input type="hidden" name="type" value="${cri.type}" /> 
		<input type="hidden" name="keyword" value="${cri.keyword}" /> 
		<input type="hidden" name="page" value="${cri.page}" /> 
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}" /> 
	</form>
	
	<div class="container" id="reply">
	<div class="row col-md-12 st-pricing">
	
				<!-- 댓글 박스 -->
				
				<div class="revviewBox">
				<div class="col-sm-12">
		
				<div class="st-pricing" style="box-shadow: 0px 0px 18px #ddd; padding-bottom: 0px">
				
				<ul class="timeline">
				<li class="commentLi" data-commentno="2">
				
				
	<!-- 댓글 달면 이쪽에 추가 해서 li로 쭉 뺴기 -->
	
	<li class="coommentLi" id="repliesDiv">
		<div class="timeline-item">
			<span class="time">
				<i class="fa fa-clock-o"></i> 2016/8/1 9:55
			</span>
			<h3 class="timeline-header"><!--<strong>2</strong> -->구경온손님</h3>
			<div class="timeline-body">ddddddddddddddddddddddddddddddddddddddddddddddddddddddd?</div>
			<div class="timeline-footer">
			<a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#modifyModal">수정</a>
			<a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#modifyModal">삭제</a>
			</div>
		</div>
		</li>

		
		<!-- 댓글 끝 -->
	
			
		</ul>
		
				</div>				
				</div>
				</div>
				
				<!-- 댓글 박스 -->
				
<!-- 				<div class="text-center" style="margin-bottom:20px;">
					<ul id="pagination" class="pagination paginatino-sm no-margin"></ul>
				</div> -->
				<div class="box box-info">
					<div class="box-body">
						<input class="form-control" type="hidden" id="newCommentWriter" value="" readonly="readonly">
						<div class="col-sm-11 col-xs-8 commentArea">
							<textarea class="form-control" id="newCommentText" maxlength="300" placeholder="댓글 작성을 위해 로그인 해 주세요." style="height: 17em;"></textarea>
							<span id="commentCounter">0/300</span>
						</div>
						<div class="col-sm-1 col-xs-4">
							<button type="submit" class="btn btn-primary btn-block btn-sm" id="commentAddBtn">등록</button>
						</div>
					</div>
				</div>
				</div>
					
			</div>
</section>

<script id="template" type="text/x-handlebars-template">

{{#each .}}
	<li class="coommentLi">
		<div class="timeline-item">
			<span class="time">
				<i class="fa fa-clock-o"></i> 2016/8/1 9:55
			</span>
			<h3 class="timeline-header"><!--<strong>2</strong> -->구경온손님</h3>
			<div class="timeline-body">1?</div>
			<div class="timeline-footer">
			<a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#modifyModal">수정</a>
			<a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#modifyModal">삭제</a>
			</div>
		</div>
		</li>
{{/each}}

</script>

<script>
var printData = function(replyArr, target, templateObject){
	
	var template = handlebars.compile(templateObject.html());
	
	var html = template(replyArr);
	target.after(html);
	
}
</script>


<script>

	$(document).ready(function() {
		//로그인안했을시 첨부파일 다운막기
		if('${login}'==''){
			$('#addedFile').html('로그인시 다운받으실수있습니다. <a href="/member/login" style="color:#4374D9;padding-left:15px;">로그인</a>');
		}
		
		var viewUrl = location.href;
		checkSuccess(viewUrl);
		//등록,삭제등의 성공,실패 여부확인한후 알려주는창 띄우는 함수
		function checkSuccess(viewUrl){
			var msg = $('#sfMsg').val();
			var $text = $('#modalText');
			var $sModal = $('#smallModal');
				switch (msg) {
				case 'modS':
					$text.text('정상적으로 수정되었습니다');
					$sModal.modal();
					break;
				case 'modF':
					$text.text('수정이 실패하였습니다.');
					$sModal.modal();
					break;
				
				default:
					break;
			}
			
		}
		var bno = ${boardVO.bno}
		var replyPage=1;
		
		getPage();
		
		function getPage(pageInfo){
			$.getJSON(pageInfo, function(data){
				printData(data.list, $("#repliesDiv"), $("#template"));
			})
		}
		//sf여부 확인모달에서 '확인'버튼 클릭 이벤트(뒤로가기시 창안뜨게)
		 $('#smallModal button').on('click',function(e){
			  $('#sfMsg').val('fin');
			});
		
		//수정버튼 클릭이벤트
		$('#modBtn').on('click',function(e){
			e.preventDefault();
			$('#modalForm').attr('action', '/modify').submit();
		});
		
		//List버튼 클릭 이벤트
		$('#listBtn').on('click', function(e) {
			e.preventDefault();
			$('#hiddenForm').attr('action', '/board').submit();
		});

		//삭제버튼 클릭 이벤트
		$('#delBtn').on('click', function(e) {
			e.preventDefault();
			$('#myModal').modal();
		});
		//myModal 내 '예' 버튼 클릭 이벤트
		$('#yesBtn').on('click', function(e) {
			e.preventDefault();
			$('#myModal').hide();
			$('#modalForm').submit();
		});

	});
</script>
</body>
</html>