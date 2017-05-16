package com.gs.dao;

import com.gs.bean.MaintainRecord;
import com.gs.bean.User;
import com.gs.common.bean.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
*由CSWangBin技术支持
*
*@author CSWangBin
*@since 2017-04-17 16:04:52
*@des 维修保养记录dao
*/
@Repository
public interface MaintainRecordDAO extends BaseDAO<String, MaintainRecord>{
    /**
     * 模糊查询
     */
    public List<MaintainRecord> blurredQuery(@Param("pager")Pager pager, @Param("maintainRecord")MaintainRecord maintainRecord);

    /**
     * 模糊查询的记录数
     */
    public int countByBlurred(@Param("maintainRecord")MaintainRecord maintainRecord, @Param("user")User user);
    /**
     * 模糊查询
     */
    public List<MaintainRecord> blurredQueryByRemind(@Param("pager")Pager pager, @Param("maintainRecord")MaintainRecord maintainRecord);

    /**
     * 模糊查询的记录数
     */
    public int countByBlurredByRemind(@Param("maintainRecord")MaintainRecord maintainRecord, @Param("user")User user);

    /**
     *  维修记录报表
     */
    public List<MaintainRecord> queryByCondition(@Param("start") String start,@Param("end") String end, @Param("companyId") String companyId,@Param("maintainOrFix")String maintainOrFix, @Param("type") String type);

    /**
     * 修改维修保养记录当前状态
     */
    public void updateCurrentStatus(@Param("currentStatus")String currentStatus, @Param("recordId")String recordId);

    /**
     * 提车提醒未提醒维修保养记录查询
     */
    public List<MaintainRecord> queryByPagerRemindNo(Pager pager);

    public int countByRemindNo(User user);

    /**
     * 提车提醒已提醒维修保养记录查询
     */
    public int countByRemindYes(User user);

    public List<MaintainRecord> queryByPagerRemindYes(Pager pager);

    public List<MaintainRecord> queryByPagerSix(@Param("pager")Pager pager, @Param("actualEndTime") String actualEndTime);

    public int countSix(@Param("actualEndTime") String actualEndTime);
}