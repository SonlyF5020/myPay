
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/resources/css/personPage.css" rel="stylesheet">
    <link href="/resources/css/myStyle.css" rel="stylesheet">
    <script src="/resources/js/jQuery-2.0.3.min.js"></script>
    <script>
        $(function(){
           $(".function div").click(function(){
               $(".function div").css("background-color","yellowgreen");
               $(this).css("background-color","yellow");
           });
        });
    </script>
</head>
<body>
    <div class="summary">
        <div class="person">${User}</div>
        <div class="number">
            <div style="background: transparent">￥</div>
            <div>0</div>
            <div>5</div>
            <div>9</div>
        </div>
    </div>

    <div class="function">
        <div>买单</div>
        <div>还钱</div>
        <div>借钱</div>
        <div style="margin-right: 0px">清帐</div>
    </div>

    <div class="function_display">
        <div>金额:<input type="text" name="totalMoney"></div>
        <div>人头:<div class="personList"></div></div>
        <div class="confirm">确认</div>
    </div>
</body>
</html>