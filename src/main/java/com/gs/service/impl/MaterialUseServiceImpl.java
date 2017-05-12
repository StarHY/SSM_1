package com.gs.service.impl;

import com.gs.bean.*;
import com.gs.bean.view.*;
import com.gs.common.bean.Pager;
import com.gs.dao.MaterialUseDAO;
import com.gs.service.MaterialUseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
*由CSWangBin技术支持
*
*@author 程燕
*@since 2017-04-17 16:08:03
*@des 领料信息Service实现
*/
@Service
public class MaterialUseServiceImpl implements MaterialUseService {

	@Resource
	private MaterialUseDAO materialUseDAO;

	public int insert(MaterialUse materialUse) { return materialUseDAO.insert(materialUse); }
	public int batchInsert(List<MaterialUse> list) { return materialUseDAO.batchInsert(list); }
	public int delete(MaterialUse materialUse) { return materialUseDAO.delete(materialUse); }
	public int deleteById(String id) {
        return materialUseDAO.deleteById(id);
    }
	public int batchDelete(List<MaterialUse> list) { return materialUseDAO.batchDelete(list); }
	public int update(MaterialUse materialUse) { return materialUseDAO.update(materialUse); }
	public int batchUpdate(List<MaterialUse> list) { return materialUseDAO.batchUpdate(list); }
	public List<MaterialUse> queryAll(User user) { return materialUseDAO.queryAll(user); }

	@Override
	public List<MaterialUse> queryAll(String status) {
		return materialUseDAO.queryAll(status);
	}

	public List<MaterialUse> queryByStatus(String status) { return materialUseDAO.queryAll(status); }
	public MaterialUse query(MaterialUse materialUse) { return materialUseDAO.query(materialUse); }
	public MaterialUse queryById(String id) { return materialUseDAO.queryById(id); }
	public List<MaterialUse> queryByPager(Pager pager) { return materialUseDAO.queryByPager(pager); }
	public int count(User user) { return materialUseDAO.count(user); }
	public int inactive(String id) { return materialUseDAO.inactive(id); }
	public int active(String id) { return materialUseDAO.active(id); }

	public List<MaterialUse> queryByPagerDisable(Pager pager) {
		return materialUseDAO.queryByPagerDisable(pager);
	}

	public int countByDisable(User user) {
		return materialUseDAO.countByDisable(user);
	}

	public List<MaterialUse> blurredQuery(Pager pager, MaterialUse materialUse) {
		return null;
	}

	@Override
	public int countByBlurred(MaterialUse materialUse, User user) {
		return 0;
	}

	public int countByBlurred(MaterialUse materialUse) {
		return 0;
	}

	@Override
	public List<MaterialURTemp> histByPager(Pager pager) {
		return materialUseDAO.materialByPager(pager);
	}

	@Override
	public List<MaterialURTemp> userHistByPager(Pager pager, String userId) {
		return materialUseDAO.materialByPager(pager,userId);
	}

	@Override
	public int countHist() {
		return materialUseDAO.countMaterials();
	}

	@Override
	public int countUserHist(String userId) {
		return materialUseDAO.countMaterials(userId);
	}

	@Override
	public List<MaterialURTemp> queryUseFlowingbyPager(String flowName, String companyId, String roleId,Pager pager) {
		Map paramMap = new HashMap();
		paramMap.put("flowName",flowName);
		paramMap.put("companyId",companyId);
		paramMap.put("roleId",roleId);
		paramMap.put("isUse",true);
		paramMap.put("pager",pager);
		return  materialUseDAO.queryMaterialFlowingbyPager(paramMap);
	}

	@Override
	public int countUseFlowing(String flowName, String companyId,String roleId) {
		Map paramMap = new HashMap();
		paramMap.put("flowName",flowName);
		paramMap.put("companyId",companyId);
		paramMap.put("roleId",roleId);
		paramMap.put("isUse",true);
		return materialUseDAO.countMaterialFlowing(paramMap);
	}

	@Override
	public List<MaterialURTemp> queryReturnFlowingbyPager(String flowName, String companyId, String roleId, Pager pager) {
		Map paramMap = new HashMap();
		paramMap.put("flowName",flowName);
		paramMap.put("companyId",companyId);
		paramMap.put("roleId",roleId);
		paramMap.put("isUse",false);
		paramMap.put("pager",pager);
		return materialUseDAO.queryMaterialFlowingbyPager(paramMap);
	}

