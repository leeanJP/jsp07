<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Basic Filter</title>
</head>
<body>

    <h2>web.xml로 filter 매핑하기</h2>
    <form>
        <input type="button" value="Get방식 전송" onclick="formSubmit(this.form, 1)"/>
        <input type="button" value="Post방식 전송" onclick="formSubmit(this.form, 2)"/>
    </form>
    <script>
        function formSubmit(form, methodType){
            if(methodType == 1){
                form.method = "get";
            }else if(methodType == 2){
                form.method = "post";
            }
            form.submit();
        }
    </script>
</body>
</html>
