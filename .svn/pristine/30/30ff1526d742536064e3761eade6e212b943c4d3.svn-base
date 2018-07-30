/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package retail.goalSettingBloodGlucose.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import retail.goalSettingBloodGlucose.service.GoalSettingBloodGlucoseService;
import retail.goalSettingBloodGlucose.service.GoalSettingBloodGlucoseVO;





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

@Service("GoalSettingBloodGlucoseService")
public class  GoalSettingBloodGlucoseServiceImpl implements GoalSettingBloodGlucoseService {
	
	@Autowired
	private GoalSettingBloodGlucoseDao goalSettingbloodGlucoseDao;
	 
	
	private static final Logger LOGGER = LoggerFactory.getLogger(GoalSettingBloodGlucoseServiceImpl.class);
	
	
	@Override
	@Transactional
	public  GoalSettingBloodGlucoseVO selectBsGoalInfo(Map<String, Object> param) {
		return goalSettingbloodGlucoseDao.selectBsGoalInfo(param);
	}
	
	@Override
	@Transactional
	public int updateBsGoalInfo(Map<String, Object> param) {
		
		int result = 0;
		
		result = goalSettingbloodGlucoseDao.updateBsGoalInfo(param);
		
		//System.out.println(result);
		
		return result;
	}
}



