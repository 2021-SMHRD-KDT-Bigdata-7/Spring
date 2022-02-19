package kr.spring.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Update;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import kr.spring.domain.FireStation;
import kr.spring.domain.Member;
import kr.spring.domain.Report;

public interface SpringMapper {
	
	public void JoinUser(ModelMap model);
	public void JoinFire(ModelMap model);
	public Member Login(Member member);
	
	public void ReportlatInsert(Model model);
	public int ReportSelectSeq(String m_id);
	public void ReportInsert(Model model);
	public void ReportlatDelete(String re_seq);
	
	public List<Report> ReportTaking();

	public Report ReportDetail(int re_seq);

	public Member ReportSelectNP(int re_seq);
	public FireStation Map(String m_id);
	/* public Member UserInfoUpdate(String m_pw, String name, String m_phone); */
	
	
	 @Update
	 ("update Setting set m_pw=#{m_pw},m_name=#{m_name},m_phone=#{m_phone} where m_id=#{m_id}"
	 ) public void UserInfoUpdateAjax(Member member);
	 

}
