package com.gs.controller.systemManage;

import com.gs.bean.Module;
import com.gs.bean.Permission;
import com.gs.common.bean.ControllerResult;
import com.gs.common.util.UUIDUtil;
import com.gs.service.ModuleService;
import com.gs.service.PermissionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.FileOutputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 程燕
 * @create 2017-04-22 10:08
 * @des 模块管理
 */
@Controller
@RequestMapping("/module")
public class ModuleController {
    @Resource
    private PermissionService permissionService;
    @Resource
    private ModuleService moduleService;


    @ResponseBody
    @RequestMapping(value = "queryAll")
    public List<Module> queryAll(){
        return moduleService.queryAll("Y");
    }

    @ResponseBody
    @RequestMapping(value = "insert")
    public Map insert(Module module){
        Map map = new HashMap();
        module.setModuleId(UUIDUtil.uuid());
        int insertCount = moduleService.insert(module);
        if(checkInsertOneSuccess(insertCount)) {
            map.put("controllResult", ControllerResult.getSuccessResult("添加成功"));
            map.put("module", module);
        } else {
            map.put("controllResult", ControllerResult.getFailResult("添加失败"));
            map.put("module", null);
        }
        return map ;
    }

    @ResponseBody
    @RequestMapping(value = "edit")
    public Map edit(Module module) {
        int insertCount = moduleService.update(module);
        Map map = new HashMap();
        if (checkInsertOneSuccess(insertCount)) {
            map.put("controllResult", ControllerResult.getSuccessResult("修改成功"));
        } else {
            map.put("controllResult", ControllerResult.getFailResult("修改失败"));
        }
        return map;
    }


    @ResponseBody
    @RequestMapping(value = "delete")
    public ControllerResult delete(@RequestParam("moduleId") String moduleId) {
        Module module = new Module();
        module.setModuleId(moduleId);
        int deleteCount = moduleService.delete(module);
        moduleService.updPermissions(moduleId, null);
        if(checkInsertOneSuccess(deleteCount)) {
            return ControllerResult.getSuccessResult("删除成功");
        }
        return ControllerResult.getFailResult("删除失败");
    }


    @ResponseBody
    @RequestMapping(value = "updPer")
    public ControllerResult updPer(@RequestParam("moduleId") String moduleId,@RequestParam("permissionId") String permissionId) {
        int updPerCount = moduleService.updPermission(permissionId,moduleId);
        if(checkInsertOneSuccess(updPerCount)) {
            return ControllerResult.getSuccessResult("修改成功");
        }
        return ControllerResult.getFailResult("修改失败");
    }


    private boolean checkInsertOneSuccess(int resultCount){
        if(resultCount>0){
            return true;
        }
        return false;
    }

    private String[] idStrs2ids(String idStrs, String split) {
        return idStrs.split(split);
    }

}