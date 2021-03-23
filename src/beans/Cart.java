package beans;

import java.io.Serializable;
import java.util.ArrayList;

public class Cart implements Serializable{
	private int ID;
	private User customer;
	private ArrayList<CartItem> list = new ArrayList<CartItem>();
	private int total;

	public Cart(int iD, User customer, ArrayList<CartItem> list, int total) {
		ID = iD;
		this.customer = customer;
		this.list = list;
		this.total = total;
	}

	public Cart() {
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

	public ArrayList<CartItem> getList() {
		return list;
	}

	public void setList(ArrayList<CartItem> list) {
		this.list = list;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
