package retail.activityTrandView.service;

import java.util.HashMap;
import java.util.List;


public interface ActivityTrandViewService {

		List<ActivityTrandViewVO> selectBpTimeLinelList(HashMap<String, String> map);
}