package com.syaccp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.syaccp.entity.News;
import com.syaccp.entity.NewsMapper;

@Service("newsService")
public class NewsServiceImpl implements NewsService{

	@Resource
	private NewsMapper newsMapper;
	
	public NewsServiceImpl() {
		// TODO Auto-generated constructor stub
	super();
	System.out.println("NewsServiceImpl");
	}
	@Override
	public void insert(News record) {
		// TODO Auto-generated method stub
		newsMapper.insert(record);
	}

	@Override
	public List<News> findAll() {
		// TODO Auto-generated method stub
		
		return newsMapper.findAll();
	}

}
