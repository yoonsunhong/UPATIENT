package retail.bloodGlucoseTimeView.service;

import java.util.HashMap;
import java.util.List;


public interface BloodGlucoseTimeViewService {

		List<BloodGlucoseTimeViewVO> selectBsTimeLinelList(HashMap<String, String> map);
}