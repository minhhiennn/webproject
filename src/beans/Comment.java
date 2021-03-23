package beans;

import java.io.Serializable;
import java.sql.Date;

public class Comment implements Serializable {
	private static final long serialVersionUID = 1L;
	private int ID;
	private String tennguoigui;
	private java.sql.Date ngaygui;
	private String binhluan;
	private int product_id;

	public Comment(int iD, String tennguoigui, Date ngaygui, String binhluan, int product_id) {
		super();
		ID = iD;
		this.tennguoigui = tennguoigui;
		this.ngaygui = ngaygui;
		this.binhluan = binhluan;
		this.product_id = product_id;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getTennguoigui() {
		return tennguoigui;
	}

	public void setTennguoigui(String tennguoigui) {
		this.tennguoigui = tennguoigui;
	}

	public java.sql.Date getNgaygui() {
		return ngaygui;
	}

	public void setNgaygui(java.sql.Date ngaygui) {
		this.ngaygui = ngaygui;
	}

	public String getBinhluan() {
		return binhluan;
	}

	public void setBinhluan(String binhluan) {
		this.binhluan = binhluan;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	@Override
	public String toString() {
		return "Comment [ID=" + ID + ", tennguoigui=" + tennguoigui + ", ngaygui=" + ngaygui + ", binhluan=" + binhluan
				+ ", product_id=" + product_id + "]";
	}

}
