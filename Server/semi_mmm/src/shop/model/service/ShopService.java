package shop.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.vo.Member;
import shop.model.dao.ShopDao;
import shop.model.vo.Product;

public class ShopService {

	public ArrayList<Member> shopList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = new ShopDao().shopList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public Product selectOneShop(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		Product p = new ShopDao().selectOneShop(conn, memberId);
		JDBCTemplate.close(conn);
		return p;
	}
	
	
	
	
}
