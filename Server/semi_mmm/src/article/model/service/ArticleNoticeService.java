package article.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import article.model.dao.ArticleNoticeDao;
import article.model.vo.ArticleNotice;
import common.JDBCTemplate;

public class ArticleNoticeService {

	public int articleWrite(ArticleNotice article) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new ArticleNoticeDao().articleWrite(conn, article);
		
		if (result > 0) { 
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public ArrayList<ArticleNotice> articleMore(int start) {
		
		Connection conn = JDBCTemplate.getConnection();
		int length = 5;
		int end = start + length - 1;
		
		ArrayList<ArticleNotice> list = new ArticleNoticeDao().articleMore(conn, start, end);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public int getTotalCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		int totalCount = new ArticleNoticeDao().getTotalCount(conn);
		
		JDBCTemplate.close(conn);
		
		return totalCount;
	}

}
