<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                $(".function div").css("color", "white");
                $(this).css("background-color", "antiquewhite");
                $(this).css("color", "black");
            });

            $(".function div:first").click();

            $(".personList div").click(function () {
                $(this).toggleClass("eat");
            });

            var initialUser = function () {
                var currentUserName = $(".summary .personDetail").attr("name");
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

            var currentUserName = $(".summary .personDetail").attr("name");

            var currentUser = $.grep($scope.users, function (n, i) {
                return n.name == currentUserName;
            });

            $scope.eatUsers = [currentUser[0]];

            function updateEatMoney($scope) {
                $.each($scope.users, function (index, value) {
                    if ($.inArray(value, $scope.eatUsers) > -1) {
                        var money = $scope.totalMoney / $scope.eatUsers.length;
                        value.money = money.toFixed(0);
                    }
                    else {
                        value.money = 0;
                    }
                });
            }

            $scope.updateMoney = function (user) {
                if ($.inArray(user, $scope.eatUsers) == -1) {
                    $scope.eatUsers.push(user);
                }
                else {
                    $scope.eatUsers.splice($.inArray(user, $scope.eatUsers), 1);
                }
                updateEatMoney($scope);
            };

            $scope.updateEatMoney = function () {
                updateEatMoney($scope);
            }

            $scope.submitOrder = function () {
                $('form input[name="money"]').val($scope.totalMoney);
                $('form input[name="payer"]').val(currentUser[0].name);
                $('form input[name="payerScore"]').val($scope.totalMoney - currentUser[0].money);

                var userInfo = $('form input:gt(2)[type!="submit"]');

                $.each(userInfo, function (index, value) {
                    if($scope.users[index].name == currentUser[0].name){
                        $(value).val($scope.totalMoney - currentUser[0].money);
                    }else{
                        $(value).val("-"+$scope.users[index].money);
                    }
                });

                $('form input[type="submit"]').click();
            }
        };

        controllers.FunctionController = function ($scope) {
            $scope.functions = [
                { name: '买单', url: '/todo'},
                { name: '还钱', url: '/todo'},
                { name: '借钱', url: '/todo'}
            ];
        };

        controllers.FormController = function($scope) {
            $scope.formOptions = [
                {type:'text', name:'money'},
                {type:'text', name:'payer'},
                {type:'text', name:'payerScore'},
                {type:'text', name:'m_honglai'},
                {type:'text', name:'m_mingming'},
                {type:'text', name:'m_xuanzhou'},
                {type:'text', name:'m_juanchen'},
                {type:'submit', name:'submit'}
            ];
        }

        contentApp.controller(controllers);
    </script>
</head>
<body style="color: #ffffff">
<div class="summary">
    <div class="personDetail" name=${User}>${UserChineseName}</div>
    <div class="number">
        <span style="margin-left: 150px;font-size: 120px;font-family: monospace;">${UserMoney}</span>
    </div>
</div>

<div class="function" data-ng-controller="FunctionController">
    <div data-ng-repeat="function in functions">{{function.name}}</div>
    <div style="margin-right: 0px">清帐</div>
</div>

<div class="function_display" data-ng-controller="UserController">
    <div>
        <p style="margin-bottom: 0px;display: inline-block">金额</p>
        <input type="text" name="totalMoney" ng-model="totalMoney" ng-change="updateEatMoney()">
    </div>
    <div style="margin-top: 34px;">
        <div style="margin-bottom: 0px;display: inline-block;margin-left: 0px;height: 102px">人头</div>
        <div class="personList" style="margin-left: -20px;">
            <div name={{user.name}} data-ng-repeat="user in users" ng-click="updateMoney(user)">
                {{user.chineseName}}{{user.money}}
            </div>
        </div>
    </div>
    <div class="confirm"><a id="submit" ng-click="submitOrder()">确认</a></div>
</div>

<form method="post" action="/moneyDetail" style="display: none" id="moneyDetailTable" data-ng-controller="FormController">
    <input name="{{form.name}}" type="{{form.type}}" data-ng-repeat="form in formOptions">
</form>

</body>
</html>