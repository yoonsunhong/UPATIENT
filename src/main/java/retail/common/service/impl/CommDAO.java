package retail.common.service.impl;
 
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import retail.common.service.CommVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

/**
 * @project	RETAIL
 * @file	CommDAO.java
 * @comment
 * <pre>
 * </pre>
 *
 * @author	문희훈
 * @since	2016. 10. 24.
 */
@Repository
public class CommDAO extends EgovAbstractDAO {
	
	
	@SuppressWarnings("unchecked")
	public List<Map> sqlMapCallSelect( String asSqlMapId, Map paramMap ) {
		return (List<Map>) this.getSqlMapClientTemplate().queryForList(asSqlMapId, paramMap);
	}
	
	public Integer sqlMapCallUpdate( String asSqlMapId, Map paramMap ) {
		return this.getSqlMapClientTemplate().update(asSqlMapId, paramMap);
	}

	@SuppressWarnings("unchecked")
	public List<CommVO> selectHsptlList() {
		return  (List<CommVO>) list("login.selectHsptlList", null);
	}

	@SuppressWarnings("unchecked")
	public List<CommVO> getRoleCodeApi(String lang) {
		return  (List<CommVO>) list("login.getRoleCodeApi", lang);
	}
}
