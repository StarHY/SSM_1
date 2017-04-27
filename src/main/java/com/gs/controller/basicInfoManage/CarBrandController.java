package com.gs.controller.basicInfoManage;

import ch.qos.logback.classic.Logger;
import com.gs.bean.CarBrand;
import com.gs.bean.Checkin;
import com.gs.common.bean.ComboBox4EasyUI;
import com.gs.common.bean.ControllerResult;
import com.gs.common.bean.Pager;
import com.gs.common.bean.Pager4EasyUI;
import com.gs.common.util.UUIDUtil;
import com.gs.service.CarBrandService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 汽车品牌管理
 * Created by yaoyong on 2017/4/18.
 */
@Controller
@RequestMapping("/carBrand")
public class CarBrandController {

    private Logger logger = (Logger) LoggerFactory.getLogger(CarBrandController.class);

    @Resource
    private CarBrandService carBrandService;


    @ResponseBody
    @RequestMapping(value="queryByPagerCarBrand", method = RequestMethod.GET)
    public Pager4EasyUI<CarBrand> queryAll(@Param("pageNumber")String pageNumber, @Param("pageSize")String pageSize) {
        logger.info("分页查询所有汽车品牌");
        Pager pager = new Pager();
        pager.setPageNo(Integer.valueOf(pageNumber));
        pager.setPageSize(Integer.valueOf(pageSize));
        pager.setTotalRecords(carBrandService.count());
        List<CarBrand> carBrands = carBrandService.queryByPager(pager);
        return new Pager4EasyUI<CarBrand>(pager.getTotalRecords(), carBrands);
    }

    @ResponseBody
    @RequestMapping(value = "queryAllCarBrand",method = RequestMethod.GET)
    public List<ComboBox4EasyUI> queryAll(){
        logger.info("查询所有汽车品牌");
        List<CarBrand> carBrands = carBrandService.queryAll();
        List<ComboBox4EasyUI> comboxs = new ArrayList<ComboBox4EasyUI>();
        for(CarBrand c : carBrands){
                ComboBox4EasyUI comboBox4EasyUI = new ComboBox4EasyUI();
                comboBox4EasyUI.setId(c.getBrandId());
                comboBox4EasyUI.setText(c.getBrandName());
                comboxs.add(comboBox4EasyUI);
        }
        return comboxs;
    }

    /**
     * 查询所有被禁用的汽车品牌
     * @return
     */
    @ResponseBody
    @RequestMapping(value="queryByPagerDisable", method = RequestMethod.GET)
    public Pager4EasyUI<CarBrand> queryByPagerDisable(@Param("pageNumber")String pageNumber, @Param("pageSize")String pageSize) {
        logger.info("分页查询所有被禁用汽车品牌");
        Pager pager = new Pager();
        pager.setPageNo(Integer.valueOf(pageNumber));
        pager.setPageSize(Integer.valueOf(pageSize));
        pager.setTotalRecords(carBrandService.countByDisable());
        List<CarBrand> carBrands = carBrandService.queryByPagerDisable(pager);
        return new Pager4EasyUI<CarBrand>(pager.getTotalRecords(), carBrands);
    }

    @ResponseBody
    @RequestMapping(value = "addCarBrand",method = RequestMethod.POST)
    public ControllerResult add(CarBrand carBrand){
        if (carBrand != null && !carBrand.equals("")) {
            logger.info("添加汽车品牌");
            carBrandService.insert(carBrand);
            return ControllerResult.getSuccessResult("添加成功");
        }else {
            return ControllerResult.getFailResult("添加失败，请输入必要的信息");
        }
    }

    @ResponseBody
    @RequestMapping(value = "updateCarBrand",method = RequestMethod.POST)
    public ControllerResult update(CarBrand carBrand){
        if (carBrand != null && !carBrand.equals("")) {
            logger.info("修改汽车品牌");
            carBrandService.update(carBrand);
            return ControllerResult.getSuccessResult("修改成功");
        }else {
            return ControllerResult.getFailResult("修改失败，请输入必要的信息");
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
                carBrandService.active(id);
                logger.info("激活成功");
                return ControllerResult.getSuccessResult("激活成功");
            } else {
                carBrandService.inactive(id);
                logger.info("禁用成功");
                return ControllerResult.getSuccessResult("禁用成功");
            }
        } else {
            return ControllerResult.getFailResult("操作失败");
        }
    }

}
