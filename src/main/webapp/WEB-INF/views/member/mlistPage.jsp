<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- include 파일 -->
<%@include file="../include/header.jsp"%>

<style>

.parallax-effect .color-overlay {
	background-color: rgba(0, 0, 0, 0.3);
}
.row{
	margin-top:40px;
	padding: 0 10px;
}
</style>

<section class="parallax-effect" tabindex="5000" style="overflow: hidden; outline: none;">
  <div id="parallax-pagetitle" style="background-image: url(&quot;../resources/images/parallax/backimg1.png&quot;); background-position: 50% -68px;">
    <div class="color-overlay"> 
      <!-- Page title -->
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <h1>Members</h1>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- 회원 목록 테이블 -->
<!-- <button type="submit" id="logoutBtn" class="btn  btn-lg btn-primary" style="float:right;">LogOut</button>	 -->

<div class="box">
<div class="container" style="text-align:center;">
<div class="col-md-12 mt50" style="display:inline-block; width:100%;">
<table class="table table-striped">
        <tbody>
        <tr>
        <th>번호</th>
        <th>ID</th>
        <th>이름</th>
        <th>PW</th>
        <th>닉네임</th>
        <th>E-mail</th>
        <th>연락처</th>
        <th>등록일자</th>
        </tr>
        
        <c:forEach items="${list}" var="memberVO">
          <tr>
            <td>${memberVO.mno}</td>
            <td><a href="/member/mviewPage${pageMaker.makeSearch(pageMaker.cri.page)}&mno=${memberVO.mno}">${memberVO.mid}</a></td>
            <td>${memberVO.mname}</td>
            <td>${memberVO.mpw}</td>
            <td>${memberVO.mnick}</td>
            <td>${memberVO.mmail}</td>
            <td>${memberVO.mhp}</td>
            	<jsp:useBean id="now" class="java.util.Date"/> 
            		  <fmt:formatDate value="${now}" var="today" pattern="yyyy/MM/dd"/>
            		  <fmt:formatDate value="${memberVO.regdate}" var="regdate" pattern="yyyy/MM/dd" />
            		  <c:if test="${today ne regdate}">
            		  	<td><fmt:formatDate value="${memberVO.regdate}" pattern="yyyy/MM/dd"/></td>
            		  </c:if>
            		  <c:if test="${today eq regdate}">
            		  	<td><fmt:formatDate value="${memberVO.regdate}" pattern="HH:mm"/></td>
            		  </c:if>            		  
            </tr>
        </c:forEach>
        
        </tbody>
        
</table>

<!-- 페이징 처리 숫자 부분 -->

<div class="text-center mt50">
      <ul class="pagination pagination-lg clearfix">
      
        <c:if test="${pageMaker.prev}">
        	<li>
        		<a href="mlistPage${pageMaker.makeSearch(pageMaker.startPage - 1)}">«</a>
        	</li>
        </c:if>
        
        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
        	<li
        		<c:out value="${pageMaker.cri.page == idx ? 'class=active' : '' }"/>>
        		<a href="mlistPage${pageMaker.makeSearch(idx)}">${idx}</a>
        	</li>
        </c:forEach>
        
        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
        	<li>
        		<a href="mlistPage${pageMaker.makeSearch(pageMaker.endPage + 1)}">»</a>
        	</li>
        </c:if>
        
      </ul>
</div>

<!-- 검색창 -->
<button type="submit" id="newBtn" class="btn btn-lg btn-primary" style="float:right;">회원등록</button>	
<div class="box-body" style="text-align: center;">
      
	<select name="searchType">
    	<option value="x"
    		<c:out value="${cri.searchType == null ? 'selected' : ''}"/>>---</option>
    	<option value="i"
    		<c:out value="${cri.searchType eq 'i' ? 'selected' : ''}"/>>ID</option>
    	<option value="n"
    		<c:out value="${cri.searchType eq 'n' ? 'selected' : ''}"/>>Name</option>
    	<option value="k"
    		<c:out value="${cri.searchType eq 'k' ? 'selected' : ''}"/>>NickName</option>
    	<option value="in"
    		<c:out value="${cri.searchType eq 'in' ? 'selected' : ''}"/>>ID or Name</option>
    	<option value="nk"
    		<c:out value="${cri.searchType eq 'nk' ? 'selected' : ''}"/>>Name or NickName</option>
    	<option value="ink"
    		<c:out value="${cri.searchType eq 'ink' ? 'selected' : ''}"/>>ID or Name or NickName</option>
    	<option value="e"
    		<c:out value="${cri.searchType eq 'e' ? 'selected' : ''}"/>>E-mail</option>
    	<option value="p"
    		<c:out value="${cri.searchType eq 'p' ? 'selected' : ''}"/>>Phone</option>
	</select>
	
	<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
	<button type="button" id="searchBtn" class="btn btn-primary btn-xs">Search</button>
	
	
	
</div>

</div>
</div>
</div>
      
<!-- 스크립트 부분 -->

<script>
      
      /* 악의적 도배방지용 뒤로가기 막기 기능 */
      history.pushState(null, null, location.href);
      window.onpopstate = function(event) {
      	history.go(1);
      };
      
      /* 등록/수정/삭제 후 Alert창 띄워주는 코드는 redirect가 모두 mlistPage이기 때문에 mlistPage에 위치한다 */
      var result = "${msg}";
    
      if(result=="success"){
    	  console.log("msgmsgmsmg");
    	  alert("완료되었습니다!!");
    	  }
      
      /* 검색버튼 클릭 시 제대로 동작 시키기 */
      $(document).ready(function(e){
    	  
    	  $("#searchBtn").on("click", function(e){
    		  console.log("-----------");
    		  self.location = "mlistPage"
    		   + "${pageMaker.makeQuery(1)}"
    		   + "&searchType="
    		   + $("select option:selected").val()
    		   + "&keyword="
    		   + encodeURIComponent($("#keywordInput").val());
    	  });
    	  
    	  $("#newBtn").on("click",function(e){
    		  console.log("------");
    		  self.location = "/member/mregister";
    	  });
    	  
    	  $("#logoutBtn").on("click", function(e){
    		  self.location = "/member/logout";
    	  })
      });
      
</script>