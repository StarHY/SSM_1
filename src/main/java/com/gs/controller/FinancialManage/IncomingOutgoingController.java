package com.gs.controller.FinancialManage;

import ch.qos.logback.classic.Logger;
import com.gs.bean.IncomingType;
import com.gs.bean.User;
import com.gs.bean.echarts.IncomingOutInFo;
import com.gs.bean.IncomingOutgoing;
import com.gs.bean.echarts.QuarterUtil;
import com.gs.common.bean.ControllerResult;
import com.gs.common.bean.Echarts;
import com.gs.common.bean.Pager;
import com.gs.common.bean.Pager4EasyUI;
import com.gs.common.util.DateFormatUtil;
import com.gs.common.util.RoleUtil;
import com.gs.common.util.SessionUtil;
import com.gs.service.IncomingOutgoingService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by GZWangBin on 2017/4/20.
 */
@Controller
@RequestMapping("/incomingOutgoing")
public class IncomingOutgoingController {

    private Logger logger = (Logger) LoggerFactory.getLogger(IncomingOutgoingController.class);

    /**
     * 收入Service
     */
    @Resource
    public IncomingOutgoingService incomingOutgoingService;

    @ResponseBody
    @RequestMapping(value = "queryByPager", method = RequestMethod.GET)
    public Pager4EasyUI<IncomingOutgoing> queryByPager(HttpSession session, @Param("pageNumber") String pageNumber, @Param("pageSize") String pageSize) {
        if (SessionUtil.isLogin(session)) {
            String roles = "平台管理员,汽修公司管理员,汽修公司财务人员";
            if (RoleUtil.checkRoles(roles)) {
                logger.info("收支记录分页查询");
                Pager pager = new Pager();
                pager.setPageNo(Integer.valueOf(pageNumber));
                pager.setPageSize(Integer.valueOf(pageSize));
                pager.setUser((User) session.getAttribute("user"));
                pager.setTotalRecords(incomingOutgoingService.count((User) session.getAttribute("user")));
                List<IncomingOutgoing> incomingOutgoings = incomingOutgoingService.queryByPager(pager);
                return new Pager4EasyUI<IncomingOutgoing>(pager.getTotalRecords(), incomingOutgoings);
            } else {
                logger.info("此用户无拥有此方法的角色");
                return null;
            }
        } else {
            logger.info("请先登录");
            return null;
        }


    }

    @ResponseBody
    @RequestMapping(value = "queryByPagerDisable", method = RequestMethod.GET)
    public Pager4EasyUI<IncomingOutgoing> queryByPagerDisable(HttpSession session, @Param("pageNumber") String pageNumber, @Param("pageSize") String pageSize) {
        if (SessionUtil.isLogin(session)) {
            String roles = "平台管理员,汽修公司管理员,汽修公司财务人员";
            if (RoleUtil.checkRoles(roles)) {
                logger.info("禁用收支记录分页查询");
                Pager pager = new Pager();
                pager.setPageNo(Integer.valueOf(pageNumber));
                pager.setPageSize(Integer.valueOf(pageSize));
                pager.setUser((User) session.getAttribute("user"));
                pager.setTotalRecords(incomingOutgoingService.countByDisable((User) session.getAttribute("user")));
                List<IncomingOutgoing> incomingOutgoings = incomingOutgoingService.queryByPagerDisable(pager);
                return new Pager4EasyUI<IncomingOutgoing>(pager.getTotalRecords(), incomingOutgoings);
            } else {
                logger.info("此用户无拥有此方法的角色");
                return null;
            }
        } else {
            logger.info("请先登录");
            return null;
        }
    }

    /**
     * 对状态的激活和启用，只使用一个方法进行切换。
     */
    @ResponseBody
    @RequestMapping(value = "statusOperate", method = RequestMethod.POST)
    public ControllerResult inactive(String id, String status) {
        if (id != null && !id.equals("") && status != null && !status.equals("")) {
            if (status.equals("N")) {
                incomingOutgoingService.active(id);
                logger.info("激活成功");
                return ControllerResult.getSuccessResult("激活成功");
            } else {
                incomingOutgoingService.inactive(id);
                logger.info("禁用成功");
                return ControllerResult.getSuccessResult("禁用成功");
            }
        } else {
            return ControllerResult.getFailResult("操作失败");
        }
    }

    @ResponseBody
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public ControllerResult add(IncomingOutgoing incomingOutgoing) {
        logger.info("添加收支记录");
        incomingOutgoing.setCompanyId("1");
        incomingOutgoingService.insert(incomingOutgoing);
        return ControllerResult.getSuccessResult("添加成功");
    }


