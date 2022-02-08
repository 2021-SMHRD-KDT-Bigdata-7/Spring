package kr.spring.mapper;

import java.util.List;
import kr.spring.domain.Member;

public interface MemberMapper {

	public List<Member> MemberList(); //추상메소드->sql(select~)
		
}
