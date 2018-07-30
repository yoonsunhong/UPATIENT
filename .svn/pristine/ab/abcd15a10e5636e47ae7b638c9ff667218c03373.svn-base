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
package retail.contents.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import retail.bloodGlucoseMst.service.BloodGlucoseMstService;
import retail.bloodGlucoseMst.service.BloodGlucoseMstVO;
import retail.bloodGlucoseTimeView.service.BloodGlucoseTimeViewVO;
import retail.bloodPressureMst.service.BloodPressureMstService;
import retail.common.CommonUtil;
import retail.common.JqGridResult;
import retail.common.SessionModel;
import retail.contents.service.ContentsService;
import retail.contents.service.ContentsVO;
import retail.login.service.LoginVO;
import retail.main.service.MainVO;
import retail.seed.SeedCipher;

/**
 * @Class Name : BloodGlucoseTimeViewController.java
 * @Description : 컨텐츠 페이지
 * @Modification Information @ @ 수정일 수정자 수정내용 @ --------- ---------
 * @author 문희훈
 * @since 2017. 10.17
 * @version 1.0
 * @see Copyright (C) by RETILTECH All right reserved.
 */

@Controller
public class ContentsController {

	@Autowired
	private ContentsService contentsService;
	@Autowired
	private MessageSource messageSource;
	

	@Autowired
	private BloodGlucoseMstService bloodGlucoseMstService;
	
	@Autowired
	private BloodPressureMstService bloodPressureMstService;
	
	
	
	/** log */
	private final Log log = LogFactory.getLog(this.getClass());
	/**
	 * 비밀번호찾기 화면이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/finePassMst.do", method = RequestMethod.GET)
	public ModelAndView finePassMst(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/contents/finePassMst");
		return   mav; 
	}
	
	
	/**
	 * 개인정보취급방침  화면이동(NO로그인)
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/noLoginprivacyStatement.do", method = RequestMethod.GET)
	public ModelAndView noLoginprivacyStatement(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/contents/noLoginprivacyStatement");
		return   mav; 
	}
	/**
	 * 개인정보취급방침  화면이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/privacyStatement.do", method = RequestMethod.GET)
	public ModelAndView privacyStatement(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/contents/privacyStatement");
		return   mav; 
	}	
	
	/**
	 * 사용자정보 화면이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/userInfoMst.do", method = RequestMethod.GET)
	public ModelAndView userInfoMst(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/contents/userInfoMst");
		return   mav; 
	}	
	
	/**
	 * 건강정보 화면이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/healthView.do", method = RequestMethod.GET)
	public ModelAndView healthView(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/contents/healthView");
		return   mav; 
	}	
	
	/**
	 * 관리항목 화면이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/healthManagement.do", method = RequestMethod.GET)
	public ModelAndView healthManagement(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/contents/healthManagement");
		return   mav; 
	}	
	
	/**
	 * 언어 화면이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/languageMst.do", method = RequestMethod.GET)
	public ModelAndView languageMst(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/contents/languageMst");
		return   mav; 
	}	
	
	
	/**
	 * 버전 화면이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/version.do", method = RequestMethod.GET)
	public ModelAndView version(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/contents/version");
		return   mav; 
	}	
	
	/**
	 * 목표설정 화면이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/UseManual.do", method = RequestMethod.GET)
	public ModelAndView UseManual(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/contents/UseManual");
		return   mav; 
	} 
	
	/**
	 * 비밀번호 변경 이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/goPassChange.do", method = RequestMethod.GET)
	public ModelAndView goPassChange(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/contents/goPassChange");
		return   mav; 
	}	
	
	
	
	
	/**
	 * 블루투스 혈당기 사용자 등록 (APP연동 API)
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("restriction")
	@RequestMapping(value="/insertMeasureDeviceInfo.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object> insertMeasureDeviceInfo(@RequestParam Map<String, Object> param, HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		/*System.out.println(param.get("MEASURE_DEVICE_ESNTL_NO"));
		System.out.println(param.get("PATIENT_CD"));
		System.out.println(param.get("DISEASE_CD"));
		System.out.println(param.get("MEASURE_DEVICE_CD"));*/
		
		
		if( param.get("MEASURE_DEVICE_ESNTL_NO") == null || param.get("PATIENT_CD") == null || param.get("DISEASE_CD")==null ||  param.get("MEASURE_DEVICE_CD") == null )	{
			System.out.println("필수값이 없습니다.");
			map.put("RESULT", 99);
			map.put("MSG", "필수값이 없습니다.");
			
		}else{
			System.out.println("필수값이 모두 존재 합니다.");
			
			int result = 1;
			try {
				//사용자 기기 등록
				result = contentsService.insertMeasureDeviceInfo(param);
			} catch (Exception e) {
				result = 0;
			}
			
			System.out.println(result);
			if(result == 1){
				map.put("RESULT", 1);
				map.put("MSG", "등록이 완료되었습니다.");
			}else{
				map.put("RESULT", 0);
				map.put("MSG", "등록이 실패되었습니다. 관리자에게 문의 하세요.");
			}
			
		}
		
