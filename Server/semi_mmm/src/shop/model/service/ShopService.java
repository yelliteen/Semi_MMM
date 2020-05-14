package shop.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.vo.Member;
import shop.model.dao.ShopDao;
import shop.model.vo.Product;

public class ShopService {

	public ArrayList<Member> selectOneShop() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = new ShopDao().selectOneShop(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public int insertShop(Product p) {
	      Connection conn = JDBCTemplate.getConnection();
	      int result = new ShopDao().insertShop(conn,p);
	      if(result>0) {
	         JDBCTemplate.commit(conn);
	      }else {
	         JDBCTemplate.rollback(conn);
	      }
	      JDBCTemplate.close(conn);
	      return result;
	   }

	   public int totalCount() {
	      Connection conn = JDBCTemplate.getConnection();
	      int totalCount = new ShopDao().totalCount(conn);
	      JDBCTemplate.close(conn);
	      return totalCount;
	   }

	   public ArrayList<Product> morePhoto(int start) {
	      Connection conn = JDBCTemplate.getConnection();
	      int length = 5;//한번에 더 가지고 올 사진 수
	      int end = start+length-1;
	      ArrayList<Product> list = new ShopDao().morePhoto(conn,start,end);
	      JDBCTemplate.close(conn);
	      return list;
	   }
	
	
}
