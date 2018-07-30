package retail.bloodPressureTimeView.service.impl;

import java.util.HashMap;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import retail.bloodPressureTimeView.service.BloodPressureTimeViewService;
import retail.bloodPressureTimeView.service.BloodPressureTimeViewVO;


/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Service("BloodPressureTimeViewService")
public class BloodPressureTimeViewServiceImpl  implements BloodPressureTimeViewService {
	
	@Autowired
	private BloodPressureTimeViewDao bloodPressureTimeViewDao;
	 
	
	private static final Logger LOGGER = LoggerFactory.getLogger(BloodPressureTimeViewServiceImpl.class);
	

	@Override
	@Transactional
	public List<BloodPressureTimeViewVO> selectBpTimeLinelList(HashMap<String, String> map) {

		return bloodPressureTimeViewDao.selectBpTimeLinelList(map);
	}
}