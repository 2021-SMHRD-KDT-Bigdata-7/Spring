package kr.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.domain.Member;
import kr.spring.domain.Report;
import kr.spring.mapper.SpringMapper;

@Service
public class SpringService {
	
	@Autowired
	SpringMapper mapper;
	
	public void ReportlatInsert(Report rvo) {
		mapper.ReportlatInsert(rvo);
	}
	   
    //method db에서 멤버리스트를 갖고오는 메소드 컨트롤러야 db에서 멤버리스트 갖고와
    //회원테이블조회
    public List<Member> MemberList() {
       List<Member> mlist =mapper.MemberList();
       return mlist;
    }
	
	
}
