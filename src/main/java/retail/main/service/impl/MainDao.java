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
package retail.main.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import org.springframework.stereotype.Repository;

import retail.main.service.MainVO;

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
@Repository("MainDao")
public class MainDao extends EgovAbstractDAO {

	//최근 7일 혈당측정 정보 조회
	public List<MainVO> selectMyBsMeasure(String pATIENT_CD) throws Exception{
		return  (List<MainVO>) list("Main.selectMyBsMeasure", pATIENT_CD);
	}

	//최근측정
	public MainVO selectMyBsLastInfo(MainVO params)  throws Exception{
		return (MainVO) select("Main.selectMyBsLastInfo", params);
	}

	public MainVO selectMyBsSevenDayInfo(MainVO params) throws Exception{
		return (MainVO) select("Main.selectMyBsSevenDayInfo", params);
	}

	public MainVO getSelectHealthInfo(String pATIENT_CD) throws Exception{
		return (MainVO) select("Main.getSelectHealthInfo", pATIENT_CD);
	}
	

}
