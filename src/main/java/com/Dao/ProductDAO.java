package com.Dao;

import java.util.List;

import com.entity.ProductDtls;

public interface ProductDAO {
	
	public boolean addProducts(ProductDtls b);
	
	public List<ProductDtls> getAllProducts();
	
	public ProductDtls getProductById(int id);
	
	public boolean updateEditProducts(ProductDtls b);
	
	public boolean deleteProducts(int id);
	
	public List<ProductDtls> getNewProducts();
	
	public List<ProductDtls> getRecentProducts();
	
	public List<ProductDtls> getOldProducts();
	
	public List<ProductDtls> getAllNewProduct();
	
	public List<ProductDtls> getAllRecentProduct();
	
	public List<ProductDtls> getAllOldProduct();
	
	public List<ProductDtls> getProductByOld(String email, String cate);
	
	public boolean oldProductDelete(String email, String cat, int id);
	
	public List<ProductDtls> getProductBySearch(String ch);

}
