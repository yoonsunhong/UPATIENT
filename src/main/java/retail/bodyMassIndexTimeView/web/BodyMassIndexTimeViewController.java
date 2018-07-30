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
package retail.bodyMassIndexTimeView.web;

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

import retail.bloodPressureTimeView.service.BloodPressureTimeViewVO;
import retail.bodyMassIndexMst.service.BodyMassIndexMstVO;
import retail.bodyMassIndexTimeView.service.BodyMassIndexTimeViewService;
import retail.bodyMassIndexTimeView.service.BodyMassIndexTimeViewVO;
import retail.common.CommonUtil;
import retail.common.JqGridResult;
import retail.seed.SeedCipher;

/**
 * @Class Name : BodyMassIndexTimeViewController.java
 * @Description : 혈압리포트-타임라인
 * @Modification Information @ @ 수정일 수정자 수정내용 @ --------- ---------
 * @author 박일호
 * @since 2018. 03.20
 * @version 1.0
 * @see Copyright (C) by RETILTECH All right reserved.
 */

@Controller
public class BodyMassIndexTimeViewController {

	@Autowired
	private BodyMassIndexTimeViewService bodyMassIndexTimeViewService;
	@Autowired
	private MessageSource messageSource;
	
	
	/** log */
	private final Log log = LogFactory.getLog(this.getClass());

	/**
	 * bmi리포트-타임라인 화면이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/bodyMassIndexTimeView.do", method = RequestMethod.GET)
	public ModelAndView bodyMassIndexTimeView(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/bodyMassIndexTimeView/bodyMassIndexTimeView");
		return   mav; 
	}
	
	/**
	 * bmi 타임라인목록 을 조회한다 
	 * @param model
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/selectBmiTimeLinelList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void selectBpTimeLinelList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		try{
			HashMap<String, String> map = new HashMap<String, String>();
			
			String PATIENT_CD = CommonUtil.getEnv(request.getSession()).getPATIENT_CD();
			
			map.put("PATIENT_CD", PATIENT_CD);
			map.put("MEASURE_DT_FROM", request.getParameter("MEASURE_DT_FROM").toString().replaceAll("-", ""));	
			map.put("MEASURE_DT_TO", request.getParameter("MEASURE_DT_TO").toString().replaceAll("-", ""));
			map.put("SORT", "MEASURE_DT " + request.getParameter("SORT").toString());
			
			List<BodyMassIndexTimeViewVO> resultList = bodyMassIndexTimeViewService.selectBmiTimeLinelList(map); 
			JqGridResult jqGridResult = new JqGridResult(resultList.size());
			
			for(BodyMassIndexTimeViewVO bodyMassIndexTimeViewVO:resultList){
				
				jqGridResult.addData(
						//key
						bodyMassIndexTimeViewVO.getROWNUM()
						,bodyMassIndexTimeViewVO.getMEASURE_SEQ()
						,bodyMassIndexTimeViewVO.getMEASURE_DT()
						,bodyMassIndexTimeViewVO.getMEASURE_TIME()
						,bodyMassIndexTimeViewVO.getWEIGHT()
						,bodyMassIndexTimeViewVO.getMUSCLE_QY()
						,bodyMassIndexTimeViewVO.getFAT_QY()
						,bodyMassIndexTimeViewVO.getFAT_RATE()
						,bodyMassIndexTimeViewVO.getBMI()
						,bodyMassIndexTimeViewVO.getBONE_QY()
						,bodyMassIndexTimeViewVO.getMOIST_QY()
						,bodyMassIndexTimeViewVO.getVIS_FAT_LVL()
						,bodyMassIndexTimeViewVO.getBMI_STATE()
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
	  * BMI 수동입력화면으로 이동한다
	 */
	@RequestMapping(value = "/bodyMassIndexMstView.do", method = RequestMethod.POST)
	public String bodyMassIndexMstView(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("MEASURE_SEQ", request.getParameter("MEASURE_SEQ"));	
		map.put("MEASURE_DT", request.getParameter("MEASURE_DT"));
		map.put("MEASURE_TIME", request.getParameter("MEASURE_TIME"));
		map.put("WEIGHT", request.getParameter("WEIGHT"));
		map.put("MUSCLE_QY", request.getParameter("MUSCLE_QY"));
		map.put("FAT_QY", request.getParameter("FAT_QY"));
		map.put("FAT_RATE", request.getParameter("FAT_RATE"));
		map.put("BMI", request.getParameter("BMI"));
		map.put("BONE_QY", request.getParameter("BONE_QY"));
		map.put("MOIST_QY", request.getParameter("MOIST_QY"));
		map.put("VIS_FAT_LVL", request.getParameter("VIS_FAT_LVL"));
		map.put("BMI_STATE", request.getParameter("BMI_STATE"));
		
		model.addAttribute("map", map);
		
		return "retail/bodyMassIndexMst/bodyMassIndexMst";
	}

}
