package retail.common.service;

import java.util.List;


/**
 * @project	RETAIL
 * @file	UserVO.java
 * @comment
 * @author	문희훈
 * @since	2016. 10. 24.
 */
public class CommVO {
	
	/** 현재페이지*/
	private String PAGE;
	/** 리스트 갯수*/
	private String ROW_LIST;
	/** 로우수*/
	private String ROW_SEQ;
	/** 검색된 총 페이지수*/
	private String TOTAL_CNT;
	/** 목록 순번 */
	private String RN;
	/** 목록 총수 */
	private String TOT_CNT;
	/**헤더정렬기준*/
	private String SORTHEADER;
	/**DESC,ASC*/
	private String SORT;
	private String ROLE_ID;

	/** 배열데이터 */
	private List ARRAY_DATA;
	
	private String S_DT;
	private String E_DT;
	

	private String PASSWD_NO;
	private String  LOGIN_ID;
	
	
	private String ROLE_NM;
	
	private String HSPTL_CD;
	private String HSPTL_NM;
	private String BS_MEASURE_POINT;
	private String BS_MEASURE_NAME;
	
	
	
	
	
	
	public String getBS_MEASURE_NAME() {
		return BS_MEASURE_NAME;
	}


	public void setBS_MEASURE_NAME(String bS_MEASURE_NAME) {
		BS_MEASURE_NAME = bS_MEASURE_NAME;
	}


	public String getBS_MEASURE_POINT() {
		return BS_MEASURE_POINT;
	}


	public void setBS_MEASURE_POINT(String bS_MEASURE_POINT) {
		BS_MEASURE_POINT = bS_MEASURE_POINT;
	}


	public String getHSPTL_CD() {
		return HSPTL_CD;
	}


	public void setHSPTL_CD(String hSPTL_CD) {
		HSPTL_CD = hSPTL_CD;
	}


	public String getHSPTL_NM() {
		return HSPTL_NM;
	}


	public void setHSPTL_NM(String hSPTL_NM) {
		HSPTL_NM = hSPTL_NM;
	}


	public String getPAGE() {
		return PAGE;
	}


	public void setPAGE(String pAGE) {
		PAGE = pAGE;
	}


	public String getROW_LIST() {
		return ROW_LIST;
	}


	public void setROW_LIST(String rOW_LIST) {
		ROW_LIST = rOW_LIST;
	}


	public String getROW_SEQ() {
		return ROW_SEQ;
	}


	public void setROW_SEQ(String rOW_SEQ) {
		ROW_SEQ = rOW_SEQ;
	}


	public String getTOTAL_CNT() {
		return TOTAL_CNT;
	}


	public void setTOTAL_CNT(String tOTAL_CNT) {
		TOTAL_CNT = tOTAL_CNT;
	}


	public String getRN() {
		return RN;
	}


	public void setRN(String rN) {
		RN = rN;
	}


	public String getTOT_CNT() {
		return TOT_CNT;
	}


	public void setTOT_CNT(String tOT_CNT) {
		TOT_CNT = tOT_CNT;
	}


	public String getSORTHEADER() {
		return SORTHEADER;
	}


	public void setSORTHEADER(String sORTHEADER) {
		SORTHEADER = sORTHEADER;
	}


	public String getSORT() {
		return SORT;
	}


	public void setSORT(String sORT) {
		SORT = sORT;
	}


	public String getROLE_ID() {
		return ROLE_ID;
	}


	public void setROLE_ID(String rOLE_ID) {
		ROLE_ID = rOLE_ID;
	}


	public List getARRAY_DATA() {
		return ARRAY_DATA;
	}


	public void setARRAY_DATA(List aRRAY_DATA) {
		ARRAY_DATA = aRRAY_DATA;
	}


	public String getS_DT() {
		return S_DT;
	}


	public void setS_DT(String s_DT) {
		S_DT = s_DT;
	}


	public String getE_DT() {
		return E_DT;
	}


	public void setE_DT(String e_DT) {
		E_DT = e_DT;
	}


	public String getPASSWD_NO() {
		return PASSWD_NO;
	}


	public void setPASSWD_NO(String pASSWD_NO) {
		PASSWD_NO = pASSWD_NO;
	}


	public String getLOGIN_ID() {
		return LOGIN_ID;
	}


	public void setLOGIN_ID(String lOGIN_ID) {
		LOGIN_ID = lOGIN_ID;
	}


	public String getROLE_NM() {
		return ROLE_NM;
	}


	public void setROLE_NM(String rOLE_NM) {
		ROLE_NM = rOLE_NM;
	}

	
  
	
}
