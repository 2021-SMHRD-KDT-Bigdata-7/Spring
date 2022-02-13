package kr.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.domain.Report;
import kr.spring.mapper.ReportMapper;

@Service
public class ReportService {
	
	@Autowired
	ReportMapper remapper;
	
	public void ReportlatInsert(Report rvo) {
		remapper.ReportlatInsert(rvo);
	}

}
