<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="join.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function(){

            $("#btn_submit").on("click", function(e){
                e.preventDefault(); // form submit 막기

                var formData = $('form').serialize();
                console.log(formData);  // id=1&name=2 .....
                $.ajax({
                    url: './join_ajax.jsp',
                    type: 'post',
                    data : formData,
                    success : function (result) { //요청이 성공했을 때 동작할 코드
                        $("#p_result").html(result);
                    }
                })
            });
        });
    </script>
</head>
<body>
    <div id='container'>
        <div class='signup'>
            <form action="join_process.jsp" method="post">
                <input type='text' name="id" placeholder='아이디:'  />
                <input type='text' name="pw" placeholder='비밀번호:'  />
                <input type='text' name="name" placeholder='성명:'  />
                <input type='text' name="phone" placeholder='전화번호:'  />
                <input type='text' name="email" placeholder='이메일:'  />
                <input type='text' name="area" placeholder='사는 지역:'  />
                <p>
                    <label><input type='radio' name="gender" value="male">남자</label>
                    <label><input type='radio' name="gender" value="female">여자</label>
                </p>
                <p>
                    <label>
                        <select name="tel_cop">
                            <option value="skt">SKT</option>
                            <option value="kt">KT</option>
                            <option value="u+">U+</option>
                        </select>
                    </label>
                </p>
                <input type='submit' id="btn_submit" placeholder='SUBMIT' />
            </form>
        </div>
        <div class='whysign'>
            <h1>Learn by Doing</h1>
            <p id="p_result">Learning to code is not magic. It is as simply as opening your browser! See in real time the changes you make to HTMl, CSS, JavaScript, HAML, and more!</p>
            <p>Learn:
                <span>HTML</span>
                <span>CSS</span>
                <span>JavaScript</span>
            </p>
        </div>
    </div>
</body>
</html>
