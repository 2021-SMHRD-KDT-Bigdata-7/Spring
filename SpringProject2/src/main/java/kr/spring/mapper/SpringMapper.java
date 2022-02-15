package kr.spring.mapper;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.domain.Member;
import kr.spring.domain.Report;

public interface SpringMapper {
	
	public void JoinUser(Member member);
	public void JoinFire(Member member);
	
	public void ReportlatInsert(Model model);
	public void ReportInsert(Model model);
	public void ReportlatDelete();
	
	public List<Report> ReportTaking();
	public List<Report> ReportDetail();
	
	/*
	 * public Member Login(@RequestParam("m_id") String m_id, @RequestParam("m_pw")
	 * String m_pw);
	 */
	public Member Login(Member member);
	
}
