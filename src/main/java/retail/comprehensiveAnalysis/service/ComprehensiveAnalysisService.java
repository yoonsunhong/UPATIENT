package retail.comprehensiveAnalysis.service;

import java.util.HashMap;
import java.util.List;


public interface ComprehensiveAnalysisService {

	List<ComprehensiveAnalysisVO> selectMyCAMeasureTrandView(HashMap<String, Object> map);
	
	
	
}