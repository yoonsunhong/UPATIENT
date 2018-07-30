package retail.bloodGlucoseTrandView.service;

import java.util.HashMap;
import java.util.List;


public interface BloodGlucoseTrandViewService {

	List<BloodGlucoseTrandViewVO> selectMyBsMeasureTrandView(HashMap<String, Object> map);
	
	
	
}