package beans;

import java.io.Serializable;

public class CartItem implements Serializable{
	private int ID;
	private Product product;
	private int soLuong;
	private int price;
	public CartItem() {
	}
	public CartItem(int iD, Product product, int soLuong, int price) {
		ID = iD;
		this.product = product;
		this.soLuong = soLuong;
		this.price = price;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "CartItem [ID=" + ID + ", product=" + product + ", soLuong=" + soLuong + ", price=" + price + "]";
	}
	
}
