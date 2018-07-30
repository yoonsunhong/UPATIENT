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
package retail.activityTrandView.web;

import java.io.IOException;
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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import retail.activityTrandView.service.ActivityTrandViewService;
import retail.activityTrandView.service.ActivityTrandViewVO;
import retail.common.CommonUtil;
import retail.common.JqGridResult;
import retail.seed.SeedCipher;

/**
 * @Class Name : ActivityTrandViewController.java
 * @Description : 활동리포트-트렌드
 * @Modification Information @ @ 수정일 수정자 수정내용 @ --------- ---------
 * @author 박일호
 * @since 2018. 03.20
 * @version 1.0
 * @see Copyright (C) by RETILTECH All right reserved.
 */

@Controller
public class ActivityTrandViewController {

	/*
	@Autowired
	private ActivityTrandViewService activityTrandViewService;
	@Autowired
	private MessageSource messageSource;
	*/
	
	/** log */
	private final Log log = LogFactory.getLog(this.getClass());

	/**
	 * 활동리포트-트렌드 화면이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/activityTrandView.do", method = RequestMethod.GET)
	public ModelAndView activityTrandView(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/activityTrandView/activityTrandView");
		return   mav; 
	}
}