		return map;
		
	}
	
	/**
	 * 블루투스 혈당 측정 등록 (APP연동 API)
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("restriction")
	@RequestMapping(value="/insertBtBloodGlucose.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object> insertBtBloodGlucose(@RequestParam Map<String, Object> param, HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		/*System.out.println(param.get("PATIENT_CD"));
		System.out.println(param.get("DISEASE_CD"));
		System.out.println(param.get("BS_MEASURE_VALUE"));
		System.out.println(param.get("BS_MEASURE_UNIT"));
		System.out.println(param.get("BS_MEASURE_DT"));
		System.out.println(param.get("BS_MEASURE_TIME"));
		System.out.println(param.get("BS_MEASURE_POINT"));
		System.out.println(param.get("WEIGHT"));
		System.out.println(param.get("WEIGHT_UNIT"));*/
		
		if(param.get("PATIENT_CD") == null
			|| param.get("BS_MEASURE_VALUE") == null
			|| param.get("BS_MEASURE_DT") == null 
			|| param.get("BS_MEASURE_TIME") == null 
			|| param.get("BS_MEASURE_POINT") == null 			
//			|| param.get("DISEASE_CD")==null
//			|| param.get("BS_MEASURE_UNIT") == null 
//			|| param.get("WEIGHT") == null 
//			|| param.get("WEIGHT_UNIT") == null 
			)
		{
			System.out.println("필수값이 없습니다.");
			map.put("RESULT", 99);
			map.put("MSG", "필수값이 없습니다.");
			
		}else{
			System.out.println("필수값이 모두 존재 합니다.");
			
//			//KEY는 반드시 16byte로 맞추어야 한다. SEED암호화 법칙
//			String key = "ureka_20_project";
//			StringBuilder trace = new StringBuilder();
//			
//			SeedCipher seed = new SeedCipher();
//			
//			//측정값, 체중 암호화
//			@SuppressWarnings("unused")
//			//String measureValue = Base64.encode(seed.encrypt((String) param.get("BS_MEASURE_VALUE"), key.getBytes(), "UTF-8"));
//			String weight = Base64.encode(seed.encrypt((String) param.get("WEIGHT"), key.getBytes(), "UTF-8"));
//			
//
//			//param.put("BS_MEASURE_VALUE", measureValue);
//			param.put("WEIGHT", weight);
			
			// DB record명이 변경되어 parameter에 추가로 넣는 작업 진행 
			// BS_MEASURE_DT -> MEASURE_DT
			// BS_MEASURE_TIME -> MEASURE_TIME
			param.put("MEASURE_DT", param.get("BS_MEASURE_DT").toString().replaceAll("-", ""));
			param.put("MEASURE_TIME", param.get("BS_MEASURE_TIME").toString().replaceAll(":", ""));
			
			int result = 1;
			try {
				//result = contentsService.insertBtBloodGlucose(param);
				result = bloodGlucoseMstService.insertBsMeasureInfo(param);
			} catch (Exception e) {
				result = 0;
			}
			
			System.out.println(result);
			if(result == 1){
				map.put("RESULT", 1);
				map.put("MSG", "등록이 완료되었습니다.");
			}else{
				map.put("RESULT", 0);
				map.put("MSG", "등록이 실패되었습니다. 관리자에게 문의 하세요.");
			}
		}
		return map;
	}
	
	/**
	 * 블루투스 혈압 측정 등록 (APP연동 API)
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("restriction")
	@RequestMapping(value="/insertBtBloodPressure.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object> insertBtBloodPressure(@RequestParam Map<String, Object> param, HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		System.out.println(param.get("PATIENT_CD"));
		System.out.println(param.get("SYSTOLE_MEASURE_VALUE"));
		System.out.println(param.get("DIASTOLE_MEASURE_VALUE"));
		System.out.println(param.get("HEART_RATE_MEASURE_VALUE"));
		System.out.println(param.get("MEASURE_DT"));
		System.out.println(param.get("MEASURE_TIME"));
		
		if(param.get("PATIENT_CD") == null
			|| param.get("SYSTOLE_MEASURE_VALUE") == null
			|| param.get("DIASTOLE_MEASURE_VALUE") == null 
			|| param.get("HEART_RATE_MEASURE_VALUE") == null 
			|| param.get("MEASURE_DT") == null 			
			|| param.get("MEASURE_TIME")==null )
		{
			System.out.println("필수값이 없습니다.");
			map.put("RESULT", 99);
			map.put("MSG", "필수값이 없습니다.");
			
		}else{
			System.out.println("필수값이 모두 존재 합니다.");
			
			int result = 1;
			try {
				result = bloodPressureMstService.insertBpMeasureInfo(param);
			} catch (Exception e) {
				result = 0;
			}
			
			System.out.println(result);
			if(result == 1){
				map.put("RESULT", 1);
				map.put("MSG", "등록이 완료되었습니다.");
			}else{
				map.put("RESULT", 0);
				map.put("MSG", "등록이 실패되었습니다. 관리자에게 문의 하세요.");
			}
		}
		return map;
	}
	
	/**
	 * 건강정보조회
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("restriction")
	@RequestMapping(value = "/selectHealthInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public void selectHealthInfo(@RequestParam Map<String, Object> param, HttpServletRequest request, HttpServletResponse response)throws Exception {	
		
		param.put("PATIENT_CD", CommonUtil.getEnv(request.getSession()).getPATIENT_CD());
		
		ContentsVO resultList = contentsService.selectHealthInfo(param);
		
		Gson gson =new Gson();
		String json = gson.toJson(resultList);
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");

		response.getWriter().print(json);
		
	}
	
	/**
	 * 건강정보업데이트
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("restriction")
	@RequestMapping(value = "/updateHealthInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> updateBsMeasureInfo(@RequestParam Map<String, Object> param, HttpServletRequest request, HttpServletResponse response)throws Exception {	
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String PATIENT_CD = CommonUtil.getEnv(request.getSession()).getPATIENT_CD();
		
		param.put("PATIENT_CD", PATIENT_CD);
		
		int result = contentsService.updateHealthInfo(param);
		
		map.put("RESULT", result);
		
		return map;
		
	}
	
	/**
	 * 관리항목조회
	 * @param model
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/selectHealthMgtInfo.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void selectHealthMgtInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
		try{
			HashMap<String, String> map = new HashMap<String, String>();
			
			String PATIENT_CD = CommonUtil.getEnv(request.getSession()).getPATIENT_CD();
			
			map.put("PATIENT_CD", PATIENT_CD);
			
			List<ContentsVO> resultList = contentsService.selectHealthMgtInfo(map); 
			
			JqGridResult jqGridResult = new JqGridResult(resultList.size());
						
			for(ContentsVO contentsVO:resultList){
				
				jqGridResult.addData(
						//key
						PATIENT_CD
						,contentsVO.getDISEASE_0001()
						,contentsVO.getDISEASE_0002()
						,contentsVO.getDISEASE_0003()
						,contentsVO.getFASTING_VALUE_1()
						,contentsVO.getFASTING_VALUE_2()
						,contentsVO.getFASTING_VALUE_3()
						,contentsVO.getAFTER_MEAL_VALUE_1()
						,contentsVO.getAFTER_MEAL_VALUE_2()
						,contentsVO.getAFTER_MEAL_VALUE_3()
						,contentsVO.getSYSTOLE_FROM()
						,contentsVO.getSYSTOLE_TO()
						,contentsVO.getDIASTOLE_FROM()
						,contentsVO.getDIASTOLE_TO()
						,contentsVO.getHEART_RATE_FROM()
						,contentsVO.getHEART_RATE_TO()
						,contentsVO.getWEIGHT_FROM()
						,contentsVO.getWEIGHT_TO()
						,contentsVO.getMUSCLE_QY_FROM()
						,contentsVO.getMUSCLE_QY_TO()
						,contentsVO.getFAT_QY_FROM()
						,contentsVO.getFAT_QY_TO()
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
	 * 관리항목 업데이트
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("restriction")
	@RequestMapping(value = "/updateHealthMgtInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> updateHealthMgtInfo(@RequestParam Map<String, Object> param, HttpServletRequest request, HttpServletResponse response)throws Exception {	
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String PATIENT_CD = CommonUtil.getEnv(request.getSession()).getPATIENT_CD();
		
		if(param.get("BS_CHECK") != null){
			param.put("BS_CHECK", param.get("BS_CHECK"));
		}else{
			param.put("BS_CHECK", "N");
		}
		
		if(param.get("BP_CHECK") != null){
			param.put("BP_CHECK", param.get("BP_CHECK"));
		}else{
			param.put("BP_CHECK", "N");
		}
		
		if(param.get("BMI_CHECK") != null){
			param.put("BMI_CHECK", param.get("BMI_CHECK"));
		}else{
			param.put("BMI_CHECK", "N");
		}
		
		param.put("PATIENT_CD", PATIENT_CD);
		param.put("FASTING_VALUE_1", param.get("FASTING_VALUE_1"));
		param.put("FASTING_VALUE_2", param.get("FASTING_VALUE_2"));
		param.put("FASTING_VALUE_3", param.get("FASTING_VALUE_3"));
		param.put("AFTER_MEAL_VALUE_1", param.get("AFTER_MEAL_VALUE_1"));
		param.put("AFTER_MEAL_VALUE_2", param.get("AFTER_MEAL_VALUE_2"));
		param.put("AFTER_MEAL_VALUE_3", param.get("AFTER_MEAL_VALUE_3"));
		param.put("SYSTOLE_FROM", param.get("SYSTOLE_FROM"));
		param.put("SYSTOLE_TO", param.get("SYSTOLE_TO"));
		param.put("DIASTOLE_FROM", param.get("DIASTOLE_FROM"));
		param.put("DIASTOLE_TO", param.get("DIASTOLE_TO"));
		param.put("HEART_RATE_FROM", param.get("HEART_RATE_FROM"));
		param.put("HEART_RATE_TO", param.get("HEART_RATE_TO"));
		param.put("WEIGHT_FROM", param.get("WEIGHT_FROM"));
		param.put("WEIGHT_TO", param.get("WEIGHT_TO"));
		param.put("MUSCLE_QY_FROM", param.get("MUSCLE_QY_FROM"));
		param.put("MUSCLE_QY_TO", param.get("MUSCLE_QY_TO"));
		param.put("FAT_QY_FROM", param.get("FAT_QY_FROM"));
		param.put("FAT_QY_TO", param.get("FAT_QY_TO"));
		
		int result = contentsService.updateHealthMgtInfo(param);
		
		map.put("RESULT", result);
		
		return map;
		
	}
	
	
	/**
	 * 사용자 정보 조회
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("restriction")
	@RequestMapping(value = "/selectMyInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public void selectMyInfo(@RequestParam Map<String, Object> param, HttpServletRequest request, HttpServletResponse response)throws Exception {	
		
		
		param.put("PATIENT_CD", CommonUtil.getEnv(request.getSession()).getPATIENT_CD());
		
		ContentsVO resultList = contentsService.selectMyInfo(param);
		
		Gson gson =new Gson();
		String json = gson.toJson(resultList);
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");

		response.getWriter().print(json);
		
	}
	

	/**
	 * 사용자정보 수정
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("restriction")
	@RequestMapping(value="/updateMyInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> updateMyInfo(@RequestParam Map<String, Object> param, HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		param.put("BRTHDY", param.get("BRTHDY").toString().replaceAll("-", ""));

		//사용자정보 수정
		int result = contentsService.updateMyInfo(param);
		
		map.put("RESULT", result);
			
		return map;
	}
	
}
