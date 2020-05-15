package notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import common.JDBCTemplate;
import notice.model.vo.Notice;
import notice.model.vo.NoticeComment;





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


	public Notice selectOneNotice(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		
		String query="select * from(select rownum as rnum, n.* from(select member.MEMBER_LEVEL,notice_no,NOTICE_TITLE,NOTICE_WRITER,NOTICE_CONTENT,NOTICE_DATE,NOTICE_IMGS,NOTICE_VIEW_COUNT,NOTICE_DELETE_BOOL,dog.dog_id,member.member_id,member.member_nickname from notice join member on(notice.notice_writer = member.member_id) join dog on (member.member_Id = dog.dog_member_id) order by notice_no desc)n)where notice_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeWriter(rset.getString("member_nickname"));
				n.setNoticeContent(rset.getString("notice_content"));
				n.setNoticeDate(rset.getDate("notice_date"));
				n.setNoticeImgs(rset.getString("notice_imgs"));
				n.setNoticeViewCount(rset.getInt("notice_view_count"));
				n.setDogId(rset.getString("dog_id"));
				n.setNoticeDeleteBool(rset.getInt("notice_delete_bool"));
				System.out.println(n.getDogId());

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return n;
	}


	public ArrayList<NoticeComment> selectCommentList(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<NoticeComment> list = new ArrayList<NoticeComment>();
		
		String query = "select * from notice_comment where notice_comment_ref=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				NoticeComment nc = new NoticeComment();
				nc.setNoticeCommentNo(rset.getInt("notice_comment_no"));
				nc.setNoticeCommentContent(rset.getString("notice_comment_content"));
				nc.setNoticeCommentWriter(rset.getString("notice_comment_writer"));
				nc.setNoticeCommentDate(rset.getDate("notice_comment_date"));
				nc.setNoticeCommentLevel(rset.getInt("notice_comment_level"));
				nc.setNoticeCommentRef(rset.getInt("notice_comment_ref"));
				nc.setNoticeCommentRefTwo(rset.getInt("notice_comment_ref_tow"));
				nc.setDogId(rset.getString("dog_id"));
				nc.setNoticeCommentBool(rset.getInt("notice_comment_bool"));
				list.add(nc);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}


	public int noticeCommentInsert(Connection conn, NoticeComment nc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into notice_comment values(notice_comment_seq.nextval,?,?,sysdate,?,?,?,?,1)";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, nc.getNoticeCommentContent());
			pstmt.setString(2, nc.getNoticeCommentWriter());
			pstmt.setInt(3, nc.getNoticeCommentLevel());
			pstmt.setInt(4, nc.getNoticeCommentRef());
			
			//pstmt.setInt(5, nc.getNoticeCommentRef());
			//null이 들어올 경우를 대비해서 삼항연산자로 표현해서 사용가능.
			pstmt.setString(5, nc.getNoticeCommentRefTwo()==0?null:String.valueOf(nc.getNoticeCommentRefTwo()));
			pstmt.setString(6, nc.getDogId());
			
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
	
	

