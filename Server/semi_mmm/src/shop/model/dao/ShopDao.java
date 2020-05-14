package shop.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.vo.Member;
import shop.model.vo.Product;

public class ShopDao {

	public ArrayList<Member> selectOneShop(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<Member>();
		String query = "select * from member where member_level=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, 2);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member m = new Member();
				m.setAddr(rset.getString("addr"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setMemberBirth(rset.getDate("member_birth"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberLevel(rset.getInt("member_level"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberNickname(rset.getString("member_nickname"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setPhone(rset.getString("phone"));
				m.setProfileImg(rset.getString("profile_img"));
				list.add(m);
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

	public int insertShop(Connection conn, Product p) {
	      PreparedStatement pstmt = null;
	      int result = 0;
	      String query = "insert into product values(?,?,?,null,null)";
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setInt(1, p.getProductNo());
	         pstmt.setString(2, p.getBnMemberId());
	         pstmt.setInt(3, p.getOptionNo());
	         result = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	         JDBCTemplate.close(pstmt);
	      }
	      return result;
	      
	   }

	   public int totalCount(Connection conn) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      int result = 0;
	      String query = "select count(*) cnt from product";
	      try {
	         pstmt = conn.prepareStatement(query);
	         rset = pstmt.executeQuery();
	         if(rset.next()) {
	            result = rset.getInt("cnt");
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

	   public ArrayList<Product> morePhoto(Connection conn, int start, int end) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      ArrayList<Product> list = new ArrayList<Product>();
	      String query = "select * from(select ROWNUM as rnum,p.*from (select * from photo order by photo_no desc)p) where rnum between ? and ?";
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setInt(1, start);
	         pstmt.setInt(2, end);
	         rset = pstmt.executeQuery();
	         while(rset.next()) {
	            Product p = new Product();
	            p.setProductNo(rset.getInt("product_no"));
	            p.setBnMemberId(rset.getString("bn_member_id"));
	            p.setOptionNo(rset.getInt("option_no"));
	            p.setProductFilename(rset.getString("product_filename"));
	            p.setProductFilepath(rset.getString("product_filepath"));
	            list.add(p);
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
	
	
	
	
	
}
