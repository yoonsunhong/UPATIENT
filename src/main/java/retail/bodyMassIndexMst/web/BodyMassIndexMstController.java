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
package retail.bodyMassIndexMst.web;

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

import retail.bodyMassIndexMst.service.BodyMassIndexMstService;
import retail.common.CommonUtil;

/**
 * @Class Name : BodyMassIndexMstController.java
 * @Description : BMI 수동 입력
 * @Modification Information @ @ 수정일 수정자 수정내용 @ --------- ---------
 * @author 문희훈
 * @since 2017. 10.17
 * @version 1.0
 * @see Copyright (C) by RETILTECH All right reserved.
 */

@Controller
public class BodyMassIndexMstController {

	
	@Autowired
	private BodyMassIndexMstService bodyMassIndexMstService;
	@Autowired
	private MessageSource messageSource;
	
	
	/** log */
	private final Log log = LogFactory.getLog(this.getClass());

	/**
	 * BMI수동입력 화면이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/bodyMassIndexMst.do", method = RequestMethod.GET)
	public ModelAndView bodyMassIndexMst(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/bodyMassIndexMst/bodyMassIndexMst");
		return   mav; 
	}
	
	/**
	 * BMI수동밉력
	 * @param request
	 * @param response
	 * @return
	 * @throws exception
	 */
	@SuppressWarnings("restricton")
	@RequestMapping(value = "/insertBmiMeasureInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> InsertBmiMeasureInfo(@RequestParam Map<String, Object> param, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String PATIENT_CD = CommonUtil.getEnv(request.getSession()).getPATIENT_CD();
		String HEIGHT = param.get("HEIGHT").toString();
		String WEIGHT = param.get("WEIGHT").toString();
		String FAT_QY = param.get("FAT_QY").toString();
		
		double dBMI = Double.parseDouble(WEIGHT) / ((Double.parseDouble(HEIGHT)/100) * (Double.parseDouble(HEIGHT)/100));
		dBMI = Double.parseDouble(String.format("%.1f", dBMI));	
		String BMI = String.valueOf(dBMI);  
		
		double dFAT_RATE = (Double.parseDouble(FAT_QY) * 100) / Double.parseDouble(WEIGHT);
		dFAT_RATE = Double.parseDouble(String.format("%.1f", dFAT_RATE));
		String FAT_RATE = String.valueOf(dFAT_RATE);  
		
		System.out.println(BMI);
		System.out.println(FAT_RATE);
		
		param.put("PATIENT_CD", PATIENT_CD);
		param.put("MEASURE_DT", param.get("MEASURE_DT").toString().replaceAll("-", ""));
		param.put("MEASURE_TIME", param.get("MEASURE_TIME").toString().replaceAll(":", "") + "00");
		param.put("BMI", BMI);
		param.put("FAT_RATE", FAT_RATE);
		
		
		int result = bodyMassIndexMstService.insertBmiMeasureInfo(param);
		
		map.put("RESULT", result);
		
		return map;
	}
	
	/**
	 * BMI업데이트
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("restriction")
	@RequestMapping(value = "/updateBmiMeasureInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> updateBmiMeasureInfo(@RequestParam Map<String, Object> param, HttpServletRequest request, HttpServletResponse response)throws Exception {	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		param.put("MEASURE_DT", param.get("MEASURE_DT").toString().replaceAll("-", ""));
		param.put("MEASURE_TIME", param.get("MEASURE_TIME").toString().replaceAll(":", "") + "00");
		
				
		int result = bodyMassIndexMstService.updateBmiMeasureInfo(param);
		
		map.put("RESULT", result);
		
		return map;
		
	}
}









