package com.lin.study.controller;

import com.lin.study.bean.Department;
import com.lin.study.common.ResponseCommon;
import com.lin.study.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;
/**
 * @author KyrieStudy
 * @version 1.0
 * @date 2021/12/3 15:59
 */
@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService service;

    @RequestMapping(value="/emps",method = RequestMethod.POST)
    @ResponseBody
    public ResponseCommon getDepartmentInfo(){
        List<Department> list=service.getAll();
        return ResponseCommon.success().add("department",list);
    }
}
