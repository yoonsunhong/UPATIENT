package retail.main.service;

import java.util.List;


public interface MainService {
	

	List<MainVO> selectMyBsMeasure(String pATIENT_CD) throws Exception;

	MainVO selectMyBsLastInfo(MainVO params) throws Exception;
	MainVO selectMyBsSevenDayInfo(MainVO params) throws Exception;

	MainVO getSelectHealthInfo(String pATIENT_CD) throws Exception;
	
	
}