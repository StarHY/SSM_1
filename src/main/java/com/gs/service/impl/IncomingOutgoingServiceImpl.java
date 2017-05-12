package com.gs.service.impl;

import com.gs.bean.IncomingOutgoing;
import com.gs.bean.User;
import com.gs.common.bean.Pager;
import com.gs.dao.IncomingOutgoingDAO;
import com.gs.service.IncomingOutgoingService;
import org.activiti.engine.impl.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 由CSWangBin技术支持
 *
 * @author CSWangBin
 * @des 收支表Service实现
 * @since 2017-04-17 15:59:07
 */
@Service
public class IncomingOutgoingServiceImpl implements IncomingOutgoingService {

    @Resource
    private IncomingOutgoingDAO incomingOutgoingDAO;

    public int insert(IncomingOutgoing incomingOutgoing) {
        return incomingOutgoingDAO.insert(incomingOutgoing);
    }

    public int batchInsert(List<IncomingOutgoing> list) {
        return incomingOutgoingDAO.batchInsert(list);
    }

    public int delete(IncomingOutgoing incomingOutgoing) {
        return incomingOutgoingDAO.delete(incomingOutgoing);
    }

    public int deleteById(String id) {
        return incomingOutgoingDAO.deleteById(id);
    }

    public int batchDelete(List<IncomingOutgoing> list) {
        return incomingOutgoingDAO.batchDelete(list);
    }

    public int update(IncomingOutgoing incomingOutgoing) {
        return incomingOutgoingDAO.update(incomingOutgoing);
    }

    public int batchUpdate(List<IncomingOutgoing> list) {
        return incomingOutgoingDAO.batchUpdate(list);
    }

    public List<IncomingOutgoing> queryAll(User user) {
        return incomingOutgoingDAO.queryAll(user);
    }

    @Override
    public List<IncomingOutgoing> queryAll(String status) {
        return incomingOutgoingDAO.queryAll(status);
    }

    public List<IncomingOutgoing> queryAll(User user,String status) {
        return incomingOutgoingDAO.queryAll(user);
    }


    public List<IncomingOutgoing> queryByStatus(String status) {
        return incomingOutgoingDAO.queryAll(status);
    }

    public IncomingOutgoing query(IncomingOutgoing incomingOutgoing) {
        return incomingOutgoingDAO.query(incomingOutgoing);
    }

    public IncomingOutgoing queryById(String id) {
        return incomingOutgoingDAO.queryById(id);
    }

    public List<IncomingOutgoing> queryByPager(Pager pager) {
        return incomingOutgoingDAO.queryByPager(pager);
    }

    public int count(User user) {
        return incomingOutgoingDAO.count(user);
    }

    public int inactive(String id) {
        return incomingOutgoingDAO.inactive(id);
    }

    public int active(String id) {
        return incomingOutgoingDAO.active(id);
    }


    public List<IncomingOutgoing> queryByPagerDisable(Pager pager) {
        return incomingOutgoingDAO.queryByPagerDisable(pager);
    }

    @Override
    public int countByDisable(User user) {
        return incomingOutgoingDAO.countByDisable();
    }

    public int countByDisable() {
        return incomingOutgoingDAO.countByDisable();
    }

    public List<IncomingOutgoing> queryByDate(String inOutType,String companyId) {
        return incomingOutgoingDAO.queryByDate(inOutType,companyId);
    }


    @Override
    public List<IncomingOutgoing> queryByCondition(String start, String end, String inOutType,String companyId,String type) {
        return incomingOutgoingDAO.queryByCondition(start, end,inOutType,companyId, type);
    }

    public List<IncomingOutgoing> blurredQuery(Pager pager, IncomingOutgoing incomingOutgoing) {
        return null;
    }

    @Override
    public int countByBlurred(IncomingOutgoing incomingOutgoing, User user) {
        return 0;
    }

    public int countByBlurred(IncomingOutgoing incomingOutgoing)
    {
        return 0;
    }
}