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
package retail.goalSettingBloodGlucose.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import retail.goalSettingBloodGlucose.service.GoalSettingBloodGlucoseService;
import retail.goalSettingBloodGlucose.service.GoalSettingBloodGlucoseVO;
import retail.common.CommonUtil;


/**
 * @Class Name : GoalSettingBloodGlucoseController.java
 * @Description : 혈당 목표설정
 * @Modification Information @ @ 수정일 수정자 수정내용 @ --------- ---------
 * @author 박일호
 * @since 2017. 10.17
 * @version 1.0
 * @see Copyright (C) by RETILTECH All right reserved.
 */

@Controller
public class GoalSettingBloodGlucoseController {

	@Autowired
	private GoalSettingBloodGlucoseService goalSettingBloodGlucoseService;
	@Autowired
	private MessageSource messageSource;
	
	
	/** log */
	private final Log log = LogFactory.getLog(this.getClass());

	/**
	 * 혈당 목표설정
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/goalSettingBloodGlucose.do", method = RequestMethod.GET)
	public ModelAndView goalSettingBloodGlucose(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/goalSettingBloodGlucose/goalSettingBloodGlucose");
		return   mav; 
	}
	
	/**
	 * 목표정보조회
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("restriction")
	@RequestMapping(value = "/selectBsGoalInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public void selectBsGoalInfo(@RequestParam Map<String, Object> param, HttpServletRequest request, HttpServletResponse response)throws Exception {	
		
		param.put("PATIENT_CD", CommonUtil.getEnv(request.getSession()).getPATIENT_CD());
		
		GoalSettingBloodGlucoseVO resultList = goalSettingBloodGlucoseService.selectBsGoalInfo(param);

		Gson gson =new Gson();
		String json = gson.toJson(resultList);
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");

		response.getWriter().print(json);
		
	}
	
	/**
	 * 목표정보업데이트
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("restriction")
	@RequestMapping(value = "/updateBsGoalInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> updateBsGoalInfo(@RequestParam Map<String, Object> param, HttpServletRequest request, HttpServletResponse response)throws Exception {	
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String PATIENT_CD = CommonUtil.getEnv(request.getSession()).getPATIENT_CD();
		
		param.put("PATIENT_CD", PATIENT_CD);
		
		int result = goalSettingBloodGlucoseService.updateBsGoalInfo(param);
		
		map.put("RESULT", result);
		
		return map;
		
	}
}









