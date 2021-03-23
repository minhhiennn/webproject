package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Img;
import beans.Product;

public class ProductDao {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public ProductDao() throws SQLException {
		super();
		conn = Connect.getConnection();
//		conn = DBCPDataSource.getConnection();
	}
    // UPDATE SO LUONG TON KHO
	public void updateSoLuongTonKho(int productID,int soLuongTonKhoCapNhat) {
		try {
			pstmt = conn.prepareStatement("update product set soluongtonkho = ? where ID = ?");
			pstmt.setInt(1, soLuongTonKhoCapNhat);
			pstmt.setInt(2, productID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	// GET TON KHO BY PRODUCT ID
	public int getTonKhoByProductID(int productID) {
		int count = 0;
		try {
			pstmt = conn.prepareStatement("select soluongtonkho from product where ID = ?");
			pstmt.setInt(1, productID);
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

	// GET LIST PRODUCT
	public ArrayList<Product> getListProduct() {
		ArrayList<Product> listProduct = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM product");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int iD = rs.getInt("id");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(iD, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				listProduct.add(product);
			}
		} catch (SQLException e) {
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
		return listProduct;
	}

	// DELETE PRODUCT BY PRODUCT ID
	public void deleteProductByProductID(int productID) {
		try {
			pstmt = conn.prepareStatement("delete from product where ID = ?");
			pstmt.setInt(1, productID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
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

	// DELETE IMG BY PRODUCT ID
	public void deleteImgByProductID(int productID) {
		try {
			pstmt = conn.prepareStatement("delete from img where productID = ?");
			pstmt.setInt(1, productID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
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

	// DELETE ALL PRODUCT (DANGEROUS)
	public void deleteAllProduct() {
		try {
			pstmt = conn.prepareStatement("delete from product");
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// DELETE ALL IMG (DANGEROUS)
	public void deleteAllImg() {
		try {
			pstmt = conn.prepareStatement("delete from img");
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// UPDATE PRODUCT BY PRODUCT ID
	public void updateProductByProductID(int productID, String productName, int productPrice, int tonkho,
			String description) {
		try {
			pstmt = conn.prepareStatement(
					"update product set name = ?,soluongtonkho = ?,price=?,description=? where ID = ?");
			pstmt.setString(1, productName);
			pstmt.setInt(2, tonkho);
			pstmt.setInt(3, productPrice);
			pstmt.setString(4, description);
			pstmt.setInt(5, productID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// GET COUNT PRODUCT
	public int getCountProduct() {
		int count = 0;
		try {
			pstmt = conn.prepareStatement("select TOP(1) ID from product order by ID desc");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	// ADD NEW PRODUCT
	public void addNewProduct(String productName, int productPrice, String productType, String thuocnhom,
			String description, int tonkho) {
		int viTri = this.getCountProduct() + 1;
		try {
			pstmt = conn.prepareStatement(
					"insert into product (ID,name,price,typeproduct,thuocnhom,description,soluongtonkho) values (?,?,?,?,?,?,?)");
			pstmt.setInt(1, viTri);
			pstmt.setString(2, productName);
			pstmt.setInt(3, productPrice);
			pstmt.setString(4, productType);
			pstmt.setString(5, thuocnhom);
			pstmt.setString(6, description);
			pstmt.setInt(7, tonkho);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// INSERT IMG
	public void insertImg(int ID, String fileImg) {
		int productID = this.getCountProduct();
		try {
			pstmt = conn.prepareStatement("insert into img (ID,productID,fileImg) values(?,?,?)");
			pstmt.setInt(1, ID);
			pstmt.setInt(2, productID);
			pstmt.setString(3, fileImg);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// GET LIST PRODUCT BY TYPE
	public ArrayList<Product> getListProductByType(String type) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM product WHERE typeproduct = ?");
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// GET LIST IMG BY PRODUCT ID
	public ArrayList<Img> getImgByProductID(int IDproduct) {
		ArrayList<Img> list = new ArrayList<Img>();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM img WHERE productID = ?");
			pstmt.setInt(1, IDproduct);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				int productID = rs.getInt("productID");
				String fileImg = rs.getString("fileImg");
				Img img = new Img(ID, productID, fileImg);
				list.add(img);
			}

		} catch (SQLException e) {
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

	// GET LIST PRODUCT CONTAIN STRING NAME
	public ArrayList<Product> getProductListContainStringName(String name) {
		ArrayList<Product> getListProductContainStringName = new ArrayList<Product>();
		ArrayList<Product> listAllProduct = this.getListProduct();
		for (int i = 0; i < listAllProduct.size(); i++) {
			if (listAllProduct.get(i).getName().contains(name)) {
				getListProductContainStringName.add(listAllProduct.get(i));
			}
		}
		return getListProductContainStringName;
	}

	// TODO: GET COUNT PRODUCT CONTAIN STRING NAME
	public int getCountProductContainStringName(String name) {
		int count = 0;
		ArrayList<Product> list = this.getProductListContainStringName(name);
		for (Product product : list) {
			count++;
		}
		return count;
	}

	// TODO: GET ARRAY LIST FOR PAGE SEARCH
	public ArrayList<Product> getArrayListForPageSearch(String txtSearch, int index, int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by ID) as row,* from product where name like ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setString(1, "%" + txtSearch + "%");
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(2, startPage);
			pstmt.setInt(3, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO: GET COUNT PRODUCT CONTAIN STRING NAME AND NHOM
	public int getCountProductContainStringNameAndNhom(String name, String nhom) {
		int count = 0;
		try {
			pstmt = conn.prepareStatement("select COUNT(*) from product where name like ? and thuocnhom = ?");
			pstmt.setString(1, "%" + name + "%");
			pstmt.setString(2, nhom);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
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
		return count;
	}

	// TODO GET ARRAY LIST PRODUCT BY TYPE PRODUCT AND NHOM
	public ArrayList<Product> getArrayListProductByTypeProductAndNhom(String productType, String nhom, int index,
			int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by ID) as row,* from product where typeproduct = ? and thuocnhom = ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setString(1, productType);
			pstmt.setString(2, nhom);
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(3, startPage);
			pstmt.setInt(4, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO GET ARRAY LIST PRODUCT BY TYPE PRODUCT AND NHOM BY NAME
	public ArrayList<Product> getArrayListProductByTypeProductAndNhomByName(String productType, String nhom, int index,
			int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by name) as row,* from product where typeproduct = ? and thuocnhom = ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setString(1, productType);
			pstmt.setString(2, nhom);
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(3, startPage);
			pstmt.setInt(4, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO GET ARRAY LIST PRODUCT BY TYPE PRODUCT AND NHOM BY NAME DESC
	public ArrayList<Product> getArrayListProductByTypeProductAndNhomByNameDESC(String productType, String nhom,
			int index, int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by name DESC) as row,* from product where typeproduct = ? and thuocnhom = ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setString(1, productType);
			pstmt.setString(2, nhom);
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(3, startPage);
			pstmt.setInt(4, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO GET ARRAY LIST PRODUCT BY TYPE PRODUCT AND NHOM BY PRICE
	public ArrayList<Product> getArrayListProductByTypeProductAndNhomByPrice(String productType, String nhom, int index,
			int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by price) as row,* from product where typeproduct = ? and thuocnhom = ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setString(1, productType);
			pstmt.setString(2, nhom);
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(3, startPage);
			pstmt.setInt(4, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO GET ARRAY LIST PRODUCT BY TYPE PRODUCT AND NHOM BY PRICE DESC
	public ArrayList<Product> getArrayListProductByTypeProductAndNhomByPriceDESC(String productType, String nhom,
			int index, int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by price desc) as row,* from product where typeproduct = ? and thuocnhom = ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setString(1, productType);
			pstmt.setString(2, nhom);
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(3, startPage);
			pstmt.setInt(4, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO GET ARRAY LIST PRODUCT BY TYPE PRODUCT FOR PAGE SEARCH
	public ArrayList<Product> getArrayListByTypeProductForPageSearch(String txtSearch, String nhom, int index,
			int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by ID) as row,* from product where name like ? and thuocnhom = ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setString(1, "%" + txtSearch + "%");
			pstmt.setString(2, nhom);
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(3, startPage);
			pstmt.setInt(4, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO GET PRODUCT BY ID
	public Product getProductByID(int productID) {
		Product product = null;
		try {
			pstmt = conn.prepareStatement("select * from product where id = ? ");
			pstmt.setInt(1, productID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
			}
		} catch (SQLException e) {
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
		return product;
	}

	// TODO GET PRODUCT BY TYPEPRODUCT AND THUOCNHOM
	public ArrayList<Product> getProductByTypeProductAndThuocNhom(String productType, String nhom) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement("select * from product where typeproduct = ? and thuocnhom = ?");
			pstmt.setString(1, productType);
			pstmt.setString(2, nhom);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO COUNT PRODUCT HAVE PRICE BETWEEN ? END ? AND NHOM ?
	public int getCountProductHavePriceBetween(int minValue, int maxValue, String nhom, String productType) {
		int count = 0;
		try {
			pstmt = conn.prepareStatement(
					"select COUNT(*) from product where price between ? and ? and thuocnhom = ? and typeproduct = ?");
			pstmt.setInt(1, minValue);
			pstmt.setInt(2, maxValue);
			pstmt.setString(3, nhom);
			pstmt.setString(4, productType);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
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
		return count;
	}

	// TODO GET ARRAY LIST PRODUCT BY TYPE FOR FILTER
	public ArrayList<Product> getArrayListProductByTypeForFilter(int minValue, int maxValue, String nhom, int index,
			String productType, int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by ID) as row,* from product where price between ? and ? and thuocnhom = ? and typeproduct= ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setInt(1, minValue);
			pstmt.setInt(2, maxValue);
			pstmt.setString(3, nhom);
			pstmt.setString(4, productType);
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(5, startPage);
			pstmt.setInt(6, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO COUNT PRODUCT HAVE PRICE BETWEEN ? END ?
	public int getCountProductHavePriceBetween(int minValue, int maxValue) {
		int count = 0;
		try {
			pstmt = conn.prepareStatement("select COUNT(*) from product where price between ? and ?");
			pstmt.setInt(1, minValue);
			pstmt.setInt(2, maxValue);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
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
		return count;
	}

	// TODO COUNT PRODUCT BY PRODUCT TYPE AND NHOM
	public int getCountProductByProductTypeAndNhom(String productType, String nhom) {
		int count = 0;
		try {
			pstmt = conn.prepareStatement("select COUNT(*) from product where typeproduct = ? and thuocnhom = ?");
			pstmt.setString(1, productType);
			pstmt.setString(2, nhom);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
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
		return count;
	}

	// TODO GET ARRAY LIST PRODUCT FOR FILTER
	public ArrayList<Product> getArrayListProductByTypeForFilter(int minValue, int maxValue, int index, int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by ID) as row,* from product where price between ? and ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setInt(1, minValue);
			pstmt.setInt(2, maxValue);
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(3, startPage);
			pstmt.setInt(4, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO GET ARRAY LIST PRODUCT FOR FILTER AND SORT BY NAME
	public ArrayList<Product> getArrayListProductByTypeForFilterByName(int minValue, int maxValue, String nhom,
			int index, String productType, int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by name) as row,* from product where price between ? and ? and thuocnhom = ? and typeproduct= ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setInt(1, minValue);
			pstmt.setInt(2, maxValue);
			pstmt.setString(3, nhom);
			pstmt.setString(4, productType);
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(5, startPage);
			pstmt.setInt(6, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO GET ARRAY LIST PRODUCT FOR FILTER AND SORT BY NAME DESC
	public ArrayList<Product> getArrayListProductByTypeForFilterByNameDESC(int minValue, int maxValue, String nhom,
			int index, String productType, int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by name desc) as row,* from product where price between ? and ? and thuocnhom = ? and typeproduct= ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setInt(1, minValue);
			pstmt.setInt(2, maxValue);
			pstmt.setString(3, nhom);
			pstmt.setString(4, productType);
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(5, startPage);
			pstmt.setInt(6, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO GET ARRAY LIST PRODUCT FOR FILTER AND SORT BY PRICE
	public ArrayList<Product> getArrayListProductByTypeForFilterByPrice(int minValue, int maxValue, String nhom,
			int index, String productType, int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by price) as row,* from product where price between ? and ? and thuocnhom = ? and typeproduct= ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setInt(1, minValue);
			pstmt.setInt(2, maxValue);
			pstmt.setString(3, nhom);
			pstmt.setString(4, productType);
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(5, startPage);
			pstmt.setInt(6, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO GET ARRAY LIST PRODUCT FOR FILTER AND SORT BY PRICE DESC
	public ArrayList<Product> getArrayListProductByTypeForFilterByPriceDESC(int minValue, int maxValue, String nhom,
			int index, String productType, int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by price desc) as row,* from product where price between ? and ? and thuocnhom = ? and typeproduct= ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setInt(1, minValue);
			pstmt.setInt(2, maxValue);
			pstmt.setString(3, nhom);
			pstmt.setString(4, productType);
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(5, startPage);
			pstmt.setInt(6, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO GET ARRAY LIST PRODUCT BY TYPE PRODUCT FOR PAGE SEARCH AND SORT BY NAME
	public ArrayList<Product> getArrayListByTypeProductForPageSearchAndSortByName(String txtSearch, String nhom,
			int index, int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by name) as row,* from product where name like ? and thuocnhom = ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setString(1, "%" + txtSearch + "%");
			pstmt.setString(2, nhom);
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(3, startPage);
			pstmt.setInt(4, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO GET ARRAY LIST PRODUCT BY TYPE PRODUCT FOR PAGE SEARCH AND SORT BY NAME
	// DESC
	public ArrayList<Product> getArrayListByTypeProductForPageSearchAndSortByNameDESC(String txtSearch, String nhom,
			int index, int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by name desc) as row,* from product where name like ? and thuocnhom = ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setString(1, "%" + txtSearch + "%");
			pstmt.setString(2, nhom);
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(3, startPage);
			pstmt.setInt(4, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO GET ARRAY LIST PRODUCT BY TYPE PRODUCT FOR PAGE SEARCH AND SORT BY PRICE
	public ArrayList<Product> getArrayListByTypeProductForPageSearchAndSortByPrice(String txtSearch, String nhom,
			int index, int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by price) as row,* from product where name like ? and thuocnhom = ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setString(1, "%" + txtSearch + "%");
			pstmt.setString(2, nhom);
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(3, startPage);
			pstmt.setInt(4, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO GET ARRAY LIST PRODUCT BY TYPE PRODUCT FOR PAGE SEARCH AND SORT BY PRICE
	// DESC
	public ArrayList<Product> getArrayListByTypeProductForPageSearchAndSortByPriceDESC(String txtSearch, String nhom,
			int index, int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by price desc) as row,* from product where name like ? and thuocnhom = ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setString(1, "%" + txtSearch + "%");
			pstmt.setString(2, nhom);
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(3, startPage);
			pstmt.setInt(4, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO: GET ARRAY LIST FOR PAGE SEARCH AND SORT BY NAME
	public ArrayList<Product> getArrayListForPageSearchAndSortByName(String txtSearch, int index, int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by name) as row,* from product where name like ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setString(1, "%" + txtSearch + "%");
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(2, startPage);
			pstmt.setInt(3, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO: GET ARRAY LIST FOR PAGE SEARCH AND SORT BY NAME DESC
	public ArrayList<Product> getArrayListForPageSearchAndSortByNameDESC(String txtSearch, int index, int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by name desc) as row,* from product where name like ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setString(1, "%" + txtSearch + "%");
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(2, startPage);
			pstmt.setInt(3, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO: GET ARRAY LIST FOR PAGE SEARCH AND SORT BY PRICE
	public ArrayList<Product> getArrayListForPageSearchAndSortByPrice(String txtSearch, int index, int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by price) as row,* from product where name like ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setString(1, "%" + txtSearch + "%");
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(2, startPage);
			pstmt.setInt(3, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	// TODO: GET ARRAY LIST FOR PAGE SEARCH AND SORT BY Price DESC
	public ArrayList<Product> getArrayListForPageSearchAndSortByPriceDESC(String txtSearch, int index, int size) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(
					"with x as(select ROW_NUMBER() over (order by price DESC) as row,* from product where name like ?)\r\n"
							+ "select * from x where row between ? and ?");
			pstmt.setString(1, "%" + txtSearch + "%");
			int startPage = index * size - (size - 1);
			int endPage = index * size;
			pstmt.setInt(2, startPage);
			pstmt.setInt(3, endPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int ID = rs.getInt("ID");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String typeproduct = rs.getString("typeproduct");
				String thuocnhom = rs.getString("thuocnhom");
				String description = rs.getString("description");
				int soluongtonkho = rs.getInt("soluongtonkho");
				Product product = new Product(ID, name, price, typeproduct, thuocnhom, description, soluongtonkho);
				list.add(product);
			}
		} catch (SQLException e) {
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

	public static void main(String[] args) throws SQLException {
		ProductDao productDao = new ProductDao();
//		ArrayList<Product> list = productDao.getArrayListProductByTypeProductAndNhom("aosominam", "men", 1, 9);
//		for (Product product : list) {
//			System.out.println(product);
//		}
//		System.out.println(productDao.getCountProductByProductTypeAndNhom("aokhoacnam", "men"));
//		productDao.addNewProduct("ahihi", 500, "ahuhu", "ahihi", "ahaha dok ngok", 700);
		productDao.updateSoLuongTonKho(1, 100);
//		productDao.updateSoLuongTonKho(433, 4500);
	}
}
