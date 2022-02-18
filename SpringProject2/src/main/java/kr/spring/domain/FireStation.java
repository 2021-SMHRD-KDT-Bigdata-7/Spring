package kr.spring.domain;

import lombok.Data;

@Data
public class FireStation {
	
	private int fs_seq;
	private String fs_name;
	private String fs_addr;
	private double fs_latitude;
	private double fs_longitude;
	private String m_id;
	
}
