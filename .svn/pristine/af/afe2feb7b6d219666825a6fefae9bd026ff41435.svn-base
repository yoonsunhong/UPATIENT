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
package retail.bloodPressureTimeView.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
import retail.bloodPressureTimeView.service.BloodPressureTimeViewService;
import retail.bloodPressureTimeView.service.BloodPressureTimeViewVO;
import retail.common.CommonUtil;
import retail.common.JqGridResult;

/**
 * @Class Name : BloodPressureTimeViewController.java
 * @Description : 혈압리포트-타임라인
 * @Modification Information @ @ 수정일 수정자 수정내용 @ --------- ---------
 * @author 박일호
 * @since 2018. 03.20
 * @version 1.0
 * @see Copyright (C) by RETILTECH All right reserved.
 */

@Controller
public class BloodPressureTimeViewController {

	@Autowired
	private BloodPressureTimeViewService bloodPressureTimeViewService;
	@Autowired
	private MessageSource messageSource;
	
	/** log */
	private final Log log = LogFactory.getLog(this.getClass());

	/**
	 * 혈압리포트-타임라인 화면이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/bloodPressureTimeView.do", method = RequestMethod.GET)
	public ModelAndView bloodPressureTimeView(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/bloodPressureTimeView/bloodPressureTimeView");
		return   mav; 
	}
	
	/**
	 * 혈압 타임라인목록 을 조회한다 
	 * @param model
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/selectBpTimeLinelList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void selectBpTimeLinelList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		try{
			HashMap<String, String> map = new HashMap<String, String>();
			
			String PATIENT_CD = CommonUtil.getEnv(request.getSession()).getPATIENT_CD();
			
			map.put("PATIENT_CD", PATIENT_CD);
			map.put("MEASURE_DT_FROM", request.getParameter("MEASURE_DT_FROM").toString().replaceAll("-", ""));	
			map.put("MEASURE_DT_TO", request.getParameter("MEASURE_DT_TO").toString().replaceAll("-", ""));
			map.put("SORT", "MEASURE_DT " + request.getParameter("SORT").toString());
			
			List<BloodPressureTimeViewVO> resultList = bloodPressureTimeViewService.selectBpTimeLinelList(map); 
			JqGridResult jqGridResult = new JqGridResult(resultList.size());
			
			for(BloodPressureTimeViewVO bloodPressureTimeViewVO:resultList){
				
				jqGridResult.addData(
						//key
						bloodPressureTimeViewVO.getROWNUM()
						,bloodPressureTimeViewVO.getMEASURE_SEQ()
						,bloodPressureTimeViewVO.getMEASURE_DT()
						,bloodPressureTimeViewVO.getMEASURE_TIME()
						,bloodPressureTimeViewVO.getSYSTOLE_MEASURE_VALUE()
						,bloodPressureTimeViewVO.getDIASTOLE_MEASURE_VALUE()
						,bloodPressureTimeViewVO.getHEART_RATE_MEASURE_VALUE()
						,bloodPressureTimeViewVO.getSYSTOLE_BP_STATE()
						,bloodPressureTimeViewVO.getDIASTOLE_BP_STATE()
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
	  * 혈압 수동입력화면으로 이동한다
	 */
	@RequestMapping(value = "/bloodPressureMstView.do", method = RequestMethod.POST)
	public String bloodPressureMstView(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("MEASURE_SEQ", request.getParameter("MEASURE_SEQ"));	
		map.put("MEASURE_DT", request.getParameter("MEASURE_DT"));
		map.put("MEASURE_TIME", request.getParameter("MEASURE_TIME"));
		map.put("SYSTOLE_MEASURE_VALUE", request.getParameter("SYSTOLE_MEASURE_VALUE"));
		map.put("DIASTOLE_MEASURE_VALUE", request.getParameter("DIASTOLE_MEASURE_VALUE"));
		map.put("HEART_RATE_MEASURE_VALUE", request.getParameter("HEART_RATE_MEASURE_VALUE"));
		
		model.addAttribute("map", map);
		
		return "retail/bloodPressureMst/bloodPressureMst";
	}
}
