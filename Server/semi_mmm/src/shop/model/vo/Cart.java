package shop.model.vo;

public class Cart {
	private int cartNo;
	private String orderMemberId;
	private int productNo;
	private int cartCount;
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cart(int cartNo, String orderMemberId, int productNo, int cartCount) {
		super();
		this.cartNo = cartNo;
		this.orderMemberId = orderMemberId;
		this.productNo = productNo;
		this.cartCount = cartCount;
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public String getOrderMemberId() {
		return orderMemberId;
	}
	public void setOrderMemberId(String orderMemberId) {
		this.orderMemberId = orderMemberId;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getCartCount() {
		return cartCount;
	}
	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}
	
}
