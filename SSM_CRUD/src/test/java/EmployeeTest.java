import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

/**
 * @author  KyrieStudy
 * @date  2021/12/2 15:30
 * @version 1.0
 * 使用Spring测试模块提供的测试请求功能,测试CRUD的正确性
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
/*指定spring配置文件的位置*/
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:SpringMVC.xml"})
public class EmployeeTest {
//    虚拟mvc请求，获取处理结果
    MockMvc mockMvc;

    @Autowired
    WebApplicationContext context;

    @Before
    public void initMockMVC(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        MvcResult pageNo = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pageNo", "1")).andReturn();
        //请求成功后请求域中有pageInfo，可以取出pageInfo
        MockHttpServletRequest request=pageNo.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println(pageInfo);
    }
}
