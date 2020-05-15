package shop.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import dessert.model.vo.Product;
import member.model.vo.Member;

public class ShopDao {

	public ArrayList<Member> shopList(Connection conn) {
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

	public Product selectOneShop(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
		String query = "select * from product where member_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				p = new Product();
				p.setBnMemberId(rset.getString("bn_member_id"));
				p.setOptionNo(rset.getInt("option_no"));
				p.setProductFilename(rset.getString("product_filename"));
				p.setProductFilepath(rset.getString("product_filepath"));
				p.setProductNo(rset.getInt("product_no"));
				p.setProductTitle(rset.getString("product_title"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return p;
	}
	
}
