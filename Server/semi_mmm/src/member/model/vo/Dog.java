package member.model.vo;

public class Dog {
	private String dogId;
	private String dogMemberId;
	private String variety;
	private int age;
	private char dogGender;
	private String dogImg;
	private int dogBool;
	public Dog() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Dog(String dogId, String dogMemberId, String variety, int age, char dogGender, String dogImg, int dogBool) {
		super();
		this.dogId = dogId;
		this.dogMemberId = dogMemberId;
		this.variety = variety;
		this.age = age;
		this.dogGender = dogGender;
		this.dogImg = dogImg;
		this.dogBool = dogBool;
	}
	public String getDogId() {
		return dogId;
	}
	public void setDogId(String dogId) {
		this.dogId = dogId;
	}
	public String getDogMemberId() {
		return dogMemberId;
	}
	public void setDogMemberId(String dogMemberId) {
		this.dogMemberId = dogMemberId;
	}
	public String getVariety() {
		return variety;
	}
	public void setVariety(String variety) {
		this.variety = variety;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public char getDogGender() {
		return dogGender;
	}
	public void setDogGender(char dogGender) {
		this.dogGender = dogGender;
	}
	public String getDogImg() {
		return dogImg;
	}
	public void setDogImg(String dogImg) {
		this.dogImg = dogImg;
	}
	public int getDogBool() {
		return dogBool;
	}
	public void setDogBool(int dogBool) {
		this.dogBool = dogBool;
	}
	
}