    @ResponseBody
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public ControllerResult update(IncomingOutgoing incomingOutgoing) {
        logger.info("修改收支记录");
        incomingOutgoingService.update(incomingOutgoing);
        return ControllerResult.getSuccessResult("修改成功");
    }


    @ResponseBody
    @RequestMapping(value = "queryByCondition")
    public List<IncomingOutInFo> queryByCondition(String start, String end, String type) {
        logger.info("按年月日周季查询财务报表");
        List<IncomingOutInFo> list = null;
        List<IncomingOutgoing> timeList = null;
        List<IncomingOutgoing> outList = null;
        List<IncomingOutgoing> inList = null;
        list = new ArrayList<IncomingOutInFo>();

        if (type != null && !type.equals("")) {
            if (type.equals("year")) {
                timeList = incomingOutgoingService.queryByCondition(start, end, "0", "810375d6-33a4-11e7-bbfe-b025aa1dfac1", "year");
                outList = incomingOutgoingService.queryByCondition(start, end, "1", "810375d6-33a4-11e7-bbfe-b025aa1dfac1", "year");
                inList = incomingOutgoingService.queryByCondition(start, end, "2", "810375d6-33a4-11e7-bbfe-b025aa1dfac1", "year");
                for (int p = 0; p < timeList.size(); p++) {
                    IncomingOutInFo io = new IncomingOutInFo();
                    String ag = DateFormatUtil.YearFormater(timeList.get(p).getInOutCreatedTime());
                    io.setDate(ag);
                    for (int j = 0; j < outList.size(); j++) {
                        String outTime = DateFormatUtil.YearFormater(outList.get(j).getInOutCreatedTime());
                        if (ag.equals(outTime)) {
                            io.setOutMoney(outList.get(j).getInOutMoney());
                            break;
                        } else {
                            io.setOutMoney(0.d);
                        }
                    }
                    for (int k = 0; k < inList.size(); k++) {
                        String inTime = DateFormatUtil.YearFormater(inList.get(k).getInOutCreatedTime());
                        if (ag.equals(inTime)) {
                            io.setInMoney(inList.get(k).getInOutMoney());
                            break;
                        } else {
                            io.setInMoney(0.d);
                        }
                    }
                    list.add(io);
                }
            } else if (type.equals("quarter")) {
                timeList = incomingOutgoingService.queryByCondition(start, end, "0", "810375d6-33a4-11e7-bbfe-b025aa1dfac1", "quarter");
                outList = incomingOutgoingService.queryByCondition(start, end, "1", "810375d6-33a4-11e7-bbfe-b025aa1dfac1", "quarter");
                inList = incomingOutgoingService.queryByCondition(start, end, "2", "810375d6-33a4-11e7-bbfe-b025aa1dfac1", "quarter");
                for (int p = 0; p < timeList.size(); p++) {
                    IncomingOutInFo io = new IncomingOutInFo();
                    String ag = DateFormatUtil.MonthFormater(timeList.get(p).getInOutCreatedTime());
                    QuarterUtil.quarter(ag);
                    io.setDate(ag);

                    for (int j = 0; j < outList.size(); j++) {
                        String outTime = DateFormatUtil.MonthFormater(outList.get(j).getInOutCreatedTime());
                        QuarterUtil.quarter(outTime);
                        if (ag.equals(outTime)) {
                            io.setOutMoney(outList.get(j).getInOutMoney());
                            break;

                        } else {
                            io.setOutMoney(0.d);
                        }
                    }
                    for (int k = 0; k < inList.size(); k++) {
                        String inTime = DateFormatUtil.MonthFormater(inList.get(k).getInOutCreatedTime());
                        QuarterUtil.quarter(inTime);
                        if (ag.equals(inTime)) {
                            io.setInMoney(inList.get(k).getInOutMoney());
                            break;

                        } else {
                            io.setInMoney(0.d);
                        }
                    }
                    list.add(io);
                }
            } else if (type.equals("month")) {
                timeList = incomingOutgoingService.queryByCondition(start, end, "0", "810375d6-33a4-11e7-bbfe-b025aa1dfac1", "month");
                outList = incomingOutgoingService.queryByCondition(start, end, "1", "810375d6-33a4-11e7-bbfe-b025aa1dfac1", "month");
                inList = incomingOutgoingService.queryByCondition(start, end, "2", "810375d6-33a4-11e7-bbfe-b025aa1dfac1", "month");
                for (int p = 0; p < timeList.size(); p++) {
                    IncomingOutInFo io = new IncomingOutInFo();
                    String ag = DateFormatUtil.MonthFormater(timeList.get(p).getInOutCreatedTime());

                    for (int j = 0; j < outList.size(); j++) {
                        String outTime = DateFormatUtil.MonthFormater(outList.get(j).getInOutCreatedTime());
                        if (ag.equals(outTime)) {
                            io.setOutMoney(outList.get(j).getInOutMoney());
                            break;
                        } else {
                            io.setOutMoney(0.d);
                        }
                    }
                    for (int k = 0; k < inList.size(); k++) {
                        String inTime = DateFormatUtil.MonthFormater(inList.get(k).getInOutCreatedTime());
                        if (ag.equals(inTime)) {
                            io.setInMoney(inList.get(k).getInOutMoney());
                            break;
                        } else {
                            io.setInMoney(0.d);

                        }
                    }
                    list.add(io);
                }
            } else if (type.equals("week"))

            {
                timeList = incomingOutgoingService.queryByCondition(start, end, "0", "810375d6-33a4-11e7-bbfe-b025aa1dfac1", "week");
                outList = incomingOutgoingService.queryByCondition(start, end, "1", "810375d6-33a4-11e7-bbfe-b025aa1dfac1", "week");
                inList = incomingOutgoingService.queryByCondition(start, end, "2", "810375d6-33a4-11e7-bbfe-b025aa1dfac1", "week");
                for (int p = 0; p < timeList.size(); p++) {
                    IncomingOutInFo io = new IncomingOutInFo();
                    String ag = DateFormatUtil.WEEK(timeList.get(p).getInOutCreatedTime());
                    String year = DateFormatUtil.YearFormater(timeList.get(p).getInOutCreatedTime());
                    String time = String.valueOf(Echarts.getWeek(ag));
                    String yearTime = time + year;
                    io.setDate(year + "第" + time + "周");
                    for (int j = 0; j < outList.size(); j++) {
                        String outTime = DateFormatUtil.WEEK(outList.get(j).getInOutCreatedTime());
                        String outYear = DateFormatUtil.YearFormater(outList.get(j).getInOutCreatedTime());
                        String out = String.valueOf(Echarts.getWeek(outTime));
                        String yearOut = out + outYear;
                        if (yearTime.equals(yearOut)) {
                            io.setOutMoney(outList.get(j).getInOutMoney());
                            break;
                        } else {
                            io.setOutMoney(0.d);
                        }
                    }
                    for (int k = 0; k < inList.size(); k++) {
                        String inTime = DateFormatUtil.WEEK(inList.get(k).getInOutCreatedTime());
                        String inYear = DateFormatUtil.YearFormater(inList.get(k).getInOutCreatedTime());
                        String in = String.valueOf(Echarts.getWeek(inTime));
                        String yearIn = in + inYear;
                        if (yearTime.equals(yearIn)) {
                            io.setInMoney(inList.get(k).getInOutMoney());
                            break;
                        } else {
                            io.setInMoney(0.d);

                        }
                    }
                    list.add(io);
                }
            } else if (type.equals("day"))

            {
                timeList = incomingOutgoingService.queryByCondition(start, end, "0", "810375d6-33a4-11e7-bbfe-b025aa1dfac1", "day");
                outList = incomingOutgoingService.queryByCondition(start, end, "1", "810375d6-33a4-11e7-bbfe-b025aa1dfac1", "day");
                inList = incomingOutgoingService.queryByCondition(start, end, "2", "810375d6-33a4-11e7-bbfe-b025aa1dfac1", "day");
                for (int p = 0; p < timeList.size(); p++) {
                    IncomingOutInFo io = new IncomingOutInFo();
                    String ag = DateFormatUtil.DayFormater(timeList.get(p).getInOutCreatedTime());
                    io.setDate(ag);
                    for (int j = 0; j < outList.size(); j++) {
                        String outTime = DateFormatUtil.DayFormater(outList.get(j).getInOutCreatedTime());
                        if (ag.equals(outTime)) {
                            io.setOutMoney(outList.get(j).getInOutMoney());
                            break;

                        } else {
                            io.setOutMoney(0.d);
                        }
                    }
                    for (int k = 0; k < inList.size(); k++) {
                        String inTime = DateFormatUtil.DayFormater(inList.get(k).getInOutCreatedTime());
                        if (ag.equals(inTime)) {
                            io.setInMoney(inList.get(k).getInOutMoney());
                            break;

                        } else {
                            io.setInMoney(0.d);
                        }
                    }
                    list.add(io);
                }
            }
        }
        return list;
    }

}
