package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Product;
import beans.User;
import beans.WishList;
import beans.WishListItem;

public class WishListDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public WishListDao() throws SQLException {
		this.conn = Connect.getConnection();
	}

	// TODO FIND WISH LIST BY USER ID
	public int findWishListByUserID(int idUser) {
		try {
			pstmt = conn.prepareStatement("Select * from wishlist where ID = ?");
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

	// TODO CREATE NEW WISH LIST IF USER DONT HAVE
	public void createNewWishListIfUserDontHave(int userID) {
		if (findWishListByUserID(userID) == -1) {
			try {
				pstmt = conn.prepareStatement("insert into wishlist (ID) values (?)");
				pstmt.setInt(1, userID);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			return;
		}
	}

	// TODO GET LIST WISH LIST ITEM BY WISH LIST ID
	public ArrayList<WishListItem> getListWishListItemByWishListID(int wishListID) {
		ArrayList<WishListItem> list = new ArrayList<WishListItem>();
		try {
			pstmt = conn.prepareStatement("select * from wishlistItem where wishlist_id = ?");
			pstmt.setInt(1, wishListID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				int product_id = rs.getInt("product_id");
				Product product = new ProductDao().getProductByID(product_id);
				WishListItem wishListItem = new WishListItem(ID, product);
				list.add(wishListItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// TODO GET WISH LIST BY USER ID
	public WishList getWishListByUserId(int userID) {
		WishList wishList = null;
		try {
			pstmt = conn.prepareStatement("select * from wishlist where ID = ?");
			pstmt.setInt(1, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				User user = new UserDAO().getUserByID(ID);
				ArrayList<WishListItem> list = this.getListWishListItemByWishListID(ID);
				wishList = new WishList(ID, user, list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return wishList;
	}

	// TODO FIND PRODUCT IN WISH LIST ITEM
	public int findProductInWishListItem(int productID, int wishlistID) {
		try {
			pstmt = conn.prepareStatement("select * from wishlistItem where product_id = ? and wishlist_id = ?");
			pstmt.setInt(1, productID);
			pstmt.setInt(2, wishlistID);
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

	// TODO INSERT NEW PRODUCT INTO WISHLIST ITEM
	public void insertProductIntoWishListItem(int ID, int productID, int wishlistID) {
		try {
			pstmt = conn.prepareStatement("insert into wishlistItem (ID,product_id,wishlist_id) values (?,?,?)");
			pstmt.setInt(1, ID);
			pstmt.setInt(2, productID);
			pstmt.setInt(3, wishlistID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// TODO DELETE WISH LIST ITEM BY WISHLIST ID
	public void deleteWishListItemByWishListID(int wishlist_id) {
		try {
			pstmt = conn.prepareStatement("delete from wishlistItem where wishlist_id = ?");
			pstmt.setInt(1, wishlist_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// TODO DELETE WISH LIST BY USER ID
	public void deleteWishListByUserID(int user_id) {
		try {
			pstmt = conn.prepareStatement("delete from wishlist where ID = ?");
			pstmt.setInt(1, user_id);
			pstmt.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}