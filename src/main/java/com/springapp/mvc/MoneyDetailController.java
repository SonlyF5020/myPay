package com.springapp.mvc;

import com.springapp.mvc.constant.UserConstant;
import com.springapp.mvc.persistence.PersistenceUserStore;
import com.springapp.mvc.userDetail.UserDetail;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.SQLException;
import java.util.List;

import static com.google.common.collect.Lists.newArrayList;


@Controller
public class MoneyDetailController {

    @RequestMapping(value = "/moneyDetail", method = RequestMethod.POST)
    public String create(@RequestParam("money") String money,
                         @RequestParam("payer") String payer,
                         @RequestParam("payerScore") String payerScore,
                         @RequestParam("m_honglai") String m_honglai,
                         @RequestParam("m_mingming") String m_mingming,
                         @RequestParam("m_xuanzhou") String m_xuanzhou,
                         @RequestParam("m_juanchen") String m_juanchen,
                         Model model) throws SQLException {

        List<UserDetail> userDetailList = newArrayList();
        List<String> userMoney = newArrayList(m_honglai, m_juanchen, m_mingming, m_xuanzhou);
        List<UserConstant.User> userList = UserConstant.userList;

        for (int indx = 0; indx < userList.size(); indx++) {
            UserConstant.User user = userList.get(indx);
            UserDetail userDetail = new UserDetail(user);
            userDetail.setMoney(Double.parseDouble(userMoney.get(indx)));
            userDetailList.add(userDetail);
        }

        PersistenceUserStore.add(userDetailList);

        model.addAttribute("totalMoney", money);
        model.addAttribute("payer", payer);
        model.addAttribute("payerChineseName", UserConstant.getChineseName(payer));
        model.addAttribute("payerScore", payerScore);
        return "paySuccess";
    }

}
