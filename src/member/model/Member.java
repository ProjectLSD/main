package member.model;


public class Member {
		String id;
		String pass;
		String email;
		String phonenum1;
		String phonenum2;
		String phonenum3;
		int point=0;
		int likelikt=0;
		
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
		public int getPoint() {
			return point;
		}
		public void setPoint(int point) {
			this.point = point;
		}
		public int getLikelikt() {
			return likelikt;
		}
		public void setLikelikt(int likelikt) {
			this.likelikt = likelikt;
		}
	
	
}
