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

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import org.springframework.stereotype.Repository;

import retail.bloodGlucoseTimeView.service.BloodGlucoseTimeViewVO;
import retail.contents.service.ContentsVO;
import retail.login.service.LoginVO;


/**
 * @Class Name : SampleDAO.java
 * @Description : Sample DAO Class
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

@SuppressWarnings("unchecked")
@Repository("ContentsDao")
public class ContentsDao extends EgovAbstractDAO {

	/**
	 * 3)	블루투스 혈당 측정 등록
	 * @param param
	 * @return
	 */
	public int insertBtBloodGlucose(Map<String, Object> param) {
		return update("contents.insertBtBloodGlucose", param);
	}

	public int insertMeasureDeviceInfo(Map<String, Object> param) {
		return update("contents.insertMeasureDeviceInfo", param);
	}

	public int updateHealthInfo(Map<String, Object> param) {
		return update("contents.updateHealthInfo", param);
	}

	public List<ContentsVO> selectHealthMgtInfo(HashMap<String, String> map) {
		return (List<ContentsVO>) list("contents.selectHealthMgtInfo", map);
	}

	public int updateHealthMgtInfo(Map<String, Object> param)  throws Exception{
		return update("contents.updateHealthMgtInfo", param);
	}

	public ContentsVO selectMyInfo(Map<String, Object> param) {
		return (ContentsVO) select("contents.selectMyInfo", param);
	}

	public int updateMyInfo(Map<String, Object> param) {
		return update("contents.updateMyInfo", param);
	}

	public List<LoginVO> getUserInfo(Map<String, Object> param) {
		return (List<LoginVO>) list("contents.getUserInfo", param);
	}
	
	public ContentsVO selectHealthInfo(Map<String, Object> param){
		return (ContentsVO) select("contents.selectHealthInfo", param);
		
	}

}
