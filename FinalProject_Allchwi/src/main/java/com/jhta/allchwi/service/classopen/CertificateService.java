package com.jhta.allchwi.service.classopen;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.classopen.CertificateDAO;
import com.jhta.allchwi.vo.classopen.CertificateVO;

@Service
public class CertificateService {
	@Autowired
	private CertificateDAO dao;
	
	public int insert(CertificateVO vo) {
		return dao.insert(vo);
	}
	
}
