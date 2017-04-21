package com.gs.service;

import com.gs.bean.AccessoriesBuy;
import com.gs.common.bean.Pager;

import java.util.List;

/**
*由CSWangBin技术支持
*
*@author CSWangBin
*@since 2017-04-17 15:44:49
*@des 配件采购Service
*/
public interface AccessoriesBuyService extends BaseService<String, AccessoriesBuy>{
    /**
     * 分页查询被禁用的记录
     */
    public List<AccessoriesBuy> queryByPagerDisable(Pager pager);
    /**
     * 分页查询被禁用的记录
     */
    public int countByDisable();
}