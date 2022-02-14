package kr.spring.mapper;

import java.util.List;

import org.springframework.ui.Model;

import kr.spring.domain.Member;

public interface SpringMapper {
	
	public List<Member> MemberList();
	
	public void ReportlatInsert(Model model);
	public void ReportInsert(Model model);
	
	
}
