<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<div class="function_display" data-ng-controller="UserController" name="pay">
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