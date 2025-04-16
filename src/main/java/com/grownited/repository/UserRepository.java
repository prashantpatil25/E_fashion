package com.grownited.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.grownited.entity.UserEntity;
import java.util.List;


@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer>{

	List<UserEntity> findByRole(String role);
	Optional<UserEntity> findByEmail(String email);
	
	@Query("SELECT FUNCTION('DATE', u.createdAt), COUNT(u) FROM UserEntity u GROUP BY FUNCTION('DATE', u.createdAt)")
	List<Object[]> countUsersByDate();



 	
	
}