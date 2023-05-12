package myPlace.main.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import myPlace.main.dao.MainDAO;

@Service("mainService")
public class MainServiceImpl implements MainService {
	
	@Resource(name="mainDAO")
	private MainDAO mainDAO;

}
