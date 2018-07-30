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
package retail.bodyMassIndexTrandView.web;

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

import retail.bodyMassIndexTrandView.service.BodyMassIndexTrandViewService;
import retail.bodyMassIndexTrandView.service.BodyMassIndexTrandViewVO;
import retail.common.CommonUtil;
import retail.main.service.MainVO;

/**
 * @Class Name : BodyMassIndexTimeViewController.java
 * @Description : BMI리포트-트랜드
 * @Modification Information @ @ 수정일 수정자 수정내용 @ --------- ---------
 * @author 박일호
 * @since 2018.03.21
 * @version 1.0
 * @see Copyright (C) by RETILTECH All right reserved.
 */

@Controller
public class BodyMassIndexTrandViewController {

	/*
	@Autowired
	private BodyMassIndexTrandViewService bodyMassIndexTrandViewService;
	@Autowired
	private MessageSource messageSource;
	*/
	
	/** log */
	private final Log log = LogFactory.getLog(this.getClass());

	/**
	 * BMI리포트-트랜드 화면이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/bodyMassIndexTrandView.do", method = RequestMethod.GET)
	public ModelAndView bodyMassIndexTrandView(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/bodyMassIndexTrandView/bodyMassIndexTrandView");
		return   mav; 
	}	
}
