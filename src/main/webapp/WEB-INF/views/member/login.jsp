<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>

<!-- include 파일 -->

<%@include file="../include/header.jsp"%>

<body style="background-image: url(&quot;../resources/images/parallax/loginback.jpg&quot;); background-size: cover;">

<style>

#loginModal{
position: fixed;
left: 50%;
top: 50%;

-webkit-transform: translate(-50%, -50%);
-ms-transform: translate(-50%, -50%);
-moz-transform: translate(-50%, -50%);
-o-transform: translate(-50%, -50%);
transform: translate(-50%, -50%);
}

.control-label{
float:left;
margin-left:15px;
}

.col-sm-7{
margin-left:15px;
margin-right:15px;
}
.form-group .col-sm-offset-2{
text-align:center;
}


</style>

<div id="loginModal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Login</h4>
      </div>
      <form class="form-horizontal" action="/member/loginPost" method="post">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">ID</label>
    <div class="col-sm-7">
      <input type="text" name="mid" class="form-control" placeholder="Member ID">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-7">
      <input type="password" name="mpw" class="form-control" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-7">
      <div class="checkbox">
        <label>
          <input type="checkbox" name="useCookie"> Remember Me
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-7">
      <button type="submit" class="btn btn-default">Sign in</button>
    </div>
  </div>
</form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>

<script>

$(document).ready(function(e){
	
	$('#loginModal').on('shown.bs.modal', function () {
		});
	
	$('#loginModal').modal({backdrop: 'static'});

});


</script>
</html>