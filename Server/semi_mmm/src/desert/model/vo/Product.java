package desert.model.vo;

public class Product {
	private int productNo;
	private String bnMemberId;
	private int optionNo;
	private String productFilename;
	private String productFilepath;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(int productNo, String bnMemberId, int optionNo, String productFilename, String productFilepath) {
		super();
		this.productNo = productNo;
		this.bnMemberId = bnMemberId;
		this.optionNo = optionNo;
		this.productFilename = productFilename;
		this.productFilepath = productFilepath;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getBnMemberId() {
		return bnMemberId;
	}
	public void setBnMemberId(String bnMemberId) {
		this.bnMemberId = bnMemberId;
	}
	public int getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}
	public String getProductFilename() {
		return productFilename;
	}
	public void setProductFilename(String productFilename) {
		this.productFilename = productFilename;
	}
	public String getProductFilepath() {
		return productFilepath;
	}
	public void setProductFilepath(String productFilepath) {
		this.productFilepath = productFilepath;
	}
	
	
}
