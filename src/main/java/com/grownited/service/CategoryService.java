package com.grownited.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grownited.entity.CategoryEntity;
import com.grownited.repository.CategoryRepository;

import java.util.List;

@Service
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    public List<CategoryEntity> categoryEntities() {
        return categoryRepository.findAll();
    }
}
