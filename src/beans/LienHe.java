package beans;

import java.io.Serializable;
import java.sql.Date;

public class LienHe implements Serializable {
	private int id;
	private String  email;
	private Date ngayGui;
	private String chuDe;
	private String noiDung;
	private String trangThai;
	public LienHe() {
		super();
	}
	public LienHe(int id, String email, Date ngayGui, String chuDe, String noiDung,
			String trangThai) {
		super();
		this.id = id;
		this.email = email;
		this.ngayGui = ngayGui;
		this.chuDe = chuDe;
		this.noiDung = noiDung;
		this.trangThai=trangThai;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getNgayGui() {
		return ngayGui;
	}
	public void setNgayGui(Date ngayGui) {
		this.ngayGui = ngayGui;
	}
	public String getChuDe() {
		return chuDe;
	}
	public void setChuDe(String chuDe) {
		this.chuDe = chuDe;
	}
	public String getNoiDung() {
		return noiDung;
	}
	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	@Override
	public String toString() {
		return "lienhe [id=" + id +  ", email=" + email + ", ngayGui=" + ngayGui
				+ ", chuDe=" + chuDe + ", noiDung=" + noiDung + ", trangThai=" + trangThai + "]";
	}
	
}
