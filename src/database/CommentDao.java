package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Comment;

public class CommentDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public CommentDao() throws SQLException {
		super();
		conn = Connect.getConnection();
	}

	public void insertIntoBinhLuan(int productID, String tennguoigui, String binhluan) {
		int viTri = this.countCommentByproductID(productID) + 1;
		try {
			pstmt = conn.prepareStatement(
					"insert into binhluan (ID,tennguoigui,ngaygui,binhluan,product_id) values (?,?,?,?,?)");
			pstmt.setInt(1, viTri);
			pstmt.setString(2, tennguoigui);
			java.sql.Date date = this.getCurrentDatetime();
			pstmt.setDate(3, date);
			pstmt.setString(4, binhluan);
			pstmt.setInt(5, productID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int countCommentByproductID(int productID) {
		int count = 0;
		try {
			pstmt = conn.prepareStatement("select TOP(1) ID from binhluan where product_id = ? order by ID desc");
			pstmt.setInt(1, productID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	// TODO GET CURRENT DATE TIME
	public Date getCurrentDatetime() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());

	}

	// TODO GET ALL LIST COMMENT
	public ArrayList<Comment> getAllListComment() {
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			pstmt = conn.prepareStatement("select * from binhluan");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String tennguoigui = rs.getString("tennguoigui");
				java.sql.Date ngaygui = rs.getDate("ngaygui");
				String binhluan = rs.getString("binhluan");
				int product_id = rs.getInt("product_id");
				Comment comment = new Comment(ID, tennguoigui, ngaygui, binhluan, product_id);
				list.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// TODO GET LIST COMMENT BY PRODUCT ID
	public ArrayList<Comment> getListCommentByProductID(int productID) {
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			pstmt = conn.prepareStatement("select * from binhluan where product_id = ?");
			pstmt.setInt(1, productID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String tennguoigui = rs.getString("tennguoigui");
				java.sql.Date ngaygui = rs.getDate("ngaygui");
				String binhluan = rs.getString("binhluan");
				int product_id = rs.getInt("product_id");
				Comment comment = new Comment(ID, tennguoigui, ngaygui, binhluan, product_id);
				list.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// TODO GET LIST COMMENT BY PRODUCT ID (PAGINATION)
	public ArrayList<Comment> getListCommentByProductID(int productID, int index, int size) {
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by ID) as row,* from binhluan where product_id = ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setInt(1, productID);
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(2, startPage);
			pstmt.setInt(3, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String tennguoigui = rs.getString("tennguoigui");
				java.sql.Date ngaygui = rs.getDate("ngaygui");
				String binhluan = rs.getString("binhluan");
				int product_id = rs.getInt("product_id");
				Comment comment = new Comment(ID, tennguoigui, ngaygui, binhluan, product_id);
				list.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;

	}

	// TODO DELETE COMMENT BY ID AND PRODUCT ID
	public void deleteCommentByIDAndProductID(int commentID, int ProductID) {
		try {
			pstmt = conn.prepareStatement("delete from binhluan where ID = ? and product_id = ?");
			pstmt.setInt(1, commentID);
			pstmt.setInt(2, ProductID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    // TODO DELETE COMMENT BY PRODUCT ID
	public void deleteCommentByProductID(int ProductID) {
		try {
			pstmt = conn.prepareStatement("delete from binhluan where product_id = ?");
			pstmt.setInt(1, ProductID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// TODO GET LIST COMMENT BETWEEN DATE START AND DATE END
	public ArrayList<Comment> getListCommentByDate(String dateStart, String dateEnd) {
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			pstmt = conn.prepareStatement("select * from binhluan where ngaygui between ? and ?");
			pstmt.setString(1, dateStart);
			pstmt.setString(2, dateEnd);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String tennguoigui = rs.getString("tennguoigui");
				java.sql.Date ngaygui = rs.getDate("ngaygui");
				String binhluan = rs.getString("binhluan");
				int product_id = rs.getInt("product_id");
				Comment comment = new Comment(ID, tennguoigui, ngaygui, binhluan, product_id);
				list.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	// TODO DELETE ALL
	public void deleteAll() {
		try {
			pstmt = conn.prepareStatement("delete from binhluan");
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws SQLException {
		CommentDao commentDao = new CommentDao();
//		ArrayList<Comment> list = commentDao.getListCommentByDate("2000-01-01", "2020-01-01");
//		for (Comment comment : list) {
//			System.out.println(comment);
//		}
//		System.out.println(commentDao.countCommentByproductID(2));
//		commentDao.deleteCommentByIDAndProductID(1, 1);
		System.out.println(commentDao.countCommentByproductID(1));
	}
}
