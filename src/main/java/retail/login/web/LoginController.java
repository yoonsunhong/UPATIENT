package retail.login.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import retail.common.CommonUtil;
import retail.common.SessionModel;
import retail.common.JqGridResult;
import retail.login.service.LoginService;
import retail.login.service.LoginVO;
import retail.seed.SeedCipher;

/**
 * @Class Name : LoginController.java
 * @Description : 로그인
 * @Modification Information 
 * @author 문희훈
 * @since 2016. 10.31
 * @version 1.0
 * @see Copyright (C) by RETILTECH All right reserved.
 */

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	/** log */
	private final Log log = LogFactory.getLog(this.getClass());
	
	/**
	 * 로그인페이지 이동 
	 * @param searchVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */ 
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception 
	{
		
		ModelAndView mavLogin = new ModelAndView("retail/login/login");
		    
		System.out.println("===========Server Start==========="); 
		
		return mavLogin;
 
	}

	/**
	 * 로그인페이지 이동 
	 * @param searchVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */ 
	@RequestMapping(value = "/goLogin.do", method = RequestMethod.GET)
	public ModelAndView goLogin(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception 
	{
		
		ModelAndView mavLogin = new ModelAndView("retail/login/goLogin");
		    
		System.out.println("===========Server Start==========="); 
		
		return mavLogin;
 
	}
	
	/**
	 * 회원가입페이지 이동
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public ModelAndView signup(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception 
	{
		
		ModelAndView mavLogin = new ModelAndView("retail/login/signup");
		    
		return mavLogin;
 
	}
	
	
	/**
	 * 로그인 요청
	 * @param searchVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@SuppressWarnings("restriction")
	@RequestMapping(value = "/login.do", method=RequestMethod.POST)
	//@ResponseBody
	public void login( HttpServletRequest request,HttpServletResponse response )throws Exception {
		
		try {
			 
			String PATIENT_CD    = request.getParameter("PATIENT_CD");
			String USER_PW  = request.getParameter("USER_PW");
			
			LoginVO params = new LoginVO();
			params.setPATIENT_CD(PATIENT_CD);
			params.setUSER_PW(USER_PW); 
			params.setREG_IP(CommonUtil.getIpAddr());
			
			List<LoginVO> resultList = loginService.login(params);
			//result = ajaxServiceSelect(result);
			
			
			JqGridResult jqGridResult = new JqGridResult(resultList.size());
			
			if( resultList.size() > 0 )
			{
				
				//로그인 이력 저장
				loginService.insertLoginInfo(params);
				
				// 여기에 세션 추가
				SessionModel env = new SessionModel();
				env.setPATIENT_CD(resultList.get(0).getPATIENT_CD()); 
				
				env.setPATIENT_CD(resultList.get(0).getPATIENT_CD()); 
				env.setHSPTL_CD(resultList.get(0).getHSPTL_CD()); 
				env.setUSER_NM(resultList.get(0).getUSER_NM()); 
				
				
				CommonUtil.setEnv(request.getSession(), env); 
			}
			 
			
			for(LoginVO loginVO : resultList) {
				jqGridResult.addData(
						  loginVO.getPATIENT_CD()
	               		, loginVO.getHSPTL_CD()  
	               		, loginVO.getUSER_NM()  
						);
			} 
			String jsonStr = jqGridResult.getJsonString(); 
			response.setContentType("text/json; charset=utf-8"); 
			response.getWriter().print(jsonStr);
			
		} catch (IOException e) {
			System.err.println("IOException Occured");
		}
		
		
	}

	/**
	 * 아이디 중복체크
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/selectMemberId.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> selectMemberId(HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String PATIENT_CD    = request.getParameter("PATIENT_CD");
			
		LoginVO params = new LoginVO();
		params.setPATIENT_CD(PATIENT_CD);
	
		String CNT = loginService.selectMemberId(params);
		
		map.put("CNT", CNT);
			
		return map;
	}
	
	/**
	 * 사용자등록, 의료마스터 등록
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("restriction")
	@RequestMapping(value="/insertMemberInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> insertMemberInfo(@RequestParam Map<String, Object> param, HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		param.put("BRTHDY", param.get("BRTHDY").toString().replaceAll("-", ""));
		param.put("USER_PW", param.get("USER_PW"));
		param.put("TEL_NO", param.get("TEL_NO"));
		
		//사용자등록, 의료마스터 등록
		int result = loginService.insertMemberInfo(param);
		
		map.put("RESULT", result);
			
		return map;
	}
	
	
	
	/**
	 * 로그아웃 요청
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView goLogout(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		 
		CommonUtil.setEnv(request.getSession() , null);
		ModelAndView mav = new  ModelAndView("retail/login/logout");
		
		return   mav; 
	}
	
	
	
	/**
	 * 사용자등록, 의료마스터 등록
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("restriction")
	@RequestMapping(value="/changeMyPasswd.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> changeMyPasswd(@RequestParam Map<String, Object> param, HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String PATIENT_CD = CommonUtil.getEnv(request.getSession()).getPATIENT_CD();
		
		param.put("PATIENT_CD", PATIENT_CD);
		param.put("USER_PW", param.get("NEW_USER_PW1"));
		param.put("NEW_USER_PW", param.get("USER_PW"));
		
		//비밀번호 변경
		int result = loginService.changeMyPasswd(param);
		
		map.put("RESULT", result);
			
		return map;
	}
	
	/**
	 * 노 로그인 언어설정 화면이동
	 * @param model
	 * @return "mav"
	 * @exception Exception
	 */
	@RequestMapping(value = "/noLoginlanguageMst.do", method = RequestMethod.GET)
	public ModelAndView noLoginlanguageMst(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/login/noLoginlanguageMst");
		return   mav; 
	}	
	
	/**
	 * 잘못된 요청
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/notPage.do", method = RequestMethod.GET)
	public ModelAndView notPage(HttpServletRequest request, HttpServletResponse response )throws Exception { 
		ModelAndView mav = new  ModelAndView("retail/login/notPage");
		return   mav; 
	}
	
	 

}
