package database;

import beans.User;

import java.sql.*;
import java.util.ArrayList;

public class UserDAO {
	static Connection currentCon = null;
	static ResultSet rs = null;

	public static User login(User currentUser) throws SQLException {
		currentCon = Connect.getConnection();
//		currentCon = DBCPDataSource.getConnection();
		// preparing some objects for connection

		String username = currentUser.getUsername();
		String password = currentUser.getPassword();

		try {
			// connect to DB
			PreparedStatement ps = currentCon
					.prepareStatement("Select * from users where username = ? and password = ? ");
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			boolean more = rs.next();

			// if user does not exist set the isValid variable to false
			if (!more) {
				currentUser.setValid(false);
			}

			// if user exists set the isValid variable to true
			else if (more) {
				int ID = rs.getInt("ID");
				String quyen = rs.getString("quyen");
				currentUser.setID(ID);
				currentUser.setQuyen(quyen);
				new CartDao().createNewCartWhenUserDontHave(ID);
				new WishListDao().createNewWishListIfUserDontHave(ID);
				new OrderDao().createNewDonHangWhenUserDontHave(ID);
				currentUser.setValid(true);
			}
		}

		catch (SQLException e) {
			e.printStackTrace();
		}

		// some exception handling

		return currentUser;

	}

	public static User register(User currentUser) throws SQLException {

		// preparing some objects for connection
		currentCon = Connect.getConnection();
//		currentCon = DBCPDataSource.getConnection();
		String username = currentUser.getUsername();
		String password = currentUser.getPassword();

		// "System.out.println" prints in the console; Normally used to trace the
		// process

		try {
			PreparedStatement ps = currentCon.prepareStatement("Select * from users where username = ?");
			ps.setString(1, username);
			rs = ps.executeQuery();
			boolean more = rs.next();

			// if user does not exist set the isValid variable to false
			if (!more) {
				currentUser.setValid(false);
				ps = currentCon.prepareStatement("insert into users (ID,username,password,quyen) values (?,?,?,?)");
				int ID = countUserInDataBase() + 1;
				ps.setInt(1, ID);
				ps.setString(2, username);
				ps.setString(3, password);
				ps.setString(4, "user");
				ps.executeUpdate();
			}

			// if user exists set the isValid variable to true
			if (more) {
				currentUser.setValid(true);

			}
		}

		catch (Exception ex) {
			ex.printStackTrace();
		}

		return currentUser;
	}

	// TODO LOGIN FROM ADMIN
	public static User loginFromAdmin(User admin) throws SQLException {
		currentCon = Connect.getConnection();
//		currentCon = DBCPDataSource.getConnection();
		// preparing some objects for connection

		String username = admin.getUsername();
		String password = admin.getPassword();

		try {
			// connect to DB
			PreparedStatement ps = currentCon
					.prepareStatement("Select * from users where username = ? and password = ? and quyen = ?");
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, "admin");
			rs = ps.executeQuery();
			boolean more = rs.next();

			// if user does not exist set the isValid variable to false
			if (!more) {
				admin.setValid(false);
			}

			// if user exists set the isValid variable to true
			else if (more) {
				int ID = rs.getInt("ID");
				String quyen = rs.getString("quyen");
				admin.setID(ID);
				admin.setQuyen(quyen);
				admin.setValid(true);
			}
		}

		catch (SQLException e) {
			e.printStackTrace();
		}

		// some exception handling

