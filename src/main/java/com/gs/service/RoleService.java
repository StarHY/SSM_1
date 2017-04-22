package com.gs.service;

import com.gs.bean.Permission;
import com.gs.bean.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
*由CSWangBin技术支持
*
*@author CSWangBin
*@since 2017-04-17 16:10:47
*@des 
*/
public interface RoleService extends BaseService<String, Role>{
    public List<Role> queryAll(String rolestatus);


}