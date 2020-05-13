package common.vo;

public class ProductOption {
	private int optionNo;
	private String bnMemberId;
	private int optionTitle;
	private int optionPrice;
	public ProductOption() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductOption(int optionNo, String bnMemberId, int optionTitle, int optionPrice) {
		super();
		this.optionNo = optionNo;
		this.bnMemberId = bnMemberId;
		this.optionTitle = optionTitle;
		this.optionPrice = optionPrice;
	}
	public int getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}
	public String getBnMemberId() {
		return bnMemberId;
	}
	public void setBnMemberId(String bnMemberId) {
		this.bnMemberId = bnMemberId;
	}
	public int getOptionTitle() {
		return optionTitle;
	}
	public void setOptionTitle(int optionTitle) {
		this.optionTitle = optionTitle;
	}
	public int getOptionPrice() {
		return optionPrice;
	}
	public void setOptionPrice(int optionPrice) {
		this.optionPrice = optionPrice;
	}
	
}
