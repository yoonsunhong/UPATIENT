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
package retail.goalSettingBloodPressure.web;

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

import retail.goalSettingBloodPressure.service.GoalSettingBloodPressureService;
import retail.common.CommonUtil;

/**
 * @Class Name : GoalSettingBloodPressureController.java
 * @Description : 혈압 목표설정
 * @Modification Information @ @ 수정일 수정자 수정내용 @ --------- ---------
 * @author 박일호
 * @since 2017. 10.17
 * @version 1.0
 * @see Copyright (C) by RETILTECH All right reserved.
 */

@Controller
public class GoalSettingBloodPressureController {

	/*
	@Autowired
	private GoalSettingBloodPressureService goalSettingBloodPressureService;
	@Autowired
	private MessageSource messageSource;
	*/
	
	/** log */
	private final Log log = LogFactory.getLog(this.getClass());

	/**
	 * 혈압 목표설정
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/goalSettingBloodPressure.do", method = RequestMethod.GET)
	public ModelAndView goalSettingBloodPressure(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/goalSettingBloodPressure/goalSettingBloodPressure");
		return   mav; 
	}
}