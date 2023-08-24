package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.ProductDtls;
import com.entity.Product_Order;

public class ProductDAOImpl implements ProductDAO {

	private Connection conn;

	public ProductDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addProducts(ProductDtls b) {
		boolean f = false;
		try {
			String sql = "insert into product_dtls(productname,brand,price,productCategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, b.getProductName());
			ps.setString(2, b.getBrand());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getProductCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public List<ProductDtls> getAllProducts() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {
			String sql = "select * from product_dtls ";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public ProductDtls getProductById(int id) {
		ProductDtls b = null;

		try {

			String sql = "select * from product_dtls where productId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				b = new ProductDtls();

				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	public boolean updateEditProducts(ProductDtls b) {
		boolean f = false;
		try {
			String sql = "update product_dtls set productname=?,brand=?,price=?,status=? where productId=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, b.getProductName());
			ps.setString(2, b.getBrand());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getProductId());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteProducts(int id) {
		boolean f = false;
		try {
			String sql = "delete from product_dtls where productId=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, id);
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<ProductDtls> getNewProducts() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=? and status=? order by productId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<ProductDtls> getRecentProducts() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where status=? order by productId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<ProductDtls> getOldProducts() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=? and status=? order by productId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<ProductDtls> getAllNewProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=? and status=? order by productId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<ProductDtls> getAllRecentProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where status=? order by productId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<ProductDtls> getAllOldProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productCategory=? and status=? order by productId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<ProductDtls> getProductByOld(String email, String cate) {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		try {

			String sql = "select * from product_dtls where productCategory=? and email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean oldProductDelete(String email, String cat, int id) {
		boolean f = false;
		try {
			String sql = "delete from product_dtls where productCategory=? and email=? and productId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, email);
			ps.setInt(3, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<ProductDtls> getProductBySearch(String ch) {

		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;

		try {
			String sql = "select * from product_dtls where productName like ? or brand like ? or productCategory like ? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + ch + "%");
			ps.setString(2, "%" + ch + "%");
			ps.setString(3, "%" + ch + "%");
			ps.setString(4, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new ProductDtls();
				b.setProductId(rs.getInt(1));
				b.setProductName(rs.getString(2));
				b.setBrand(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setProductCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	

}
