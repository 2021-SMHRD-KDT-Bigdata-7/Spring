package kr.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Member {
	
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_phone;
	private String m_type;
	private Date m_joindate;
	private String admin_yn;
	
	
}
