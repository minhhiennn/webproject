package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class TestDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public TestDao() throws SQLException {
		super();
		conn = Connect.getConnection();
	}

	// TODO TEST INSERT DAY MONTH YEAR
	public void testInsertDayMonthYear() {
		try {
			pstmt = conn.prepareStatement("insert into test (ID,ngaygui) values (?,?)");
			pstmt.setInt(1, 3);
			java.sql.Date date = getCurrentDatetime();
			pstmt.setDate(2, date);
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
    
	// TODO GET NGAY GUI
	public String getNgayGui() {
		String s = null;
		try {
			pstmt = conn.prepareStatement("select CONVERT (date,ngaygui) as date from test where ID = 1");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String ngaygui = rs.getString(1);
				s = ngaygui;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return s;
	}
	public static void main(String[] args) throws SQLException {
        TestDao testDao = new TestDao();
        testDao.testInsertDayMonthYear();
//        String string = testDao.getNgayGui();
//        for (int i = 0; i < string.length(); i++) {
//			System.out.print(string.charAt(i));
//		}
	}
}
