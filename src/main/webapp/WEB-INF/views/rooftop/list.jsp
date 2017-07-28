<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>

<style>
    	.row{
		    margin-top:40px;
		    padding: 0 10px;
		}
		.clickable{
		    cursor: pointer;   
		}

		.panel-heading div {
			margin-top: -18px;
			font-size: 15px;
		}
		.panel-heading div span{
			margin-left:5px;
		}
		.panel-body{
			display: none;
		}
		.parallax-effect .color-overlay {
			background-color: rgba(0, 0, 0, 0.3);
}

</style>

<section class="parallax-effect" tabindex="5000" style="overflow: hidden; outline: none;">
  <div id="parallax-pagetitle" style="background-image: url(&quot;../resources/images/parallax/backimg1.png&quot;); background-position: 50% -68px;">
    <div class="color-overlay"> 
      <!-- Page title -->
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <h1>RoofTop</h1>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<div class="box">
<div class="container" >
<div class="col-md-12 mt50" style="float: none;">
				<%-- <div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">옥상 목록</h3>
					</div>
					<div class="panel-body">
						
					</div>
					<table class="table table-hover" id="dev-table">
						<thead>
							<tr>
								<th>번호</th>
								<th>옥상명</th>
								<th>주소</th>
								<th>등록 시간</th>
								<th>업데이트 시간</th>
							</tr>
						</thead>
						<tbody style="text-align: center;">
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.rtid}</td>
								<td><a href="/rooftop/read${pageMaker.makeSearch(pageMaker.cri.page)}&rtid=${list.rtid}">${list.rtname}</td>
								<td>${list.rtaddress}</td>
								<td>${list.regdate}</td>
								<td>${list.updatedate}</td>
							</tr>	
						</c:forEach>						
						</tbody>
					</table>
				</div> --%>
				<table class="table table-striped mt30" style="text-align: center;">
        <tbody>
        <tr>
        <th>번호</th>
        <th>옥상명</th>
        <th>주소</th>
        <th>등록 시간</th>
        <th>업데이트 시간</th>
        </tr>
        
        <c:forEach items="${list}" var="list">
							<tr>
								<td>${list.rtid}</td>
								<td><a href="/rooftop/read${pageMaker.makeSearch(pageMaker.cri.page)}&rtid=${list.rtid}">${list.rtname}</td>
								<td>${list.rtaddress}</td>
								
								
								
            		  <jsp:useBean id="now" class="java.util.Date"/> 
            		  <fmt:formatDate value="${now}" var="today" pattern="yyyy/MM/dd"/>
            		  <fmt:formatDate value="${list.regdate}" var="regdate" pattern="yyyy/MM/dd" />
            		  <c:if test="${today ne regdate}">
            		  	<td><fmt:formatDate value="${list.regdate}" pattern="yyyy/MM/dd"/></td>
            		  </c:if>
            		  <c:if test="${today eq regdate}">
            		  	<td><fmt:formatDate value="${list.regdate}" pattern="HH:mm"/></td>
            		  </c:if>  
            		  
            		  <jsp:useBean id="unow" class="java.util.Date"/> 
            		  <fmt:formatDate value="${now}" var="today" pattern="yyyy/MM/dd"/>
            		  <fmt:formatDate value="${list.updatedate}" var="updatedate" pattern="yyyy/MM/dd" />
            		  <c:if test="${today ne updatedate}">
            		  	<td><fmt:formatDate value="${list.updatedate}" pattern="yyyy/MM/dd"/></td>
            		  </c:if>
            		  <c:if test="${today eq updatedate}">
            		  	<td><fmt:formatDate value="${list.updatedate}" pattern="HH:mm"/></td>
            		  </c:if>          		  
            </tr>
        </c:forEach>
        
        </tbody>
        
</table>
				<div class = "text-center mt50">
		<ul class="pagination pagination-lg clearfix">
	        <c:if test="${pageMaker.prev}">
	        	<li>
	        		<a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">«</a>
	        	</li>
	        </c:if>
	        
	        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	        	<li
	        		<c:out value="${pageMaker.cri.page == idx ? 'class=active' : '' }"/>>
	        		<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
	        	</li>
	        </c:forEach>
	        
	        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	        	<li>
	        		<a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">»</a>
	        	</li>
	        </c:if>
      </ul>
      </div>
      <button type="submit" id="newBtn" class="btn  btn-lg btn-primary" style="float:right;">등록</button>	
    <div class="box-body" style="text-align: center;">
      
	<select name="searchType">
    	<option value="x" <c:out value="${cri.searchType == null ? 'selected' : ''}"/>>---</option>
    	<option value="rname" <c:out value="${cri.searchType eq 'rname' ? 'selected' : ''}"/>>옥상명</option>
    	<option value="raddress" <c:out value="${cri.searchType eq 'raddress' ? 'selected' : ''}"/>>주소</option>
    	<option value="rna" <c:out value="${cri.searchType eq 'rna' ? 'selected' : ''}"/>>옥상명 or 주소</option>
    	
	</select>
	
	<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
	<button type="button" id="searchBtn" class="btn btn-primary btn-xs">Search</button>
	
</div>
</div>
</div>
</div>
			
<script>

	/* 등록/수정/삭제 후 Alert창 띄워주는 코드는 redirect가 모두 mlistPage이기 때문에 mlistPage에 위치한다 */
	var result = "${msg}";
	
	if(result=="success"){
		  //console.log("msgmsgmsmg");
		  //alert("완료되었습니다!!");
		  swal(
		  				'완료되었습니다.',
		  				'',
		  				'success'
					)
		  //location.replace(self.location);
		  }
	/* 악의적 도배방지용 뒤로가기 막기 기능 */
	history.pushState(null, null, location.href);
	window.onpopstate = function(event) {
		history.go(1);
	};
	
	
</script>

<script>
	
	/* 검색버튼 클릭 시 제대로 동작 시키기 */
	$(document).ready(function(e){
		  
		  $("#searchBtn").on("click", function(e){
			  console.log("-----------");
			  self.location = "list"
			   + "${pageMaker.makeQuery(1)}"
			   + "&searchType="
			   + $("select option:selected").val()
			   + "&keyword="
			   + encodeURIComponent($("#keywordInput").val());
		  });
		  
		  $("#newBtn").on("click",function(e){
			  console.log("------");
			  self.location = "regist";
		  });
		  
	});

</script>
<%@include file="../include/footer.jsp" %>