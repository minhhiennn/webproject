package beans;

import java.io.Serializable;

public class Img implements Serializable {
	private int ID;
	private int productID;
	private String fileImg;

	public Img() {
	}

	public Img(int iD, int productID, String fileImg) {
		super();
		ID = iD;
		this.productID = productID;
		this.fileImg = fileImg;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getFileImg() {
		return fileImg;
	}

	public void setFileImg(String fileImg) {
		this.fileImg = fileImg;
	}

	@Override
	public String toString() {
		return "Img [ID=" + ID + ", productID=" + productID + ", fileImg=" + fileImg + "]";
	}

}
