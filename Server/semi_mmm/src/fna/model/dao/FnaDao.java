package fna.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import fna.model.vo.Fna;

public class FnaDao {

	public ArrayList<Fna>selectAll (Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select*from fna";
		ArrayList<Fna> fna = new ArrayList<Fna>();
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Fna f = new Fna();
				f.setQnaNo(rset.getInt("qna_no"));
				f.setQuestion(rset.getString("question"));
				f.setAnswer(rset.getString("answer"));
				fna.add(f);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return fna;
	}


}
