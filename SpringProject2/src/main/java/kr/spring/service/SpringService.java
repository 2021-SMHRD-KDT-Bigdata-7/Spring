package kr.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import kr.spring.domain.FireStation;
import kr.spring.domain.Member;
import kr.spring.domain.Report;
import kr.spring.mapper.SpringMapper;


@Service
public class SpringService {
	
	@Autowired
	SpringMapper mapper;

//**************************************************************로그인 및 회원가입
	//회원가입-일반사용자
	public void JoinUser(ModelMap model) {
//////////확인용	
		System.out.println("JoinUser serv "+model);
		
		mapper.JoinUser(model);
	}
	//회원가입-소방서
	public void JoinFire(ModelMap model) {
		mapper.JoinFire(model);
	}
	//로그인
	public Member Login(Member member) {
		System.out.println("member" + member);
		return mapper.Login(member);
		 
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
	
	public int ReportSelectSeq(String m_id) {
		int re_seq = mapper.ReportSelectSeq(m_id);
		return re_seq;
	}
	
	// Report(신고페이지)에서 처음으로 버튼 클릭 시
	public void ReportlatDelete(String re_seq) {
		System.out.println("ReportlatDelete서비스 re_seq값 : " + re_seq);
		mapper.ReportlatDelete(re_seq);
	}
	
//**************************************************************신고접수 페이지
	//ReportTaking(신고접수)화면 목록 가져오기
	public List<Report> ReportTaking(){
		List<Report> rlist = mapper.ReportTaking();
///////확인용
		System.out.println("ReportTaking서비스 "+rlist);

		return rlist;
	}
	
	// ReportTaking(신고접수화면)에서 신고상세내용 가져오기
	public Report ReportDetail(int re_seq){
		Report rvo = mapper.ReportDetail(re_seq);
//////확인용
		System.out.println("ReportDetail서비스 "+rvo);
		
		return rvo;
	}
	
	// ReportTaking(신고접수페이지)에서 버튼 클릭 시 세부정보 출력을 위해 신고자 정보 가져오기
	public Member ReportSelectNP(int re_seq){
		Member mvo = mapper.ReportSelectNP(re_seq);
//////확인용
		System.out.println("ReportSelectNP서비스 "+mvo);
		
		return mvo;
	}
	
	// 소방메인페이지에서 지도보기 클릭 시 소방서 정보 가져오기
	public FireStation Map(String m_id) {
		FireStation fsvo = mapper.Map(m_id);
		System.out.println("Map서비스 fsvo : "+fsvo);
		return fsvo;
	}
	
	public Model ShareMap(String m_id, int re_seq, Model model) {
		FireStation fsvo = mapper.Map(m_id);
		Report rvo = mapper.ReportDetail(re_seq);
		
		System.out.println("ShareMap서비스 fsvo : "+fsvo);
		System.out.println("ShareMap서비스 rvo : "+rvo);
		
		model.addAttribute("fsvo", fsvo);
		model.addAttribute("rvo", rvo);
		
		System.out.println("ShareMap서비스 model : "+model);

		return model;
	}
	



	
}
