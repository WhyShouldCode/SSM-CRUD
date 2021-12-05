import com.lin.study.bean.Department;
import com.lin.study.bean.Employee;
import com.lin.study.dao.DepartmentMapper;
import com.lin.study.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * @author KyrieStudy
 * @version 1.0
 * @date 2021/12/2 12:15
 */
@RunWith(SpringJUnit4ClassRunner.class)
/*指定spring配置文件的位置*/
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class SpringTest {
    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    SqlSession session;
    @Test
    public void test1(){
        departmentMapper.insert(new Department(1,"市场部"));
        departmentMapper.insert(new Department(2,"研发部"));
    }
    @Test
    public void test2(){
//        employeeMapper.insert(new Employee("战狼","男","zhanliang@qq.com",1,null));
//        批量插入员工测试
        EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 100; i++) {
            String empNo = UUID.randomUUID().toString().substring(0, 5)+i;
            String gender=i%2==0?"男":"女";
            mapper.insert(new Employee(empNo,gender,empNo+"@qq.com",1,null));
        }

    }
}
