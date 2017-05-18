package com.gs.controller;

import ch.qos.logback.classic.Logger;
import com.gs.bean.*;
import com.gs.common.bean.ControllerResult;
import com.gs.common.util.RoleUtil;
import com.gs.common.util.SessionUtil;
import com.gs.controller.customerBooking.PhoneReservationController;
import com.gs.service.AppointmentService;
import com.gs.service.CompanyService;
import com.gs.service.MaintainDetailService;
import com.gs.service.MaintainRecordService;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 郭昶 on 2017/4/12.
 * 链接到前台页面
 */

@Controller
@RequestMapping("/")
public class
FrontpageController {

    private Logger logger = (Logger) LoggerFactory.getLogger(PhoneReservationController.class);

    @Resource
    private CompanyService companyService;

    @Resource
    private AppointmentService appointmentService;

    // 明细service
    @Resource
    private MaintainDetailService maintainDetailService;

    /*下载页面*/
    @RequestMapping(value ="platformIntro",method = RequestMethod.GET)
    public String Goplatform(){
        return "Frontpage/PlatformIntro";
    }

    /*主页面*/
    @RequestMapping(value ="home",method = RequestMethod.GET)
    public ModelAndView Home(HttpServletRequest request, HttpSession session){
        List<Company> company = companyService.queryAll((User)session.getAttribute("user"));
        request.setAttribute("company", company);
        ModelAndView mav = new ModelAndView("Frontpage/Frontindex");
        return mav;
    }

    /*商家列表页面*/
    @RequestMapping(value ="factorypage",method = RequestMethod.GET)
    public ModelAndView Homes(HttpServletRequest request, HttpSession session){
        List<Company> company = companyService.queryAll((User)session.getAttribute("user"));
        request.setAttribute("companypage", company);
        ModelAndView mav = new ModelAndView("Frontpage/Factorypage");
        return mav;
    }

    /*商家详情页面*/
    @RequestMapping(value = "factorydeta",method = RequestMethod.GET)
    public String deta(){

        return "Frontpage/Factorydeta";
    }




    /*预约页面*/
    @RequestMapping(value ="resepage",method=RequestMethod.GET)
    public String resepage(){
        return "Frontpage/resepage";
    }

    /*用户登录注册页面*/
    @RequestMapping(value ="reg",method = RequestMethod.GET)
    public String reg(){
        return "Frontpage/registered";
    }

    /*用户中心页面*/
    @RequestMapping(value ="userpage",method=RequestMethod.GET)
    public String userpage(){
        return "Frontpage/UserIndex";
    }

    /**
     * 添加预约
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "addfrontrese",method = RequestMethod.POST)
    public ControllerResult add(Appointment appointment, HttpSession session){
                User user = (User)session.getAttribute("frontUser");
                logger.info("添加电话预约");
                if (appointment != null) {
                    appointment.setCompanyId(user.getCompanyId());
                    appointment.setCurrentStatus("已预约");
                    appointmentService.insert(appointment);
                    return ControllerResult.getSuccessResult("预约成功");
                } else {
                    return ControllerResult.getFailResult("预约失败");
                }
            }
        }
