package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import beans.LienHe;

public class ContactUsDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public ContactUsDao() throws SQLException {
		super();
		conn = Connect.getConnection();
	}

	// TODO INSERT CONTACTS INTO DATABASE
	public boolean insertContactsIntoDatebase(String chude, String email, String noidung) {
		int vitri = this.countContactsInDatabase() + 1;
		try {
			pstmt = conn.prepareStatement(
					"insert into lienhe (ID,email,ngaygui,chude,noidung,trangthai) values (?,?,?,?,?,?)");
			pstmt.setInt(1, vitri);
			pstmt.setString(2, email);
			java.sql.Date date = getCurrentDatetime();
			pstmt.setDate(3, date);
			pstmt.setString(4, chude);
			pstmt.setString(5, noidung);
			pstmt.setString(6, "chưa kiểm tra");
			if (pstmt.executeUpdate() == 0) {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}

	// TODO COUNT CONTACTS IN DATABASE
	public int countContactsInDatabase() {
		int count = 0;
		try {
			pstmt = conn.prepareStatement("select TOP(1) ID from lienhe order by ID DESC");
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

	// TODO GET CURRENT DATE TIME
	public Date getCurrentDatetime() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());
	}

//////////////////////////////////////////////
	// lay tất cả dữu lieu table lien he
	public ArrayList<LienHe> getContact() {
		ArrayList<LienHe> list = new ArrayList<LienHe>();
		try {
			pstmt = conn.prepareStatement("select * from lienhe order by ngaygui desc");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("ID");
				;

				String email = rs.getString("email");
				Date ngayGui = rs.getDate("ngaygui");
				String chuDe = rs.getString("chude");
				String noiDung = rs.getString("noidung");

				String trangThai = rs.getString("trangthai");
				LienHe lb = new LienHe(id, email, ngayGui, chuDe, noiDung, trangThai);
				list.add(lb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;

	}

	public ArrayList<LienHe> getContacID(int ID) {
		ArrayList<LienHe> list = new ArrayList<LienHe>();
		try {
			pstmt = conn.prepareStatement("select * from lienhe where ID=?");
			pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("ID");

				String email = rs.getString("email");
				Date ngayGui = rs.getDate("ngaygui");
				String chuDe = rs.getString("chude");
				String noiDung = rs.getString("noidung");

				String trangThai = rs.getString("trangthai");
				LienHe lb = new LienHe(id, email, ngayGui, chuDe, noiDung, trangThai);
				list.add(lb);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;

	}

// thống kê theo ngay thang nam he thốn
	public ArrayList<LienHe> ThongKeTheoNgayHeThong() {
		ArrayList<LienHe> list = new ArrayList<LienHe>();
		Date toDate = new Date(System.currentTimeMillis());
		SimpleDateFormat fomattime = new SimpleDateFormat("yyyy--MM--dd");
		String date = fomattime.format(toDate.getTime());
		return list;

	}

//update lai trang thai
	public void updateContacID(String trangthai, int ID) {
		try {
			pstmt = conn.prepareStatement("update lienhe set trangthai=? where ID=?");

			pstmt.setString(1, trangthai);
			pstmt.setInt(2, ID);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

//xoa liem he theo id
	public void deleteContacID(int ID, String trangthai) {
		try {
			pstmt = conn.prepareStatement("delete from lienhe where id=? and trangthai=?");

			pstmt.setInt(1, ID);
			pstmt.setString(2, trangthai);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

//xoa het lien he
	public void deleteContec() {
		try {
			pstmt = conn.prepareStatement("delete from lienhe");
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					if (rs != null) {
						rs.close();
					}
				}
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}

	public void delete(String trangthai, int id) {
		try {
			ArrayList<LienHe> list = new ContactUsDao().getContact();
			for (LienHe lienhe : list) {
				if (lienhe.getTrangThai().equalsIgnoreCase(trangthai) && lienhe.getId() == id)
					list.remove(id);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ArrayList<LienHe> getContacbyAdminbydate(String dateStart, String dateEnd) {
		ArrayList<LienHe> list = new ArrayList<LienHe>();
		try {
			pstmt = conn.prepareStatement("select * from lienhe where ngaygui between ? and ?");
			pstmt.setString(1, dateStart);
			pstmt.setString(2, dateEnd);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("ID");

				String email = rs.getString("email");
				Date ngayGui = rs.getDate("ngaygui");
				String chuDe = rs.getString("chude");
				String noiDung = rs.getString("noidung");

				String trangThai = rs.getString("trangthai");
				LienHe lb = new LienHe(id, email, ngayGui, chuDe, noiDung, trangThai);
				list.add(lb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return list;

	}

	public static void main(String[] args) throws SQLException {
		 ContactUsDao contactUsDao = new ContactUsDao();
//		System.out.println(contactUsDao.countContactsInDatabase() + 1);
//		System.out.println(contactUsDao.insertContactsIntoDatebase("test", "minhhien", "hahaha"));
//		String date = "2015-04-7";
//		java.sql.Date dat = new java.sql.Date(new java.util.Date().getTime());
//		SimpleDateFormat simDate = new SimpleDateFormat("dd/MM/yyyy");
//		System.out.println(new SimpleDateFormat("dd/MM/yyyy").format(dat));
//		System.out.println(simDate.format(dat));
		System.out.println(contactUsDao.countContactsInDatabase());
	}
}
