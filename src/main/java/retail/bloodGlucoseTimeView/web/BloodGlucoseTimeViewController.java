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
package retail.bloodGlucoseTimeView.web;

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

import retail.bloodGlucoseMst.service.BloodGlucoseMstVO;
import retail.bloodGlucoseTimeView.service.BloodGlucoseTimeViewService;
import retail.bloodGlucoseTimeView.service.BloodGlucoseTimeViewVO;
import retail.common.CommonUtil;
import retail.common.JqGridResult;
import retail.seed.SeedCipher;

/**
 * @Class Name : BloodGlucoseTimeViewController.java
 * @Description : 혈당리포트-타임라인
 * @Modification Information @ @ 수정일 수정자 수정내용 @ --------- ---------
 * @author 문희훈
 * @since 2017. 10.17
 * @version 1.0
 * @see Copyright (C) by RETILTECH All right reserved.
 */

@Controller
public class BloodGlucoseTimeViewController {

	@Autowired
	private BloodGlucoseTimeViewService bloodGlucoseTimeViewService;
	@Autowired
	private MessageSource messageSource;
	
	/** log */
	private final Log log = LogFactory.getLog(this.getClass());

	/**
	 * 혈당리포트-타임라인 화면이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/bloodGlucoseTimeView.do", method = RequestMethod.GET)
	public ModelAndView bloodGlucoseTimeView(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/bloodGlucoseTimeView/bloodGlucoseTimeView");
		return   mav; 
	}
	
	/**
	 * 타임라인목록 을 조회한다 - 최초로딩
	 * @param model
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/selectBsTimeLinelList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void selectBsTimeLinelList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		try{
			HashMap<String, String> map = new HashMap<String, String>();
			
			String PATIENT_CD = CommonUtil.getEnv(request.getSession()).getPATIENT_CD();
			
			map.put("PATIENT_CD", PATIENT_CD);
			map.put("MEASURE_DT_FROM", request.getParameter("MEASURE_DT_FROM").toString().replaceAll("-", ""));	
			map.put("MEASURE_DT_TO", request.getParameter("MEASURE_DT_TO").toString().replaceAll("-", ""));
			map.put("SORT", "COMM_DT " + request.getParameter("SORT").toString());
			map.put("LANG", request.getParameter("LANG").toString());
			
			List<BloodGlucoseTimeViewVO> resultList = bloodGlucoseTimeViewService.selectBsTimeLinelList(map); 
			JqGridResult jqGridResult = new JqGridResult(resultList.size());
			
			for(BloodGlucoseTimeViewVO bloodGlucoseTimeViewVO:resultList){
				
				jqGridResult.addData(
						//key
						bloodGlucoseTimeViewVO.getROWNUM()
						,bloodGlucoseTimeViewVO.getMEASURE_SEQ()
						,bloodGlucoseTimeViewVO.getMEASURE_DT()
						,bloodGlucoseTimeViewVO.getMEASURE_TIME()
						,bloodGlucoseTimeViewVO.getBS_MEASURE_POINT()
						,bloodGlucoseTimeViewVO.getBS_MEASURE_POINT_NM()
						,bloodGlucoseTimeViewVO.getBS_MEASURE_VALUE()
						,bloodGlucoseTimeViewVO.getBS_MEASURE_UNIT()
						,bloodGlucoseTimeViewVO.getBS_STATE()
						);
			}
			
			String jsonStr = jqGridResult.getJsonString();
			response.setContentType("text/json;charset=utf-8");
			response.getWriter().print(jsonStr);
			
		}catch(IOException e){
			System.err.println("IOException Occured");
		}
	}
	
	/**
	  * 수동입력화면으로 이동한다
	 */
	@RequestMapping(value = "/bloodGlucoseMstView.do", method = RequestMethod.POST)
	public String bloodGlucoseMstView(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("MEASURE_SEQ", request.getParameter("MEASURE_SEQ"));	
		map.put("MEASURE_DT", request.getParameter("MEASURE_DT"));
		map.put("MEASURE_TIME", request.getParameter("MEASURE_TIME"));
		map.put("BS_MEASURE_POINT", request.getParameter("BS_MEASURE_POINT"));
		map.put("BS_MEASURE_VALUE", request.getParameter("BS_MEASURE_VALUE"));
		map.put("BS_MEASURE_UNIT", request.getParameter("BS_MEASURE_UNIT"));
		map.put("BS_STATE", request.getParameter("BS_STATE"));
		
		
		model.addAttribute("map", map);
		
		return "retail/bloodGlucoseMst/bloodGlucoseMst";
	}
	
}
