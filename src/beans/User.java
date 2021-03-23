package beans;

import java.io.Serializable;

public class User implements Serializable {

	private int ID;
	private String username;
	private String password;
	private String quyen;
	public boolean valid;

	public User() {
		super();
	}

	public User(int iD, String username, String password, String quyen, boolean valid) {
		ID = iD;
		this.username = username;
		this.password = password;
		this.quyen = quyen;
		this.valid = valid;
	}

	public User(int iD, String username, String password, String quyen) {
		super();
		ID = iD;
		this.username = username;
		this.password = password;
		this.quyen = quyen;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getQuyen() {
		return quyen;
	}

	public void setQuyen(String quyen) {
		this.quyen = quyen;
	}

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}

	@Override
	public String toString() {
		return "User [ID=" + ID + ", username=" + username + ", password=" + password + ", quyen=" + quyen + ", valid="
				+ valid + "]";
	}

}
