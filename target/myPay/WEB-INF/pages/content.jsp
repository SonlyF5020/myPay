<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html data-ng-app="contentApp">
<head>
    <link href="/resources/css/personPage.css" rel="stylesheet">
    <link href="/resources/css/myStyle.css" rel="stylesheet">
    <script src="/resources/js/jQuery-2.0.3.min.js"></script>
    <script src="/resources/js/angular.min.js"></script>
    <script>
        var payInfo = {
            eat_person: [],
            money: 0
        }
        $(function () {
            $(".function div").click(function () {
                $(".function div").css("background-color", "forestgreen");
                $(this).css("background-color", "#f19f0f");
            });

            $(".function div:first").click();

            var togglePerson = function() {
                var name = $(this).attr("name");
                if ($(this).hasClass("eat")) {
                    payInfo.eat_person.push(name);
                }
                else {
                    var index = payInfo.eat_person.indexOf(name);
                    if (index != -1) {
                        payInfo.eat_person.splice(index, 1);
                    }
                }
            }

            $(".personList div").click(function () {
                $(this).toggleClass("eat");
                togglePerson.call(this);
            });

            var initialUser = function () {
                var currentUser = $(".summary .person").attr("name");
                $(".personList div[name=" + currentUser + "]").hide();
            };

            (function ($) {
                $.fn.animateNumbers = function (stop, commas, duration, ease) {
                    return this.each(function () {
                        var $this = $(this);
                        var start = parseInt($this.text().replace(/,/g, ""));
                        commas = (commas === undefined) ? true : commas;
                        $({value: start}).animate({value: stop}, {
                            duration: duration == undefined ? 1000 : duration,
                            easing: ease == undefined ? "swing" : ease,
                            step: function () {
                                $this.text(Math.floor(this.value));
                                if (commas) {
                                    $this.text($this.text().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                                }
                            },
                            complete: function () {
                                if (parseInt($this.text()) !== stop) {
                                    $this.text(stop);
                                    if (commas) {
                                        $this.text($this.text().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
                                    }
                                }
                            }
                        });
                    });
                };
            })(jQuery);

            $('#submit').on('click', function (event) {
                $('.number span').animateNumbers(1000);
            });

            initialUser();
        });

        var contentApp = angular.module('contentApp' , []);

        var controllers = {};

        controllers.UserController = function($scope){
            $scope.users = [
                { name:'honglai' , chineseName:'红来'},
                { name:'mingming' , chineseName:'明明'},
                { name:'xuanzhou' , chineseName:'周旋'},
                { name:'juanchen' , chineseName:'镌宸'}
            ];
        };

        controllers.FunctionController = function($scope){
            $scope.functions = [
                { name:'买单' , url:'/todo'},
                { name:'还钱' , url:'/todo'},
                { name:'借钱' , url:'/todo'}
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

<div class="function_display">
    <div>
        <p style="margin-bottom: 0px;display: inline-block">金额</p>
        <input type="text" name="totalMoney"
               style="height: 40px;background-color: forestgreen;font-size: 25px;width: 100px;text-align: center;margin-left: 2px">
    </div>
    <div style="margin-top: 34px;" data-ng-controller="UserController">
        <div style="margin-bottom: 0px;display: inline-block;margin-left: 0px;height: 102px">人头</div>
        <div class="personList" style="margin-left: -20px;">
            <div name={{user.name}} data-ng-repeat="user in users" >{{user.chineseName}}</div>
        </div>
    </div>
    <div class="confirm"><a id="submit" style="color: #000000;text-decoration: none;cursor: pointer;">确认</a></div>
</div>
</body>
</html>