package kr.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.spring.domain.Member;
import kr.spring.domain.Report;
import kr.spring.mapper.SpringMapper;


@Service
public class SpringService {
	
	@Autowired
	SpringMapper mapper;

	
	//회원가입-일반사용자
	public void JoinUser(Member member) {
		System.out.println("ser"+member);
		mapper.JoinUser(member);
	}
	//회원가입-소방서
	public void JoinFire(Member member) {
		mapper.JoinFire(member);
	}
	// ReportMap에서 좌표 DB저장
	public void ReportlatInsert(Model model) {
		mapper.ReportlatInsert(model);
		
//////////확인용   		
		System.out.println("ReportlatInsert서비스"+model);
	}
	
	// Report에서 신고내용 저장
	public void ReportInsert(Model model) {
		mapper.ReportInsert(model);
//////////확인용   		
		System.out.println("ReportInsert서비스"+model);
	}
	
	// 접수자 ReportTaking화면 목록 가져오기
	public List<Report> ReportTaking(){
		List<Report> rlist = mapper.ReportTaking();
///////확인용
		System.out.println("ReportTaking서비스 "+rlist);

		return rlist;
	}
	   
    //method db에서 멤버리스트를 갖고오는 메소드 컨트롤러야 db에서 멤버리스트 갖고와
    //회원테이블조회
    public List<Member> MemberList() {
       List<Member> mlist =mapper.MemberList();
       return mlist;
    }

	
	
	
}
