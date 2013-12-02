<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/resources/css/myStyle.css" rel="stylesheet">
    <link href="/resources/css/demo.css" rel="stylesheet">
    <link href="/resources/css/normalize.css" rel="stylesheet">
    <link href="/resources/css/component.css" rel="stylesheet">
    <script src="/resources/js/jQuery-2.0.3.min.js"></script>
    <script>
        var href1 = "/content?user="+"${payer}";
        $(function(){
            alert(href1 + "1");
            $('#return').attr("href",href1);
        });
    </script>
</head>
<body>
<h1 style="margin: auto;text-align: center;font-family: monospace;font-size: 40px;color: forestgreen;">${payerChineseName}花了${totalMoney}元请大家吃了顿饭,
    土豪积分增加${payerScore}分 !</h1>

<div style="width: 860px; margin: auto auto 20px;">
    <nav class="cl-effect-12">
        <div class="person"><a id="return">返回</a></div>
        <div class="person"><a href="/">首页</a></div>
    </nav>
</div>
</body>
</html>