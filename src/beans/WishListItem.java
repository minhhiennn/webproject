package beans;

public class WishListItem {
	private int ID;
	private Product product;

	public WishListItem() {
	}

	public WishListItem(int iD, Product product) {
		ID = iD;
		this.product = product;
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

}
