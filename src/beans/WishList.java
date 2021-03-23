package beans;

import java.util.ArrayList;

public class WishList {
	private int ID;
	private User customer;
	private ArrayList<WishListItem> list = new ArrayList<WishListItem>();

	public WishList() {
	}

	public WishList(int iD, User customer, ArrayList<WishListItem> list) {
		ID = iD;
		this.customer = customer;
		this.list = list;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public User getCustomer() {
		return customer;
	}

	public void setCustomer(User customer) {
		this.customer = customer;
	}

	public ArrayList<WishListItem> getList() {
		return list;
	}

	public void setList(ArrayList<WishListItem> list) {
		this.list = list;
	}

}
