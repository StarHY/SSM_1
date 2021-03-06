package com.gs.dao;

import com.gs.bean.Checkin;
import com.gs.bean.IncomingType;
import com.gs.bean.OutgoingType;
import com.gs.common.bean.Pager;
import com.gs.common.bean.Pager4EasyUI;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
*由CSWangBin技术支持
*
*@author CSWangBin
*@since 2017-04-17 16:10:12
*@des 模块表dao
*/
@Repository
public interface OutgoingTypeDAO extends BaseDAO<String, OutgoingType>{
    /**
     * 分页查询被禁用的记录
     */
    public List<OutgoingType> queryByPagerDisable(Pager pager);
    /**
     * 分页查询被禁用的记录
     */
    public int countByDisable();

    public OutgoingType queryById(@Param("outTypeName")String outTypeName, @Param("outTypeId")String outTypeId);
}