package common.vo;

public class OrderDetail {
	private int orderNum;
	private String orderMemberId;
	private String bnMemberId;
	private int productNum;
	private int orderCount;
	private String orderComment;
	public OrderDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderDetail(int orderNum, String orderMemberId, String bnMemberId, int productNum, int orderCount,
			String orderComment) {
		super();
		this.orderNum = orderNum;
		this.orderMemberId = orderMemberId;
		this.bnMemberId = bnMemberId;
		this.productNum = productNum;
		this.orderCount = orderCount;
		this.orderComment = orderComment;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getOrderMemberId() {
		return orderMemberId;
	}
	public void setOrderMemberId(String orderMemberId) {
		this.orderMemberId = orderMemberId;
	}
	public String getBnMemberId() {
		return bnMemberId;
	}
	public void setBnMemberId(String bnMemberId) {
		this.bnMemberId = bnMemberId;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public String getOrderComment() {
		return orderComment;
	}
	public void setOrderComment(String orderComment) {
		this.orderComment = orderComment;
	}
	
}
