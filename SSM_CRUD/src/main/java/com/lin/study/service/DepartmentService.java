package com.lin.study.service;

import com.lin.study.bean.Department;
import com.lin.study.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author KyrieStudy
 * @version 1.0
 * @date 2021/12/3 16:00
 */
@Service
public class DepartmentService {
    @Autowired
    DepartmentMapper mapper;

    /**
     * 获取所有的部门信息
     * @return
     */
    public List<Department> getAll() {
        return mapper.selectByExample(null);
    }
}
