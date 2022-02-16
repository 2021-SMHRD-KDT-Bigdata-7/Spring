package kr.spring.mapper;

import java.util.List;

import org.springframework.ui.Model;

import kr.spring.domain.Member;
import kr.spring.domain.Report;

public interface SpringMapper {
	
	public void JoinUser(Member member);
	public void JoinFire(Member member);
	public Member Login(Member member);
	
	public void ReportlatInsert(Model model);
	public void ReportInsert(Model model);
	public void ReportlatDelete(String m_id);
	
	public List<Report> ReportTaking();

	public Report ReportDetail(int re_seq);
}
