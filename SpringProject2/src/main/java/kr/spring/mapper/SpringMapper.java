package kr.spring.mapper;

import java.util.List;

import org.springframework.ui.Model;

import kr.spring.domain.Member;
import kr.spring.domain.Report;

public interface SpringMapper {
	
	public void JoinUser(Member member);
	public void JoinFire(Member member);
	
	public void ReportlatInsert(Model model);
	public void ReportInsert(Model model);
	
	public List<Report> ReportTaking();
	public List<Report> ReportDetail();
}
