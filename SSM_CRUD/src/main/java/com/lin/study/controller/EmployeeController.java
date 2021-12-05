package com.lin.study.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lin.study.bean.Employee;
import com.lin.study.common.ResponseCommon;
import com.lin.study.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author KyrieStudy
 * @version 1.0
 * @date 2021/12/2 15:11
 */
@RestController
public class EmployeeController {

    @Autowired
    EmployeeService empService;

//    @RequestMapping("/emps")
//    public String getEmps(@RequestParam(value="pageNo",defaultValue = "1",required = false) Integer pageNo, Model model){
////        引入分页插件,分页查询，每页五条
//        PageHelper.startPage(pageNo,10);
//        List<Employee> pageList =empService.getAll();
//        /*使用pageInfo来包装查询出来的结果,5表示连续要显示的页数*/
//        PageInfo<Employee> pageInfo=new PageInfo<>(pageList,5);
//        model.addAttribute("pageInfo",pageInfo);
//        return "list";
//    }

//    使用通用的返回体表示返回信息

    /**
     * 获取分页后的员工信息
     * @param pageNo
     * @return
     */
    @RequestMapping("/emps")
    public ResponseCommon getEmployees(@RequestParam(value="pageNo",defaultValue = "1",required = false) Integer pageNo){
        PageHelper.startPage(pageNo,5);
        List<Employee> employees = empService.getAll();
        PageInfo<Employee> pageInfo=new PageInfo<>(employees,5);
        return ResponseCommon.success().add("pageInfo",pageInfo);
    }

    /**
     * 添加员工信息
     */
    @RequestMapping(value="/addEmps",method = RequestMethod.POST)
    public ResponseCommon insertEmployees(Employee emp){
        int count=empService.add(emp);
        System.out.println(emp);
        return ResponseCommon.success().add("count",count);
    }

    @RequestMapping(value="/findEmployeeName", method = RequestMethod.GET)
    public ResponseCommon findEmployeeByName(Employee employee){
        boolean flag=empService.countEmployee(employee);//true表示用户名不存在
        if(flag){
            return ResponseCommon.success();
        }
        return ResponseCommon.fail();
    }
}
