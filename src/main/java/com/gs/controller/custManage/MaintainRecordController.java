package com.gs.controller.custManage;

import ch.qos.logback.classic.Logger;
import com.gs.bean.MaintainRecord;
import com.gs.common.bean.ControllerResult;
import com.gs.common.bean.Pager;
import com.gs.common.bean.Pager4EasyUI;
import com.gs.service.MaintainRecordService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by XiaoQiao on 2017/4/24.
 */
@Controller
@RequestMapping("/maintainRecord")
public class MaintainRecordController {

    private Logger logger = (Logger) LoggerFactory.getLogger(MaintainRecordController.class);

    @Resource
    private MaintainRecordService maintainRecordService;

    @ResponseBody
    @RequestMapping("queryByPager")
    public Pager4EasyUI<MaintainRecord> queryByPager(@Param("pageNumber") String pageNumber, @Param("pageSize") String pageSize) {
        logger.info("分布查看维修保养记录");
        Pager pager = new Pager();
        pager.setPageNo(Integer.valueOf(pageNumber));
        pager.setPageSize(Integer.valueOf(pageSize));
        int count = maintainRecordService.count();
        pager.setTotalRecords(count);
        List<MaintainRecord> queryList = maintainRecordService.queryByPager(pager);
        return new Pager4EasyUI<MaintainRecord>(pager.getTotalRecords(), queryList);
    }

    @ResponseBody
    @RequestMapping("queryByPagerDisable")
    public Pager4EasyUI<MaintainRecord> queryByPagerDisable(@Param("pageNumber") String pageNumber, @Param("pageSize") String pageSize) {
        logger.info("分布查看已禁用的维修保养记录");
        Pager pager = new Pager();
        pager.setPageNo(Integer.valueOf(pageNumber));
        pager.setPageSize(Integer.valueOf(pageSize));
        int count = maintainRecordService.countDisable();
        pager.setTotalRecords(count);
        List<MaintainRecord> queryList = maintainRecordService.queryByPagerDisable(pager);
        return new Pager4EasyUI<MaintainRecord>(pager.getTotalRecords(), queryList);
    }

    @ResponseBody
    @RequestMapping("inactive/{recordId}")
    public int inactive(@PathVariable("recordId") String recordId) {
        logger.info("维修保养记录冻结");
        int inactive = maintainRecordService.inactive(recordId);
        return inactive;
    }

    @ResponseBody
    @RequestMapping("active/{recordId}")
    public int active(@PathVariable("recordId") String recordId) {
        logger.info("维修保养记录激活");
        int active = maintainRecordService.active(recordId);
        return active;
    }

    @ResponseBody
    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public ControllerResult insert(MaintainRecord maintainRecord) {
        logger.info("维修保养记录添加操作");
        maintainRecord.setStartTime(new Date());
        maintainRecord.setEndTime(new Date());
        maintainRecord.setRecordCreatedTime(new Date());
        maintainRecord.setPickupTime(new Date());
        maintainRecord.setActualEndTime(new Date());
        maintainRecordService.insert(maintainRecord);
        return ControllerResult.getSuccessResult("添加成功");
    }

    @ResponseBody
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public ControllerResult update(MaintainRecord maintainRecord) {
        logger.info("维修保养记录修改操作");
        maintainRecordService.update(maintainRecord);
        return ControllerResult.getSuccessResult("修改成功");
    }

    /**
     * 时间格式化
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD hh:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}