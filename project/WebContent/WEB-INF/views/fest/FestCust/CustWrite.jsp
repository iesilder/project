<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>게시판 글쓰기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
// 	alert("OK");
	// 버튼 이벤트 처리
	$("#cancel").click(function(){
		history.back();
	});
	$("#reload").click(function(){
	    location = "CustWrite.do";
	});
});
</script>
<link rel="stylesheet" href="../css/board.css" />
</head>
<body>
<div class="container" >
<form action="write.do" method="post">

 <!-- Page Content -->
    <div class="container" >

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">행사 신청서
        <small>소비자용</small>
      </h1>

      <ol class="breadcrumb" >
        <li class="breadcrumb-item">
          <a href="/main/main.do">메인</a>
        </li>
        <li class="breadcrumb-item active">행사신청서-소비자</li>
      </ol>

      <!-- Contact Form -->
      <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
      <div class="row" >
        <div class="col-lg-8 mb-4" >
          <h3>행사 신청서 작성란</h3>
            <div class="control-group form-group" >
              <div class="controls">
                <label>이름:</label>
                <input type="text" class="form-control" name="applyname" id="applyname" placeholder="이름을 입력하세요." required />
                <p class="help-block"></p>
              </div>
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label>연락처:</label>
                <input type="text" class="form-control" name="applytel" id="applytel" placeholder="연락처를 입력하세요." required />
              </div>
            </div>
            <div class="control-group form-group" >
              <div class="controls">
                <label>동반인원:</label>
                <input type="number" class="form-control" name="applyno" id="applyno" placeholder="인원수를 입력하세요." required />
              </div>
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label>거주지역:</label>
                <input type="radio" class="form-control" name="applyloc" id="applyloc" placeholder="지역을 선택하세요." required />
              </div>
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label>참여시간:</label>
                <input type="text" class="form-control" name="applytime" id="applytime" placeholder="참여시간을 입력하세요." required />
              </div>
            </div>
         	 <table>
				<tr>
					<td colspan="2">
						<button class="btn btn-success">등록</button>
						<button type="reset" class="btn btn-warning">새로고침</button>
						<button type="button" id="cancel" class="btn btn-danger">취소</button>
					</td>
				</tr>
			</table>
        </div>

      </div>

      <!-- /.row -->
	</div>
    </form>
    </div>
    <!-- /.container -->

    <!-- Bootstrap core JavaScript -->
    <script src="../../../vendor/jquery/jquery.min.js"></script>
    <script src="../../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Contact form JavaScript -->
    <!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <script src="../../../js/jqBootstrapValidation.js"></script>
    <script src="../../../js/contact_me.js"></script>

</body>
</html>