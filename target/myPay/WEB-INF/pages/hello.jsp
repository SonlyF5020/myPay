<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <link href="/resources/css/myStyle.css" rel="stylesheet">
    <script type="text/javascript" src="/resources/js/jQuery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/resources/js/myJS.js"></script>
    <script>
        $(function(){
            $('.person').click(function(){
                self.location="/content?user="+this.getAttribute("id");
            });
        });
    </script>
</head>
<body style="background-color: #f19f0f;">
	<h1 style="margin: auto; text-align: center; font-size: 50px; color: black;">${message}</h1>
    <div id="personList">
        <div class="person" id="honglai">占红来</div>
        <div class="person" id="mingming">明明</div>
        <div class="person" id="xuanzhou">周旋</div>
        <div class="person" id="juanchen">大哥</div>
    </div>
</body>
</html>