	@Override
	public int countReturnFlowing(String flowName, String companyId, String roleId) {
		Map paramMap = new HashMap();
		paramMap.put("roleId",roleId);
		paramMap.put("flowName",flowName);
		paramMap.put("companyId",companyId);
		paramMap.put("isUse",false);
		return materialUseDAO.countMaterialFlowing(paramMap);
	}

	@Override
	public List queryHistoryFlowingbyPager(String companyId, String flowName, String taskKey, Pager pager) {
		Map paramMap = new HashMap();
		paramMap.put("companyId", companyId);
		paramMap.put("flowName", flowName);
		paramMap.put("taskKey", taskKey);
		paramMap.put("pager", pager);
		return materialUseDAO.queryHistoryFlowingbyPager(paramMap);
	}

	@Override
	public int countHistoryFlowing(String companyId, String flowName) {
		Map paramMap = new HashMap();
		paramMap.put("companyId", companyId);
		paramMap.put("flowName", flowName);
		return materialUseDAO.countHistoryFlowing(paramMap);
	}

    @Override
    public List queryUserFlowingByPager(String flowName, String userId, String reviewTaskName, Pager pager) {
        Map paramMap = new HashMap();
        paramMap.put("flowName", flowName);
        paramMap.put("userId", userId);
        paramMap.put("reviewTaskName", reviewTaskName);
        paramMap.put("pager", pager);
        return materialUseDAO.queryUserFlowingByPager(paramMap);
    }

    @Override
    public int countUserFlowing(String flowName, String userId) {
        Map paramMap = new HashMap();
        paramMap.put("flowName", flowName);
        paramMap.put("userId", userId);
        return materialUseDAO.countUserFlowing(paramMap);
    }


    /**
	 *
	 * 不是应该放在这个Bean中的,但是会与其他人的有碰撞,所以放在这里
	 *
	 */
	@Override
	public List<RecordBaseView> queryNoUseRecord(String companyId, Pager pager) {
		return materialUseDAO.queryCurRecordsByPager(companyId,"", pager);
	}
	@Override
	public List<RecordBaseView> queryHasUseRecord(String companyId, Pager pager) {
		return materialUseDAO.queryCurRecordsByPager(companyId,"Y",pager);
	}
	@Override
	public int countNoUseRecord(String companyId) {
		return materialUseDAO.countNoUseRecord(companyId);
	}
	@Override
	public List<User> companyEmps(String companyId){
		return materialUseDAO.companyEmps(companyId);
	}

	@Override
	public int insertWorkInfo(WorkInfo workInfo) {
		return materialUseDAO.insertWorkInfo(workInfo);
	}

	@Override
	public List<WorkView> userWorksByPager(String userId, Pager pager) {
		return materialUseDAO.userWorksByPager(userId,pager);
	}

	@Override
	public List<WorkView> userWorksStatusByPager(String userId, String status, Pager pager) {
		return materialUseDAO.userWorksByPager(userId,status,pager);
	}

	@Override
	public int countUserWorks(String userId) {
		return materialUseDAO.countUserWorks(userId);
	}

	@Override
	public int countUserWorksStatus(String userId, String status) {
		return materialUseDAO.countUserWorks(userId,status);
	}

	@Override
	public boolean recordIsDisp(String recordId) {
		WorkInfo workInfo = materialUseDAO.queryWorkInfoByRecordId(recordId);
		if(workInfo!=null)
			return true;
		return false;

	}

	@Override
	public List<DetailTemp> queryDetailsByRecordId(String recordId, String companyId, Pager pager) {
		return materialUseDAO.queryDetailsByRecordId(recordId,companyId, pager);
	}

	@Override
	public int countDetailsByRecordId(String recordId, String companyId) {
		return materialUseDAO.countDetailsByRecordId(recordId,companyId);
	}

	@Override
	public int updWorkInfoUser(String recordId, String userId) {
		return materialUseDAO.updWorkInfoUser(recordId, userId);
	}

    @Override
    public Accessories accQueryById(String accId) {
        return materialUseDAO.accQueryById(accId);
    }


    private class Flag{
		private  String flag;
		private String id;

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getFlag() {
			return flag;
		}

		public void setFlag(String flag) {
			this.flag = flag;
		}
}


}