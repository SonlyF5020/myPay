package com.springapp.mvc.constant;

import com.google.common.base.Predicate;
import com.google.common.collect.Iterables;

import java.util.List;

import static com.google.common.collect.Lists.newArrayList;

public class UserConstant {

    public static List<User> userList = newArrayList(User.HONGLAI,User.JUANCHEN,User.MINGMING,User.XUANZHOU);

    public static String getChineseName(final String userID) {
        User targetUser = Iterables.find(newArrayList(User.values()), new Predicate<User>() {
            @Override
            public boolean apply(User user) {
                return user.getID().equals(userID);
            }
        });
        return targetUser==null? "陌生人" : targetUser.getChineseName();
    }

    public enum User{
        HONGLAI("honglai" , "红来"),
        JUANCHEN("juanchen" , "镌宸"),
        MINGMING("mingming" , "明明"),
        XUANZHOU("xuanzhou" , "周旋"),;
        private final String id;
        private final String chineseName;

        User(String id, String chineseName) {
            this.id = id;
            this.chineseName = chineseName;
        }

        public Object getID() {
            return id;
        }

        public String getChineseName() {
            return chineseName;
        }
    }
}
