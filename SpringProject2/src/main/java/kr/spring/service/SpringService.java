package kr.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.domain.FireStation;
import kr.spring.domain.Member;
import kr.spring.domain.Report;
import kr.spring.mapper.SpringMapper;


@Service
public class SpringService {
	
	@Autowired
	SpringMapper mapper;

//**************************************************************로그인 및 회원가입
	/*
	public Member Main(String m_id) {
		Member member = mapper.Main(m_id);
		return member;
	} 
	*/
	public void JoinAll(ModelMap map) {
		mapper.JoinAll(map);
	}
	// 로그인
	public Member Login(ModelMap model) {
		Member member = new Member();
		member = mapper.Login(model);
		System.out.println("member" + member);
		
		return member;
	}
	// 회원정보수정
	public void UserInfoUpdate(ModelMap modelmap) {
		System.out.println("service" + modelmap);
		mapper.UserInfoUpdate(modelmap); 
	}
	
	public Member UserInfoSelect(String m_id) {
		Member member = new Member();
		member = mapper.UserInfoSelect(m_id);
		return member;
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
		System.out.println("ReportInsert서비스 : "+model);
	}
	
	public Report ReportSelect(String m_id) {
		Report report = new Report();
		report = mapper.ReportSelect(m_id);
		return report;
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
	
	public String UpdateMap(Model model) {
		mapper.UpdateMap(model);
		System.out.println("UpdateMap:"+model);
		return "ShareMap";
	}
	
	public void UpdateClear(int re_seq) {
		System.out.println("UpdateClear서비스의 re_seq : "+re_seq);
		mapper.UpdateClear(re_seq);
	}
	
	public FireStation SelectFS(int re_seq) { 
		System.out.println("SelectFS re_seq : " + re_seq);
		FireStation fsvo = mapper.SelectFS(re_seq);
			
		return fsvo;
	}
	
}
