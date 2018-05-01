<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<!--   데이터를 넘기기 전에 유효성검사를 시행한다. -->
<script type="text/javascript">

// 수정일을 위한 함수
   $(document).ready(function() {
   function getDate()
   {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
    if(dd<10){dd='0'+dd} if(mm<10){mm='0'+mm}
    today = yyyy+""+mm+""+dd;

    document.getElementById("todayDate").value = today;
}
getDate();
   });
   //업데이트form을 숨긴다.
   $(document).ready(function() {
      //       alert("OK");
      $("#updateInfoDiv").hide();
   });
   
   // 회원정보수정Btn을 누르면 업데이트form(show), viewInfo(hide).
   $(document).ready(function() {
      $("#goUpdateBtn").click(function() {
         $("#viewInfoDiv").toggle();
         $("#updateInfoDiv").toggle();
      });
      
      // 수정취소 버튼 click -> confirm
      $("#cancelUpdateBtn").click(function() {
         var con = confirm("수정을 취소하시겠습니까?");
         if (con) {
            $("#viewInfoDiv").toggle();
            $("#updateInfoDiv").toggle();
         } else
            return false;
   });
      // 수정하기 버튼 click -> confirm
      $("#completeUpdateBtn").click(function() {
         var con = confirm("수정하시겠습니까?");
         if(con) {
            alert("수정이 완료 되었습니다. \n 다시 로그인 해 주세요.");
            $("#completeUpdateBtn").submit();
         }
         else return false;
      });
   });

//       $("#completeUpdateBtn").click(function() {
//          var con = confirm("수정하시겠습니까?");
//          if(con){
//             return true;
//             else return false;
//          }
//       })
//    });
</script>

<title>나의 회원정보</title>
</head>
<body>
	<div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3>회원정보 수정</h3>
				<p>안내:나의 회원정보.</p>
			</div>
			<div class="panel-body">
				<!--   action 속성을 생략하면 같은 uri를 호출한다. 구분하기 위해 꼭 POST방식 전송하자. -->
				<form method="post" id="joinForm">
					<div class="form-group">
						<label for="id">아이디</label> 
					</div>
					
					<div class="form-group">
						<label for="password">암호</label>
					</div>
					
					<div class="form-group">
						<label for="confirmPassword">암호확인</label>
					</div>
					
					<div class="form-group">
						<label for="name">이름</label> 
					</div>
					
					<div class="form-group">
						<label for="birthDate">생년월일 </label>
					</div>
					
					<div>
						<label for="mobile">휴대전화</label> 
					</div>
					
					<div class="form-group">
						<label for="email">이메일</label>
					</div>
					
					<div>
						<label for="address">주소</label><br/>
					</div>
					
					<button type="submit" class="btn btn-default" >가입</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>