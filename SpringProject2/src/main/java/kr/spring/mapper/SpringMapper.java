package kr.spring.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Update;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import kr.spring.domain.FireStation;
import kr.spring.domain.Member;
import kr.spring.domain.Report;

public interface SpringMapper {
	
//	public Member Main(String m_id);
	public void JoinUser(ModelMap model);
	public void JoinFire(ModelMap model);
	public Member Login(ModelMap model);
	public void UserInfoUpdate(ModelMap modelmap);
	public Member UserInfoSelect(String m_id);
	
	public void ReportlatInsert(Model model);
	public Report ReportSelect(String m_id);
	public void ReportInsert(Model model);
	public void ReportlatDelete(String re_seq);
	
	public List<Report> ReportTaking();

	public Report ReportDetail(int re_seq);

	public Member ReportSelectNP(int re_seq);
	public FireStation Map(String m_id);
	public void UpdateMap(Model model);
	public FireStation SelectFS(int re_seq);
	
	

}
