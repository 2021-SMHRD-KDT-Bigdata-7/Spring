package kr.spring.mapper;

import java.util.List;

import org.springframework.ui.Model;

import kr.spring.domain.Member;
import kr.spring.domain.Report;

public interface SpringMapper {
	
	public List<Member> MemberList();
	public void ReportlatInsert(Model model);
	public void ReportInsert(Model model);
	public List<Report> ReportTaking();
	public void JoinUser(Member member);
	public void JoinFire(Member member);
	
	
}
