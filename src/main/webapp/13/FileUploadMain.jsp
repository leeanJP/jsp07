<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%--
    commons-fileupload.jar cos.jar ...
    PartAPI

    1.화면 폼 작성
    2.DB 테이블
    3.DTO DAO 작성
    4.파일 업로드 완성
--%>
<html>
<head>
    <meta charset="UTF-8">
    <title>FileUpload</title>
</head>
<body>
<script>
    function validateForm(form){
        if(form.title.value == ""){
            alert("제목을 입력하세요");
            form.title.focus();
            return false;
        }else if(form.ofile.value ==""){
            alert("첨부파일은 필수 입력입니다.");
            return false;
        }
    }
</script>
<h2>파일 업로드</h2>
<span style="color: red;">${errMessage}</span>
<%--
    enctype="multipart/form-data"
    모든 문자를 인코딩하지않고 파일을 서버로 전송할 때 주로 사용
--%>
<form name="fileForm" action="UploadProcess.do" method="post"
      enctype="multipart/form-data" onsubmit="return validateForm(this)">
    작성자 : <input type="text" name="name" value="머스트해브"/> <br/>
    제목 : <input type="text" name="title"/> <br/>
    카테고리 (선택사항) :
    <input type="checkbox" name="cate" value="사진" checked/>사진
    <input type="checkbox" name="cate" value="과제" />과제
    <input type="checkbox" name="cate" value="워드" />워드
    <input type="checkbox" name="cate" value="음원" />음원 <br/>
    첨부파일 : <input type="file" name="ofile" /> <br/>
    <input type="submit" value="전송하기"/>
</form>


</body>
</html>
