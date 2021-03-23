package beans;

import java.io.Serializable;

public class Product implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int ID;
	private String name;
	private int price;
	private String typeproduct;
	private String thuocnhom;
	private String description;
	private int soLuongTonKho;

	public Product(int iD, String name, int price, String typeproduct, String thuocnhom, String description,
			int soLuongTonKho) {
		super();
		ID = iD;
		this.name = name;
		this.price = price;
		this.typeproduct = typeproduct;
		this.thuocnhom = thuocnhom;
		this.description = description;
		this.soLuongTonKho = soLuongTonKho;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTypeproduct() {
		return typeproduct;
	}

	public void setTypeproduct(String typeproduct) {
		this.typeproduct = typeproduct;
	}

	public String getThuocnhom() {
		return thuocnhom;
	}

	public void setThuocnhom(String thuocnhom) {
		this.thuocnhom = thuocnhom;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getSoLuongTonKho() {
		return soLuongTonKho;
	}

	public void setSoLuongTonKho(int soLuongTonKho) {
		this.soLuongTonKho = soLuongTonKho;
	}

	@Override
	public String toString() {
		return "Product [ID=" + ID + ", name=" + name + ", price=" + price + ", typeproduct=" + typeproduct
				+ ", thuocnhom=" + thuocnhom + ", description=" + description + ", soLuongTonKho=" + soLuongTonKho
				+ "]";
	}

}
