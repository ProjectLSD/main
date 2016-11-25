package band.model;

import org.springframework.stereotype.Component;

@Component
public class Band {
	String id;
	String pass;
	String email;
	String phonenum1;
	String phonenum2;
	String phonenum3;
	String paycheck="no";
	String info="";
	int downcount=0;
	int likes=0;
	int amountcash=0;
	int point=0;
	String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhonenum1() {
		return phonenum1;
	}
	public void setPhonenum1(String phonenum1) {
		this.phonenum1 = phonenum1;
	}
	public String getPhonenum2() {
		return phonenum2;
	}
	public void setPhonenum2(String phonenum2) {
		this.phonenum2 = phonenum2;
	}
	public String getPhonenum3() {
		return phonenum3;
	}
	public void setPhonenum3(String phonenum3) {
		this.phonenum3 = phonenum3;
	}
	public String getPaycheck() {
		return paycheck;
	}
	public void setPaycheck(String paycheck) {
		this.paycheck = paycheck;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getDowncount() {
		return downcount;
	}
	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getAmountcash() {
		return amountcash;
	}
	public void setAmountcash(int amountcash) {
		this.amountcash = amountcash;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
}
