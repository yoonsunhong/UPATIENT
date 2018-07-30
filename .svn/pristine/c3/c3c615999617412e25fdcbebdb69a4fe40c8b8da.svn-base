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
package retail.bloodGlucoseReportView.web;

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

import retail.bloodGlucoseReportView.service.BloodGlucoseReportViewService;
import retail.common.CommonUtil;

/**
 * @Class Name : BloodGlucoseMstController.java
 * @Description : 혈당리포트-예후진단
 * @Modification Information @ @ 수정일 수정자 수정내용 @ --------- ---------
 * @author 문희훈
 * @since 2017. 10.17
 * @version 1.0
 * @see Copyright (C) by RETILTECH All right reserved.
 */

@Controller
public class BloodGlucoseReportViewController {

	@Autowired
	private BloodGlucoseReportViewService bloodGlucoseReportViewService;
	@Autowired
	private MessageSource messageSource;
	
	/** log */
	private final Log log = LogFactory.getLog(this.getClass());

	/**
	 * 혈당리포트-예후진단 화면이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/bloodGlucoseReportView.do", method = RequestMethod.GET)
	public ModelAndView bloodGlucoseReportView(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/bloodGlucoseReportView/bloodGlucoseReportView");
		return   mav; 
	}
	
}
