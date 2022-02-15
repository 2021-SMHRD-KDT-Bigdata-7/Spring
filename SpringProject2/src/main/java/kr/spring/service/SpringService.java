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

//**************************************************************로그인 및 회원가입
	//회원가입-일반사용자
	public void JoinUser(Member member) {
//////////확인용	
		System.out.println("JoinUser serv "+member);
		
		mapper.JoinUser(member);
	}
	//회원가입-소방서
	public void JoinFire(Member member) {
		mapper.JoinFire(member);
	}
	
//**************************************************************신고  페이지
	// ReportMap(사고위치제공페이지)에서 좌표 DB저장
	public void ReportlatInsert(Model model) {
		mapper.ReportlatInsert(model);
		
//////////확인용   		
		System.out.println("ReportlatInsert서비스"+model);
	}
	
	// Report(신고페이지)에서 신고내용 저장
	public void ReportInsert(Model model) {
		mapper.ReportInsert(model);
//////////확인용   		
		System.out.println("ReportInsert서비스"+model);
	}
	
	// Report(신고페이지)에서 처음으로 버튼 클릭 시
	public void ReportlatDelete() {
		mapper.ReportlatDelete();
	}
	
	
//**************************************************************신고접수 페이지
	//ReportTaking(신고접수)화면 목록 가져오기
	public List<Report> ReportTaking(){
		List<Report> rlist = mapper.ReportTaking();
///////확인용
		System.out.println("ReportTakin date "+rlist.get(2));
		System.out.println("ReportTaking서비스 "+rlist);

		return rlist;
	}
	
	// ReportTaking(신고접수화면)에서 신고상세내용 가져오기
	public List<Report> ReportDetail(){
		List<Report> rlist = mapper.ReportDetail();
//////확인용
		System.out.println("ReportDetail서비스 "+rlist);
		
		return rlist;
	}
	
	
}
