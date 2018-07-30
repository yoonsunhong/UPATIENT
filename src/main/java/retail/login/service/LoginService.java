package retail.login.service;

import java.util.List;
import java.util.Map;

public interface LoginService {
	
	List<LoginVO> login(LoginVO params) throws Exception;
	
	void insertLoginInfo(LoginVO params);

	String selectMemberId(LoginVO params);

	int insertMemberInfo(Map<String, Object> param);

	int changeMyPasswd(Map<String, Object> param);
	
}