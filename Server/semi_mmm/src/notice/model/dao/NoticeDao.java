package notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import article.model.vo.ArticleNotice;
import common.JDBCTemplate;
import notice.model.vo.Notice;




public class NoticeDao {
	
	public int totalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query="select count(*) as cnt from notice";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("cnt");
				System.out.println("count 값 : "+result);
			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	
	public ArrayList<Notice> selectLsit(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		String query="select * from notice, member where notice.notice_writer = member.member_id";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeWriter(rset.getString("member_nickname"));
				n.setNoticeContent(rset.getString("notice_content"));
				n.setNoticeDate(rset.getDate("notice_date"));
				n.setNoticeImgs(rset.getString("notice_imgs"));
				n.setNoticeViewCount(rset.getInt("notice_view_count"));
				n.setDogId(rset.getString("dog_id"));
				n.setNoticeDeleteBool(rset.getInt("notice_delete_bool"));
				list.add(n);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	

	
	
	public ArrayList<Notice> selectList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		
		
		String query="select * from(select rownum as rnum, n.* from(select * from notice, member WHERE notice.notice_writer = member.member_id order by notice_no desc)n)where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeWriter(rset.getString("member_nickname"));
				n.setNoticeContent(rset.getString("notice_content"));
				n.setNoticeDate(rset.getDate("notice_date"));
				n.setNoticeImgs(rset.getString("notice_imgs"));
				n.setNoticeViewCount(rset.getInt("notice_view_count"));
				n.setDogId(rset.getString("dog_id"));
				n.setNoticeDeleteBool(rset.getInt("notice_delete_bool"));
				list.add(n);
		
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}


	public int writeNotice(Connection conn, Notice notice) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "insert into notice values(notice_seq.nextval,?,?,?,sysdate,?,0,?,0)";
		
			try {
				pstmt = conn.prepareStatement(query);
				
				int index = 1;
				pstmt.setString(index++, notice.getNoticeTitle());
				pstmt.setString(index++, notice.getNoticeWriter());
				pstmt.setString(index++, notice.getNoticeContent());
				pstmt.setString(index++, notice.getNoticeImgs());
				pstmt.setString(index++, notice.getDogId());
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
		return result;
		
	}


}
	
	

