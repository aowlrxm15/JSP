package kr.co.jboard2.service;

import java.util.List;

import kr.co.jboard2.dao.UserDAO;
import kr.co.jboard2.vo.ArticleVO;
import kr.co.jboard2.vo.TermsVO;

public enum UserService {
	
	INSTANCE;
	private UserDAO dao;
	
	private UserService() { dao = new UserDAO(); }
	
	public void insertUser() {}
	
	public TermsVO selectTerms() {
		return dao.selectTerms();
	}
	
	public int insertArticle(ArticleVO vo) {
		return dao.insertArticle(vo);
	}
	
	public void selectArticle() {}
	
	public List<ArticleVO> selectArticles() {
		return dao.selectArticles();
	}
	
	public void updateArticle() {}
}