		return admin;
	}

	// TODO COUNT USER IN DATABASE
	public static int countUserInDataBase() throws SQLException {
		int count = 0;
		currentCon = Connect.getConnection();
//		currentCon = DBCPDataSource.getConnection();
		PreparedStatement ps = currentCon.prepareStatement("select TOP(1) ID from users order by ID DESC");
		rs = ps.executeQuery();
		while (rs.next()) {
			count = rs.getInt(1);
		}
		return count;
	}

	// TODO UPDATE PASSWORD FOR USER
	public static int updatePasswordForUser(String email, String newPassword) throws SQLException {
		currentCon = Connect.getConnection();
		PreparedStatement ps = currentCon.prepareStatement("update users set password = ? where username = ?");
		ps.setString(1, newPassword);
		ps.setString(2, email);
		int i = ps.executeUpdate();
		return i;
	}

	// TODO GET USER BY ID
	public User getUserByID(int userID) {
		User user = null;
		try {
			currentCon = Connect.getConnection();
//			currentCon = DBCPDataSource.getConnection();
			PreparedStatement ps = currentCon.prepareStatement("select * from users where ID = ?");
			ps.setInt(1, userID);
			rs = ps.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String quyen = rs.getString("quyen");
				boolean valid = true;
				user = new User(ID, username, password, quyen, valid);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	public ArrayList<User> getListUser() {
		ArrayList<User> list = new ArrayList<User>();
		User user = null;
		try {
			currentCon = Connect.getConnection();
//			currentCon = DBCPDataSource.getConnection();
			PreparedStatement ps = currentCon.prepareStatement("select * from users");
			rs = ps.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt(1);
				String username = rs.getString(2);
				String password = rs.getString(3);
				String quyen = rs.getString(4);
				boolean valid = true;
				user = new User(ID, username, password, quyen, valid);
				list.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public static void insert(String username, String password, String quyen) throws SQLException {

		// preparing some objects for connection
		currentCon = Connect.getConnection();
//		currentCon = DBCPDataSource.getConnection();

		int viTriMoi = countUserInDataBase() + 1;
		try {
			PreparedStatement ps;

			ps = currentCon.prepareStatement("insert into users (ID,username,password,quyen) values (?,?,?,?)");
			ps.setInt(1, viTriMoi);
			ps.setString(2, username);
			ps.setString(3, password);
			ps.setString(4, quyen);
			ps.executeUpdate();

		}

		catch (Exception ex) {
			System.out.println("sai");
		}

	}

	public static boolean delete(int ID) throws SQLException {

		// preparing some objects for connection
		currentCon = Connect.getConnection();
//		currentCon = DBCPDataSource.getConnection();

		try {
			PreparedStatement ps;
			ps = currentCon.prepareStatement("delete users where ID=?");
			ps.setInt(1, ID);
			ps.executeUpdate();
			new CartDao().deleteCartItemByCartID(ID);
			new CartDao().deleteCartByUserID(ID);
			new WishListDao().deleteWishListItemByWishListID(ID);
			new WishListDao().deleteWishListByUserID(ID);
			new OrderDao().deleteOrderDetailByOrderID(ID);
			new OrderDao().deleteOrderByUserID(ID);

		}

		catch (Exception ex) {
			System.out.println("sai");
		}

		// some exception handling
		return true;
	}

	public static boolean deleteALL() throws SQLException {

		// preparing some objects for connection
		currentCon = Connect.getConnection();
//		currentCon = DBCPDataSource.getConnection();

		// "System.out.println" prints in the console; Normally used to trace the
		// process

		try {
			PreparedStatement ps;

			// if user does not exist set the isValid variable to false

			ps = currentCon.prepareStatement("delete users");
			ps.executeUpdate();

		}

		catch (Exception ex) {
			System.out.println("sai");
		}

		// some exception handling
		return true;
	}

	// TODO UPDATE USER BY ID
	public void updateUserByID(int userID, String username, String password, String quyen) {
		try {
			currentCon = Connect.getConnection();
			PreparedStatement ps = currentCon
					.prepareStatement("update users set username = ?,password=?,quyen=? where ID = ?");
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, quyen);
			ps.setInt(4, userID);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws SQLException {
		UserDAO userDAO = new UserDAO();
//		User user = userDAO.getUserByID(1);
//		System.out.println(user);
		userDAO.updateUserByID(1, "hienpro@gmail.com", "123456", "user");
	}
}
