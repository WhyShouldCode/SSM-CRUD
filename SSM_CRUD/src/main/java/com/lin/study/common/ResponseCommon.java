package com.lin.study.common;

import java.util.HashMap;
import java.util.Map;

/**
 * @author KyrieStudy
 * @version 1.0
 * @date 2021/12/3 9:25
 */

/**
 * 创建一个通用的返回类，用于保存请求的状态码，信息，以及用户的数据等
 */
public class ResponseCommon {
    // 100表示成功，200表示失败
    private Integer code;
    //携带请求结果的信息
    private String msg;
    private Map<String,Object> extend=new HashMap<>();

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
    //构建成功的返回结果
    public static ResponseCommon success(){
        ResponseCommon success=new ResponseCommon();
        success.setCode(100);
        success.setMsg("请求成功");
        return success;
    }
    //构建失败体
    public static ResponseCommon fail(){
        ResponseCommon fail=new ResponseCommon();
        fail.setMsg("请求失败");
        fail.setCode(200);
        return fail;
    }
    public String getMsg() {
        return msg;
    }
    public ResponseCommon add(String key,Object value){
        this.getExtend().put(key,value);
        return this;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
