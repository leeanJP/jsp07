<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>LifeCycle</title>
    <script>
        function  requestAction(form, method){
            if(method == 1){
                form.method = 'get';
            }else{
                form.method = 'post';
            }
            form.submit();
        }
    </script>
</head>
<body>
    <h2>
        서블릿의 수명주기 메소드
    </h2>

    <form action="./LifeCycle.do">
        <input type="button" value="Get 방식" onclick="requestAction(this.form, 1)">
        <input type="button" value="Post 방식" onclick="requestAction(this.form, 2)">
    </form>

</body>
</html>
