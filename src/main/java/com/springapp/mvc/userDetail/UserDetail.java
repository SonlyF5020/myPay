package com.springapp.mvc.userDetail;

import com.springapp.mvc.constant.UserConstant;

public class UserDetail {
    private UserConstant.User user;
    private double money;

    public UserDetail(UserConstant.User user) {
        this.user = user;
    }

    public void setMoney(double money) {
        this.money = money;
    }
}
