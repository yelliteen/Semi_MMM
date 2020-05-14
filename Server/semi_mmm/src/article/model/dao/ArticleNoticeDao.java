package article.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import article.model.vo.ArticleNotice;
import common.JDBCTemplate;

public class ArticleNoticeDao {
	
	private ArticleNotice setArticleNotice(ResultSet rset, int index) throws SQLException {
		
		return new ArticleNotice(rset.getInt(index++),
				rset.getString(index++),
				rset.getString(index++),
				rset.getString(index++),
				rset.getString(index++),
				rset.getString(index++),
				rset.getDate(index++),
				rset.getInt(index++),
				rset.getInt(index++),
				rset.getString(index++));
	}

	public int articleWrite(Connection conn, ArticleNotice article) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into article_notice values(article_notice_seq.nextval, ?, ?, ?, ?, ?, sysdate, 0, 0, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			int index = 1;
			pstmt.setString(index++, article.getArticleNoticeCategory1());
			pstmt.setString(index++, article.getArticleNoticeCategory2());
			pstmt.setString(index++, article.getArticleNoticeTitle());
			pstmt.setString(index++, article.getArticleNoticeWriter());
			pstmt.setString(index++, article.getArticleNoticeContent());
			pstmt.setString(index++, article.getArticleNoticeImgName());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<ArticleNotice> articleMore(Connection conn, int start, int end) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ArticleNotice> list = new ArrayList<ArticleNotice>();
		String query = "SELECT * FROM (SELECT ROWNUM AS RNUM, A.* FROM"
				+ " (SELECT ARTICLE_NOTICE_NO, ARTICLE_NOTICE_CATEGORY1, ARTICLE_NOTICE_CATEGORY2, "
				+ "ARTICLE_NOTICE_TITLE, M.MEMBER_NICKNAME, ARTICLE_NOTICE_CONTENT, ARTICLE_NOTICE_DATE, "
				+ "ARTICLE_NOTICE_SOLD_BOOL, ARTICLE_NOTICE_DELETE_BOOL, ARTICLE_NOTICE_IMG_NAME "
				+ "FROM ARTICLE_NOTICE A1"
				+ " JOIN MEMBER M ON (MEMBER_ID = ARTICLE_NOTICE_WRITER)"
				+ " WHERE ARTICLE_NOTICE_DELETE_BOOL = 0"
				+ " ORDER BY ARTICLE_NOTICE_NO DESC) A) "
				+ "WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ArticleNotice arNotice = setArticleNotice(rset, 2);
				list.add(arNotice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public int getTotalCount(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) from article_notice WHERE ARTICLE_NOTICE_DELETE_BOOL = 0";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArticleNotice articleRead(Connection conn, int articleNoticeNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArticleNotice article = null;
		String query = "select * from article_notice where article_notice_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNoticeNo);
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				article = setArticleNotice(rset, 1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return article;
	}

	public String getMemberNickname(Connection conn, String memberId) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String memberNickname = "";
		String query = "select member_nickname from member where member_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				memberNickname = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return memberNickname;
	}

	public int articleModify(Connection conn, ArticleNotice article) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update article_notice set ARTICLE_NOTICE_CATEGORY1=?, ARTICLE_NOTICE_CATEGORY2=?, ARTICLE_NOTICE_TITLE=?,"
				+ "ARTICLE_NOTICE_CONTENT=?, ARTICLE_NOTICE_IMG_NAME=? where ARTICLE_NOTICE_NO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			int index = 1;
			pstmt.setString(index++, article.getArticleNoticeCategory1());
			pstmt.setString(index++, article.getArticleNoticeCategory2());
			pstmt.setString(index++, article.getArticleNoticeTitle());
			pstmt.setString(index++, article.getArticleNoticeContent());
			pstmt.setString(index++, article.getArticleNoticeImgName());
			pstmt.setInt(index++, article.getArticleNoticeNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<ArticleNotice> articleKeywordMore(Connection conn, int start, int end,
			String articleNoticeCategory1, String articleNoticeCategory2, ArrayList<String> strs) {
		
		String query = "SELECT * FROM (SELECT ROWNUM AS RNUM, A.* FROM"
				+ " (SELECT ARTICLE_NOTICE_NO, ARTICLE_NOTICE_CATEGORY1, ARTICLE_NOTICE_CATEGORY2, "
				+ "ARTICLE_NOTICE_TITLE, M.MEMBER_NICKNAME, ARTICLE_NOTICE_CONTENT, ARTICLE_NOTICE_DATE, "
				+ "ARTICLE_NOTICE_SOLD_BOOL, ARTICLE_NOTICE_DELETE_BOOL, ARTICLE_NOTICE_IMG_NAME "
				+ "FROM ARTICLE_NOTICE A1"
				+ " JOIN MEMBER M ON (MEMBER_ID = ARTICLE_NOTICE_WRITER)"
				+ " WHERE ARTICLE_NOTICE_DELETE_BOOL = 0"
				+ " and article_notice_category1=? and  article_notice_category2=? and (";
		for (int i = 0; i < strs.size(); i++) {
			query += "Article_Notice_Content like ? or Article_Notice_Title like ?";
			if (i != strs.size() - 1) {
				query += " or ";
			}
		}
		query += ") ORDER BY ARTICLE_NOTICE_NO DESC) A) ";
		query += "WHERE RNUM BETWEEN ? AND ?";
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ArticleNotice> list = new ArrayList<ArticleNotice>();
		
		try {
			pstmt = conn.prepareStatement(query);
			
			int index = 1;
			pstmt.setString(index++, articleNoticeCategory1);
			pstmt.setString(index++, articleNoticeCategory2);
			
			for (int i = 0; i < strs.size(); i++) {
				pstmt.setString(index++, "%" + strs.get(i) + "%");
				pstmt.setString(index++, "%" + strs.get(i) + "%");
			}
			
			pstmt.setInt(index++, start);
			pstmt.setInt(index++, end);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ArticleNotice arNotice = setArticleNotice(rset, 2);
				list.add(arNotice);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public int getTotlaKeywordCount(Connection conn, String articleNoticeCategory1, String articleNoticeCategory2,
			ArrayList<String> strs) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) from article_notice WHERE ARTICLE_NOTICE_DELETE_BOOL = 0"
				+ " and article_Notice_Category1=? and article_Notice_Category2=? and (";
		
		for (int i = 0; i < strs.size(); i++) {
			query += "Article_Notice_Content like ? or Article_Notice_Title like ?";
			if (i != strs.size() - 1) {
				query += " or ";
			}
		}
		query +=")";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			int index = 1;
			pstmt.setString(index++, articleNoticeCategory1);
			pstmt.setString(index++, articleNoticeCategory2);
			
			for (int i = 0; i < strs.size(); i++) {
				pstmt.setString(index++, "%" + strs.get(i) + "%");
				pstmt.setString(index++, "%" + strs.get(i) + "%");
			}
			
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
}
