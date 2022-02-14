package kr.spring.domain;

import lombok.Data;

@Data
public class Report {
	private String re_loc;
	private String re_type;
	private String re_content;
	private double re_latitude;
//	private double re_longitude;
}
