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
package retail.bloodGlucoseMst.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.text.StrBuilder;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import retail.bloodGlucoseMst.service.BloodGlucoseMstService;
import retail.bloodGlucoseMst.service.BloodGlucoseMstVO;
import retail.common.CommonUtil;
import retail.common.JqGridResult;
import retail.seed.SeedCipher;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

/**
 * @Class Name : BloodGlucoseMstController.java
 * @Description : 수동혈당 입력
 * @Modification Information @ @ 수정일 수정자 수정내용 @ --------- ---------
 * @author 문희훈
 * @since 2017. 10.17
 * @version 1.0
 * @see Copyright (C) by RETILTECH All right reserved.
 */

@Controller
public class BloodGlucoseMstController {

	@Autowired
	private BloodGlucoseMstService bloodGlucoseMstService;
	@Autowired
	private MessageSource messageSource;
	
	/** log */
	private final Log log = LogFactory.getLog(this.getClass());

	/**
	 * 혈당수동입력 화면이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/bloodGlucoseMst.do", method = RequestMethod.GET)
	public ModelAndView bloodGlucoseMst(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/bloodGlucoseMst/bloodGlucoseMst");
		return   mav; 
	}
	
	/**
	 * 측정시기목록 을 조회한다
	 * @param model
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/selectMeasurePointlList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void selectMeasurePoint(HttpServletRequest request, HttpServletResponse response) throws Exception{
		try{
			
			System.out.println(request.getParameter("LANG"));
			String lang = request.getParameter("LANG");
			List<BloodGlucoseMstVO> resultList = bloodGlucoseMstService.selectMeasurePointList(lang); 
			JqGridResult jqGridResult = new JqGridResult(resultList.size());
			
			for(BloodGlucoseMstVO bloodGlucoseMstVO:resultList){
				jqGridResult.addData(
						//key
						bloodGlucoseMstVO.getBS_MEASURE_POINT()
						,bloodGlucoseMstVO.getBS_MEASURE_POINT()
						, bloodGlucoseMstVO.getBS_MEASURE_POINT_NM()
								
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
	 * 혈당수동입력
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("restriction")
	@RequestMapping(value = "/insertBsMeasureInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> insertBsMeasureInfo(@RequestParam Map<String, Object> param, HttpServletRequest request, HttpServletResponse response)throws Exception {	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String PATIENT_CD    = CommonUtil.getEnv(request.getSession()).getPATIENT_CD();
		
		param.put("PATIENT_CD", PATIENT_CD);
		param.put("MEASURE_DT", param.get("MEASURE_DT").toString().replaceAll("-", ""));
		param.put("MEASURE_TIME", param.get("MEASURE_TIME").toString().replaceAll(":", "") + "00");
		
		
		//System.out.println(param.get("BS_MEASURE_VALUE"));
		//System.out.println(param.get("BS_MEASURE_DT"));
		//System.out.println(param.get("BS_MEASURE_TIME"));
		//System.out.println(param.get("BS_MEASURE_POINT"));
		
		
		//BloodGlucoseMstVO params;
		int result = bloodGlucoseMstService.insertBsMeasureInfo(param);
		
		map.put("RESULT", result);
		
		return map;
		
	}
	
	/**
	 * 혈당업데이트
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("restriction")
	@RequestMapping(value = "/updateBsMeasureInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> updateBsMeasureInfo(@RequestParam Map<String, Object> param, HttpServletRequest request, HttpServletResponse response)throws Exception {	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		param.put("MEASURE_DT", param.get("MEASURE_DT").toString().replaceAll("-", ""));
		param.put("MEASURE_TIME", param.get("MEASURE_TIME").toString().replaceAll(":", "") + "00");
		
		
		System.out.println(param.get("BS_MEASURE_VALUE"));
		System.out.println(param.get("MEASURE_DT"));
		System.out.println(param.get("MEASURE_TIME"));
		System.out.println(param.get("BS_MEASURE_POINT"));
				
		//BloodGlucoseMstVO params;
		
		int result = bloodGlucoseMstService.updateBsMeasureInfo(param);
		
		map.put("RESULT", result);
		
		return map;
		
	}
}





















