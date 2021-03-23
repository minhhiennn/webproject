package beans;

import java.util.ArrayList;

public class DonHang {
	private int ID;
	private User customer;
	private ArrayList<OrderDetail> list = new ArrayList<OrderDetail>();

	public DonHang(int iD, User customer, ArrayList<OrderDetail> list) {
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

	public ArrayList<OrderDetail> getList() {
		return list;
	}

	public void setList(ArrayList<OrderDetail> list) {
		this.list = list;
	}

}
