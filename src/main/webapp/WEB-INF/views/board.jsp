<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
	
<meta charset="utf-8">
<title>Starhotel - SHARED ON THEMELOCK.COM</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="shortcut icon" href="favicon.ico">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- Theme style -->
<link rel="stylesheet" href="\resources\adminLte\css\AdminLTE.css">


</head>

<body>
	<div class="col-xs-12">
		<div class="box"
			style="padding-top: 100px; padding-left: 200px; padding-right: 200px;">
			<div class="box-header">
				<h3 class="box-title">후기 게시판</h3>

			</div>

			<!-- 게시판 영역  -->
			<!-- /.box-header -->
			<div class="box-body table-responsive no-padding"
				style="text-align: center;">
				<table class="table table-bordered table-striped dataTable"
					style="background-color: hsla(208, 56%, 53%, 0.18);"
					style="text-align: center;">

					<tbody>
						<tr role="row">
							<th>번호</th>
							<th>제목</th>
							<th>사용자</th>
							<th>날짜</th>
							<th>조회</th>
							<th>추천</th>
						</tr>
						<c:forEach items="${list}" var="boardVO">
						<tr role="row" class="odd">
							<td>${boardVO.bno}</td>
							<td style="text-align: left;"><a href='/view${pager.makeSearch(pager.cri.page)}&bno=${boardVO.bno}'>${boardVO.title}</a></td>
							<%-- /view${pager.makeSearch(pager.cri.page)}&bno=${board.bno} --%>
							<td style="text-align: left;">${boardVO.uname}</td>
							<td>${boardVO.regdate}</td>
							<td><span class="badge bg-red">${boardVO.viewctn}</span></td>
							<td><span class="label label-success">Approved</span></td>
						</tr>
						</c:forEach>

					</tbody>
				</table>
				<!-- 페이징 영역 -->
				<div class="row">
					<div class="col-sm-5"></div>

					<div class="col-sm-12">


						<div class="dataTables_paginate paging_simple_numbers"
							id="example1_paginate">
							<ul class="pagination">
							<c:if test="${pager.prev == true}">
                                <li class="paginate_button previous" "><a
                                    href="${(pager.start - 1)}"
                                    aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a></li>
                            </c:if>


                            <c:forEach var="pages" begin="${pager.start}" end="${pager.end}">


                                <li class='${pages == pager.current ? "paginate_button active":""}' >

                                    <a href="${pages}" aria-controls="example2" data-dt-idx="3" tabindex="0">${pages}</a>

                                </li>

                            </c:forEach>


                            <c:if test="${pager.next == true }">
                                <li class="paginate_button next" ><a href="${(pager.end + 1)}"
                                    >Next</a></li>
                            </c:if>
							</ul>
						</div>
						<!-- 검색 및 새글 쓰기 디자인 조정 필요 합니다. -->
						<select name="type">
						<option value='x' <c:out value = "${cri.type eq 'x' ? 'selected':''}"/>>----</option>
						<option value='n' <c:out value = "${cri.type eq 'n' ? 'selected':''}"/>>제목</option>
						<option value='c' <c:out value = "${cri.type eq 'c' ? 'selected':''}"/>>내용</option>
						<option value='nc' <c:out value = "${cri.type eq 'nc' ? 'selected':''}"/>>제목+내용</option>
						<option value='w' <c:out value = "${cri.type eq 'w' ? 'selected':''}"/>>작성자</option>
						</select> <input type="text" name="keyword" id="keywordInput" value="${pager.cri.keyword}">

						<button id='searchBtn'>Search</button>

						<button type="submit" style="float: right;" class="writeBtn">새글쓰기</button>
					</div>
				</div>

			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</div>
	
	
	
<form id="pagingForm">

<input type="hidden" name="page" value=${pager.cri.page}>
<input type="hidden" name="perPageNum" value=${pager.cri.perPageNum}>
<input type="hidden" name="type" value=${pager.cri.type}>
<input type="hidden" name="keyword" value=${pager.cri.keyword}>

</form>

<script>
/*     history.pushState(null, null, location.href);
    window.onpopstate = function(event) {
        history.go(1);
        
    } */
    $(document).ready(function(){
        $('#searchBtn').on("click", function(event){
            self.location = "board"
/*              +'${pager.makeSearch(1)}' */
            +"?page=1"
            +"&type="
            +$("select option:selected").val()
            +"&keyword="+encodeURIComponent($('#keywordInput').val());
        });
    });
    
    $(".writeBtn").on("click", function(){
    	 var jobForm = $("#pagingForm");
    	
    	jobForm.attr("action", "/register").submit();
    	
    });
    
    $(".pagination li a").on("click", function(event){
    
        event.preventDefault();
        
        var targetPage = $(this).attr("href");
        
        var jobForm = $("#pagingForm");
        
        jobForm.find("[name='page']").val(targetPage);
        jobForm.attr("action", "/board").attr("method", "get");
        
        jobForm.submit();
        
    });


</script>
	
	<script>
	
	var result = "${msg}";
	
	if(result == "SUCCESS"){
		alert("처리가 완료 되었습니다.");
	}
	
	</script>



</body>
</html>