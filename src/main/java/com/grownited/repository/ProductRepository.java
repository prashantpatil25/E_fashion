package com.grownited.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.grownited.entity.ProductEntity;

@Repository
public interface ProductRepository extends JpaRepository<ProductEntity, Integer> {
	/*
	 * @Query(value
	 * ="select p.*,c.category_name,sc.sub_category_name from category c,sub_category sc,product p where p.category_id=c.category_id and p.sub_category_id=sc.sub_category_id"
	 * ,nativeQuery = true) List<Object[]> getAll();
	 */

	
	/*
	 * @Query("SELECT p.productId, p.productName, p.basePrice, p.offerPrice, p.offerPercentage, p.productImageURL1 FROM ProductEntity p"
	 * ) List<Object[]> getAll();
	 */
	/*
	 * @Query("SELECT p.productId, p.productName, p.basePrice, p.offerPrice, p.offerPercentage, p.productImageURL1, p.productDetail, p.productImageURL2, p.productImageURL3, p.quantity, c.categoryName, sc.subCategoryName FROM ProductEntity p JOIN p.category c JOIN p.subCategory sc"
	 * ) List<Object[]> getAll();
	 */
	
	List<ProductEntity> findByCategoryCategoryId(Integer categoryId);

	List<ProductEntity> findBySubCategory_SubCategoryId(Integer subCategoryId); 

	@Query("SELECT p.productId, p.productName,p.offerPercentage, p.basePrice, p.offerPrice, p.productDetail, p.productImageURL1, p.productImageURL2, p.productImageURL3, p.quantity, c.categoryName, sc.subCategoryName FROM ProductEntity p LEFT JOIN p.category c LEFT JOIN p.subCategory sc")
	List<Object[]> getAll();

	 


		/*
		 * @Query("SELECT p.productId, p.productName, p.basePrice, p.offerPrice, p.offerPercentage, p.productImageURL1 FROM ProductEntity p"
		 * ) List<Object[]> getAll();
		 */

	@Query(value = "select p.*,c.category_name,sc.sub_category_name from category c,sub_category sc,product p where p.category_id=c.category_id and p.sub_category_id=sc.sub_category_id and p.product_id = :productId", nativeQuery = true)
	List<Object[]> getByProductId(Integer productId);

	/* List<ProductEntity> findByCategoryId(Integer categoryId); */

}