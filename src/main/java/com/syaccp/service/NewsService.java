package com.syaccp.service;

import java.util.List;

import com.syaccp.entity.News;

public interface NewsService {
	void insert(News record);
	
	List<News> findAll();

}
