package retail.common.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


/**
 * @project	RETAIL
 * @file	CommService.java
 * @comment
 * <pre>
 * </pre>
 *
 * @author	문희훈
 * @since	2016. 10. 24.
 */
public interface CommService {

	
	List<Map> sqlMapCallSelect(String asSqlMapId, Map paramMap) throws Exception;
	
	Integer sqlMapCallUpdate(String asSqlMapId, Map paramMap) throws Exception;
	
	String ajaxServiceUpdateService(HttpServletRequest request, String asMsg) throws Exception;
	
	String ajaxServiceUpdateMultiService(HttpServletRequest request, String asMsg) throws Exception;

	List<CommVO> selectHsptlList();

	List<CommVO> getRoleCodeApi(String lang);
	
	 
}
