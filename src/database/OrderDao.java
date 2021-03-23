package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.DonHang;
import beans.OrderDetail;
import beans.User;

public class OrderDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public OrderDao() throws SQLException {
		conn = Connect.getConnection();
	}

	// TODO FIND DON HANG USER BY ID (RETURN BOOLEAN)
	public int findDonHangByUserID(int idUser) {
		try {
			pstmt = conn.prepareStatement("select * from donhang where ID = ?");
			pstmt.setInt(1, idUser);
			rs = pstmt.executeQuery();
			boolean more = rs.next();
			if (more) {
				return 1;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	// TODO CREATE NEW DON HANG IF USER DONT HAVE
	public void createNewDonHangWhenUserDontHave(int userID) {
		if (findDonHangByUserID(userID) == -1) {
			try {
				pstmt = conn.prepareStatement("insert into donhang (ID) values (?)");
				pstmt.setInt(1, userID);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			return;
		}
	}

	// TODO COUNT ORDER DETAIL BY ORDER ID
	public int countOrderDetailByOrderID(int order_id) {
		int count = 0;
		try {
			pstmt = conn.prepareStatement("select TOP(1) ID from orderDetail where order_id = ? order by ID DESC");
			pstmt.setInt(1, order_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	// TODO INSERT ORDER DETAIL BY ORDER ID
	public void insertOrderDetailByOrderID(int order_id, String country, String name, String address, String city,
			String phone, int total) {
		int viTri = countOrderDetailByOrderID(order_id) + 1;
		try {
			pstmt = conn.prepareStatement(
					"insert into orderDetail (ID,order_id,quocgia,hovaten,diachi,thanhpho,sodienthoai,ngaydathang,total) values (?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, viTri);
			pstmt.setInt(2, order_id);
			pstmt.setString(3, country);
			pstmt.setString(4, name);
			pstmt.setString(5, address);
			pstmt.setString(6, city);
			pstmt.setString(7, phone);
			java.sql.Date date = this.getCurrentDatetime();
			pstmt.setDate(8, date);
			pstmt.setInt(9, total);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// TODO GET CURRENT DATE TIME
	public Date getCurrentDatetime() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());

	}

// TODO GET LIST ORDER DETAIL BY ORDER ID
	public ArrayList<OrderDetail> getListOrderDetailByOrderID(int orderID) {
		ArrayList<OrderDetail> list = new ArrayList<OrderDetail>();
		try {
			pstmt = conn.prepareStatement("select * from orderDetail where order_id = ?");
			pstmt.setInt(1, orderID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				int order_id = rs.getInt("order_id");
				String quocgia = rs.getString("quocgia");
				String hovaten = rs.getString("hovaten");
				String diachi = rs.getString("diachi");
				String thanhpho = rs.getString("thanhpho");
				String sodienthoai = rs.getString("sodienthoai");
				java.sql.Date ngaydathang = rs.getDate("ngaydathang");
				int total = rs.getInt("total");
				OrderDetail orderDetail = new OrderDetail(ID, order_id, quocgia, hovaten, diachi, thanhpho, sodienthoai,
						ngaydathang, total);
				list.add(orderDetail);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

// TODO GET ORDER DETAIL
	public OrderDetail getOrderDetail(int OrderDetailID, int orderID) {
		OrderDetail orderDetail = null;
		try {
			pstmt = conn.prepareStatement("select * from orderDetail where order_id = ? and ID = ? ");
			pstmt.setInt(1, orderID);
			pstmt.setInt(2, OrderDetailID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				int order_id = rs.getInt("order_id");
				String quocgia = rs.getString("quocgia");
				String hovaten = rs.getString("hovaten");
				String diachi = rs.getString("diachi");
				String thanhpho = rs.getString("thanhpho");
				String sodienthoai = rs.getString("sodienthoai");
				java.sql.Date ngaydathang = rs.getDate("ngaydathang");
				int total = rs.getInt("total");
				orderDetail = new OrderDetail(ID, order_id, quocgia, hovaten, diachi, thanhpho, sodienthoai,
						ngaydathang, total);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderDetail;
	}

// TODO GET DON HANG BY USER ID	
	public DonHang getDonHangByUserID(int userID) {
		DonHang donHang = null;
		try {
			pstmt = conn.prepareStatement("select * from donhang where ID = ?");
			pstmt.setInt(1, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				User user = new UserDAO().getUserByID(userID);
				ArrayList<OrderDetail> list = this.getListOrderDetailByOrderID(userID);
				donHang = new DonHang(ID, user, list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return donHang;
	}

// TODO DELETE ORDER DETAIL BY ORDER DETAIL ID
	public void deleteOrderDetailByOrderDetailID(int orderDetailID, int order_id) {
		try {
			pstmt = conn.prepareStatement("delete from orderDetail where ID = ? and order_id= ?");
			pstmt.setInt(1, orderDetailID);
			pstmt.setInt(2, order_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

// TODO DELETE ORDER DETAIL BY ORDER ID
	public void deleteOrderDetailByOrderID(int order_id) {
		try {
			pstmt = conn.prepareStatement("delete from orderDetail where order_id= ?");
			pstmt.setInt(1, order_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

// TODO DELETE ORDER BY USER ID
	public void deleteOrderByUserID(int user_id) {
		try {
			pstmt = conn.prepareStatement("delete from donhang where ID = ?");
			pstmt.setInt(1, user_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

// TODO GET LIST ORDER DETAIL
	public ArrayList<OrderDetail> getListOrderDetail() {
		ArrayList<OrderDetail> list = new ArrayList<OrderDetail>();
		try {
			pstmt = conn.prepareStatement("select * from orderDetail");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				int order_id = rs.getInt("order_id");
				String quocgia = rs.getString("quocgia");
				String hovaten = rs.getString("hovaten");
				String diachi = rs.getString("diachi");
				String thanhpho = rs.getString("thanhpho");
				String sodienthoai = rs.getString("sodienthoai");
				java.sql.Date ngaydathang = rs.getDate("ngaydathang");
				int total = rs.getInt("total");
				OrderDetail orderDetail = new OrderDetail(ID, order_id, quocgia, hovaten, diachi, thanhpho, sodienthoai,
						ngaydathang, total);
				list.add(orderDetail);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public static void main(String[] args) throws SQLException {
		OrderDao orderDao = new OrderDao();
		DonHang donHang = orderDao.getDonHangByUserID(1);
		System.out.println(donHang.getList().size());
	}
}
