<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

</style>


<div class="col-md-12 mt50" style="float: none;">
				<div class="panel panel-primary">
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
						<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.rtid}</td>
								<td>${list.rtname}</td>
								<td>${list.rtaddress}</td>
								<td>${list.regdate}</td>
								<td>${list.updatedate}</td>
							</tr>	
						</c:forEach>						
						</tbody>
					</table>
				</div>
				<div class = "text-center mt50">
				<ul class="pagination pagination-lg clearfix">
        <li class="disabled"><a href="#">«</a></li>
        <li class="active"><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">6</a></li>
        <li><a href="#">7</a></li>
        <li><a href="#">8</a></li>
        <li><a href="#">9</a></li>
        <li><a href="#">10</a></li>
        <li><a href="#">»</a></li>
      </ul>
      </div>
			</div>
<%@include file="../include/footer.jsp" %>