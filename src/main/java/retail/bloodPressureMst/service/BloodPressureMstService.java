package retail.bloodPressureMst.service;

import java.util.List;
import java.util.Map;

import retail.login.service.LoginVO;


public interface BloodPressureMstService {
	
	int insertBpMeasureInfo(Map<String, Object> param);

	int updateBpMeasureInfo(Map<String, Object> param);
	
}