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
package retail.bloodPressureTrandView.web;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import retail.bloodGlucoseTrandView.service.BloodGlucoseTrandViewVO;
import retail.bloodPressureTrandView.service.BloodPressureTrandViewService;
import retail.bloodPressureTrandView.service.BloodPressureTrandViewVO;
import retail.common.CommonUtil;
import retail.main.service.MainVO;

/**
 * @Class Name : BloodPressureTimeViewController.java
 * @Description : 혈압리포트-트랜드
 * @Modification Information @ @ 수정일 수정자 수정내용 @ --------- ---------
 * @author 박일호
 * @since 2018.03.21
 * @version 1.0
 * @see Copyright (C) by RETILTECH All right reserved.
 */

@Controller
public class BloodPressureTrandViewController {

	@Autowired
	private BloodPressureTrandViewService bloodPressureTrandViewService;
	@Autowired
	private MessageSource messageSource;
	
	
	/** log */
	private final Log log = LogFactory.getLog(this.getClass());

	/**
	 * 혈압리포트-트랜드 화면이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/bloodPressureTrandView.do", method = RequestMethod.GET)
	public ModelAndView bloodPressureTrandView(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/bloodPressureTrandView/bloodPressureTrandView");
		return   mav; 
	}	
	
	
	/**
	 * 혈당측정 트랜드뷰 데이터 조회
	 * @param MainVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/selectBpMeasureTrandView.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void selectBpMeasureTrandView( HttpServletRequest request,HttpServletResponse response)throws Exception {
			 
		String PATIENT_CD    = CommonUtil.getEnv(request.getSession()).getPATIENT_CD();
		String LAST_DAY    = request.getParameter("LAST_DAY");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("PATIENT_CD", PATIENT_CD);
		map.put("LAST_DAY", LAST_DAY);
		
		List<BloodPressureTrandViewVO> resultList;
		
		if(LAST_DAY.equals("10")){
			resultList = bloodPressureTrandViewService.selectBpMeasureTrandView10(map);
		}else{
			resultList = bloodPressureTrandViewService.selectBpMeasureTrandView(map);	
		}
		
		Gson gson =new Gson();
		String json = gson.toJson(resultList);
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");

		response.getWriter().print(json);
		//return json;
	}
}
