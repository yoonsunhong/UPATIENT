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
package retail.contents.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import retail.bloodGlucoseTimeView.service.BloodGlucoseTimeViewVO;
import retail.contents.service.ContentsService;
import retail.contents.service.ContentsVO;
import retail.login.service.LoginVO;


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

@Service("ContentsService")
public class ContentsServiceImpl  implements ContentsService {

	@Autowired
	private ContentsDao contentsDao;
	 
	
	private static final Logger LOGGER = LoggerFactory.getLogger(ContentsServiceImpl.class);


	@Override
	@Transactional
	public int insertBtBloodGlucose(Map<String, Object> param) {
		return contentsDao.insertBtBloodGlucose(param);
	}


	@Override
	@Transactional
	public int insertMeasureDeviceInfo(Map<String, Object> param) {
		return contentsDao.insertMeasureDeviceInfo(param);
	}
	
	@Override
	@Transactional
	public int updateHealthInfo(Map<String, Object> param) {
		
		int result = 0;
		
		result = contentsDao.updateHealthInfo(param);
		
		//System.out.println(result);
		
		return result;
	}
	
	@Override
	@Transactional
	public List<ContentsVO> selectHealthMgtInfo(HashMap<String, String> map) {

		return contentsDao.selectHealthMgtInfo(map);
	}
	
	@Override
	@Transactional
	public int updateHealthMgtInfo(Map<String, Object> param) throws Exception{
		
		int result = 0;
		
		result = contentsDao.updateHealthMgtInfo(param);
		
		System.out.println(result);
		
		return result;
	}


	@Override
	@Transactional
	public ContentsVO selectMyInfo(Map<String, Object> param) {
		return contentsDao.selectMyInfo(param);
	}


	@Override
	@Transactional
	public int updateMyInfo(Map<String, Object> param) {
		return contentsDao.updateMyInfo(param);
	}


	@Override
	@Transactional
	public List<LoginVO> getUserInfo(Map<String, Object> param) {
		return contentsDao.getUserInfo(param);
	}


	@Override
	public ContentsVO selectHealthInfo(Map<String, Object> param) {
		return contentsDao.selectHealthInfo(param);
	}

}
