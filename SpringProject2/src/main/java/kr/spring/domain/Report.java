package kr.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Report {
	
	private int re_seq;
	private String m_id;
	private String re_loc;
	private String re_type;
	private Date re_date;
	private String re_content;
	private double re_latitude;
	private double re_longitude;
	private int fs_seq;
	private double live_lat;
	private double live_lon;
	
	
}
