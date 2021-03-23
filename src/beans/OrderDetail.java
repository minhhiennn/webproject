package beans;

import java.sql.Date;

public class OrderDetail {
	private int ID;
	private int order_id;
	private String quocgia;
	private String hoten;
	private String diachi;
	private String thanhpho;
	private String sodienthoai;
	private java.sql.Date ngaydathang;
	private int total;

	public OrderDetail(int iD, int order_id, String quocgia, String hoten, String diachi, String thanhpho,
			String sodienthoai, Date ngaydathang, int total) {
		ID = iD;
		this.order_id = order_id;
		this.quocgia = quocgia;
		this.hoten = hoten;
		this.diachi = diachi;
		this.thanhpho = thanhpho;
		this.sodienthoai = sodienthoai;
		this.ngaydathang = ngaydathang;
		this.total = total;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public String getQuocgia() {
		return quocgia;
	}

	public void setQuocgia(String quocgia) {
		this.quocgia = quocgia;
	}

	public String getHoten() {
		return hoten;
	}

	public void setHoten(String hoten) {
		this.hoten = hoten;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public String getThanhpho() {
		return thanhpho;
	}

	public void setThanhpho(String thanhpho) {
		this.thanhpho = thanhpho;
	}

	public String getSodienthoai() {
		return sodienthoai;
	}

	public void setSodienthoai(String sodienthoai) {
		this.sodienthoai = sodienthoai;
	}

	public java.sql.Date getNgaydathang() {
		return ngaydathang;
	}

	public void setNgaydathang(java.sql.Date ngaydathang) {
		this.ngaydathang = ngaydathang;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
