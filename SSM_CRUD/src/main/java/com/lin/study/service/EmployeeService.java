package com.lin.study.service;

import com.lin.study.bean.Employee;
import com.lin.study.bean.EmployeeExample;
import com.lin.study.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author KyrieStudy
 * @version 1.0
 * @date 2021/12/2 15:14
 */
@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper mapper;

    /*查询所有员工数据*/
    public List<Employee> getAll() {
        List<Employee> employeeList = mapper.selectByExampleWithDept(null);
        return employeeList;
    }

    public int add(Employee emp) {
       return  mapper.insertSelective(emp);
    }

    public boolean countEmployee(Employee employee) {
        EmployeeExample employeeExample=new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpNameEqualTo(employee.getEmpName());
        long count = mapper.countByExample(employeeExample);
        return count==0;
    }
}
