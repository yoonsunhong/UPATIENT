package retail.activityTimeView.service;

import java.util.HashMap;
import java.util.List;


public interface ActivityTimeViewService {

		List<ActivityTimeViewVO> selectBpTimeLinelList(HashMap<String, String> map);
}