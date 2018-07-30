package retail.bodyMassIndexTimeView.service;

import java.util.HashMap;
import java.util.List;


public interface BodyMassIndexTimeViewService {

		List<BodyMassIndexTimeViewVO> selectBmiTimeLinelList(HashMap<String, String> map);
}