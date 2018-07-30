package retail.login.service.impl;

import java.util.List;

 





import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;





import retail.login.service.LoginService;
import retail.login.service.LoginVO;


/**
 * @Class Name : LoginServiceImpl.java
 * @Description : 로그인
 * @Modification Information 
 * @author 문희훈
 * @since 2016. 10.31
 * @version 1.0
 * @see Copyright (C) by RETILTECH All right reserved.
 */

@Service("LoginService")
public class LoginServiceImpl  implements LoginService {

	@Autowired
	private LoginDao loginDao;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(LoginServiceImpl.class);



	@Override
	@Transactional
	public List<LoginVO> login(LoginVO params) throws Exception {
		
		
		return loginDao.login(params);
	}


	@Override
	@Transactional
	public void insertLoginInfo(LoginVO params) {
		loginDao.insertLoginInfo(params);
	}


	@Override
	@Transactional
	public String selectMemberId(LoginVO params) {
		return loginDao.selectMemberId(params);
	}


	@Override
	@Transactional
	public int insertMemberInfo(Map<String, Object> param) {
		
		int result = 0;
		
		loginDao.insertDiseaseInfo(param);
		
		result = loginDao.insertMemberInfo(param);
		
		//System.out.println(result);
		
		return result;
	}
	
	@Override
	@Transactional
	public int changeMyPasswd(Map<String, Object> param) {
		
		int result = 0;
		
		result = loginDao.changeMyPasswd(param);
		
		//System.out.println(result);
		
		return result;
	}

}
