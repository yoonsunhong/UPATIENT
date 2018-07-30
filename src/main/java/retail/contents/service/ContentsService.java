package retail.contents.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import retail.login.service.LoginVO;


public interface ContentsService {

	int insertBtBloodGlucose(Map<String, Object> param);

	int insertMeasureDeviceInfo(Map<String, Object> param);

	int updateHealthInfo(Map<String, Object> param);

	List<ContentsVO> selectHealthMgtInfo(HashMap<String, String> map);

	int updateHealthMgtInfo(Map<String, Object> param) throws Exception;

	ContentsVO selectMyInfo(Map<String, Object> param);

	int updateMyInfo(Map<String, Object> param);

	List<LoginVO> getUserInfo(Map<String, Object> param);

	ContentsVO selectHealthInfo(Map<String, Object> param);
	
	
	
}