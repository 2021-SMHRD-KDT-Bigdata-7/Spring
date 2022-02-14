package kr.spring.mapper;

import java.util.List;

import kr.spring.domain.Member;
import kr.spring.domain.Report;

public interface SpringMapper {
	
	public List<Member> MemberList();
	
	public void ReportlatInsert(Report rvo);
	
	
}
