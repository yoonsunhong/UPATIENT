package retail.bodyMassIndexTimeView.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import retail.bloodPressureTimeView.service.impl.BloodPressureTimeViewDao;
import retail.bloodPressureTimeView.service.impl.BloodPressureTimeViewServiceImpl;
import retail.bodyMassIndexTimeView.service.BodyMassIndexTimeViewService;
import retail.bodyMassIndexTimeView.service.BodyMassIndexTimeViewVO;


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

@Service("BodyMassIndexTimeViewService")
public class BodyMassIndexTimeViewServiceImpl  implements BodyMassIndexTimeViewService {
	
	@Autowired
	private BodyMassIndexTimeViewDao bodyMassIndexTimeViewDao;
	
	 
	
	private static final Logger LOGGER = LoggerFactory.getLogger(BodyMassIndexTimeViewServiceImpl.class);
	

	@Override
	@Transactional
	public List<BodyMassIndexTimeViewVO> selectBmiTimeLinelList(HashMap<String, String> map) {

		return bodyMassIndexTimeViewDao.selectBmiTimeLinelList(map);
	}
}