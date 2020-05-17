package admin.model.service;

import java.sql.Connection;

import admin.model.dao.AdminDao;
import admin.model.vo.AdminIndexInfo;
import article.model.vo.ArticleNoticeComment;
import common.JDBCTemplate;

public class AdminService {

	public AdminIndexInfo getInfo() {
		
		Connection conn = JDBCTemplate.getConnection();
		AdminIndexInfo info = new AdminDao().getInfo(conn);
		
		JDBCTemplate.close(conn);
		
		return info;
	}

	public int articleDelete(int articleNoticeNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDao().articleDelete(conn, articleNoticeNo);
		
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int articleRecovery(int articleNoticeNo) {

		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDao().articleRecovery(conn, articleNoticeNo);
		
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public ArticleNoticeComment articleComment(int articleCommentNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArticleNoticeComment comment = new AdminDao().articleComment(conn, articleCommentNo);
		
		JDBCTemplate.close(conn);
		
		return comment;
	}

}
