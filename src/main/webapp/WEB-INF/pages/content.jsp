<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html data-ng-app="contentApp">
<head>
    <link href="/resources/css/personPage.css" rel="stylesheet">
    <link href="/resources/css/myStyle.css" rel="stylesheet">
    <script src="/resources/js/jQuery-2.0.3.min.js"></script>
    <script src="/resources/js/angular.min.js"></script>
    <script src="/resources/js/jQuery.extend.js"></script>
    <script>

        $(function () {
            $(".function div").click(function () {
                $(".function div").css("background-color", "forestgreen");
                $(this).css("background-color", "#f19f0f");
            });

            $(".function div:first").click();

            $(".personList div").click(function () {
                $(this).toggleClass("eat");
            });

            var initialUser = function () {
                var currentUserName = $(".summary .person").attr("name");
                $(".personList div[name=" + currentUserName + "]").hide();
            };

            $('#submit').on('click', function (event) {
                $('.number span').animateNumbers(1000);
            });

            initialUser();
        });

        var contentApp = angular.module('contentApp', []);

        var controllers = {};

        controllers.UserController = function ($scope) {
            $scope.users = [
                { name: 'honglai', chineseName: '红来', money: 0},
                { name: 'mingming', chineseName: '明明', money: 0},
                { name: 'xuanzhou', chineseName: '周旋', money: 0},
                { name: 'juanchen', chineseName: '镌宸', money: 0}
            ];

            var currentUserName = $(".summary .person").attr("name");

            var currentUser = $.grep($scope.users, function (n, i) {
                return n.name == currentUserName;
            });

            $scope.eatUsers = [currentUser[0]];

            $scope.updateMoney = function (user) {
                if ($.inArray(user, $scope.eatUsers) == -1) {
                    $scope.eatUsers.push(user);
                }
                else {
                    $scope.eatUsers.splice($.inArray(user, $scope.eatUsers), 1);
                }
                $.each($scope.users, function (index, value) {
                    if ($.inArray(value, $scope.eatUsers) > -1) {
                        var money = $scope.totalMoney / $scope.eatUsers.length;
                        value.money = money.toFixed(1);
                    }
                    else {
                        value.money = 0;
                    }
                });
            };
        };

        controllers.FunctionController = function ($scope) {
            $scope.functions = [
                { name: '买单', url: '/todo'},
                { name: '还钱', url: '/todo'},
                { name: '借钱', url: '/todo'}
            ];
        };

        contentApp.controller(controllers);
    </script>
</head>
<body style="color: #ffffff">
<div class="summary">
    <div class="person" name=${User}>${UserChineseName}</div>
    <div class="number">
        <span style="margin-left: 150px;font-size: 120px;font-family: fantasy;">059</span>
    </div>
</div>

<div class="function" data-ng-controller="FunctionController">
    <div data-ng-repeat="function in functions">{{function.name}}</div>
    <div style="margin-right: 0px">清帐</div>
</div>

<div class="function_display" data-ng-controller="UserController">
    <div>
        <p style="margin-bottom: 0px;display: inline-block">金额</p>
        <input type="text" name="totalMoney" ng-model="totalMoney">
    </div>
    <div style="margin-top: 34px;">
        <div style="margin-bottom: 0px;display: inline-block;margin-left: 0px;height: 102px">人头</div>
        <div class="personList" style="margin-left: -20px;">
            <div name={{user.name}} data-ng-repeat="user in users" ng-click="updateMoney(user)">
                {{user.chineseName}}{{user.money}}
            </div>
        </div>
    </div>
    <div class="confirm"><a id="submit" style="color: #000000;text-decoration: none;cursor: pointer;">确认</a></div>
</div>
</body>
</html>