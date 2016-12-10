<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.qq.com.*,com.alibaba.fastjson.*"%>
<%
    String excelPath = "G:\\tatao-upload\\course\\course-template.xls";
    List<HashMap<String, Object>> lists = ImportUtils.readExcel(excelPath);
    out.print(JSON.toJSONString(lists));
%>