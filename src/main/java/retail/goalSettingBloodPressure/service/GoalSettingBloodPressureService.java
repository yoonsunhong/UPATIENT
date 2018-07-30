package retail.goalSettingBloodPressure.service;

import java.util.List;
import java.util.Map;

import retail.login.service.LoginVO;


public interface GoalSettingBloodPressureService {
	
	int insertBmiMeasureInfo(Map<String, Object> param);

	int updateBmiMeasureInfo(Map<String, Object> param);
	
}