package retail.login.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import org.springframework.stereotype.Repository;

import retail.login.service.LoginVO;

/**
 * @Class Name : LoginDao.java
 * @Description : 로그인
 * @Modification Information 
 * @author 문희훈
 * @since 2016. 10.31
 * @version 1.0
 * @see Copyright (C) by RETILTECH All right reserved.
 */

@SuppressWarnings("unchecked")
@Repository("LoginDao")
public class LoginDao extends EgovAbstractDAO {

	public List<LoginVO> login(LoginVO params) throws Exception{
		
		return (List<LoginVO>) list("login.login", params);
	}


	public void insertLoginInfo(LoginVO params) {
		insert("login.insertLoginInfo", params);
	}


	public String selectMemberId(LoginVO params) {
		return (String) select("login.selectMemberId", params);
	}


	public int insertMemberInfo(Map<String, Object> param) {
		return update("login.insertMemberInfo", param);
	}


	public int insertDiseaseInfo(Map<String, Object> param) {
		return update("login.insertDiseaseInfo", param);
	}


	public int changeMyPasswd(Map<String, Object> param) {
		return update("login.changeMyPasswd", param);
	}
}
