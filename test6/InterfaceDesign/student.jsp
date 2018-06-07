<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@taglib prefix="s" uri="/struts-tags"%>
 <%@page import="com.hwan.bean.Login"%> 
 <%
Login l=(Login)session.getAttribute("login");
if(l.getTable()==null){
	request.getRequestDispatcher("login.jsp").forward(request,response);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>成绩管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form action="findBook" method="POST" class="layui-form layui-col-md12 x-so">
          <input type="text" name="book.bookName"  placeholder="学科" autocomplete="off" class="layui-input">
          <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
      </div>
      <xblock>
        <span class="x-right" style="line-height:40px">共有数据：88 条</span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>学科</th>
            <th>教师</th>
            <th>时间</th>
            <th>学期</th>
            <th>学科</th>
            <th>测试</th>
            <th>得分</th>
            <th>查询</th>
            </tr>
        </thead>
        <tbody>
        <s:iterator value="#request.list" id="list">
          <tr>
            <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td><s:property value="#list.id" /></td>  
    		<td><s:property value="#list.course" /></td>
    		<td><s:property value="#list.teacher" /> </td>  
    		<td><s:property value="#list.time" /></td>
    		<td><input type="radio" name="vehicle" value="Bike" />1
            	<input type="radio" name="vehicle" value="C++" />2
            	<input type="radio" name="vehicle" value="C#" />3
            	<input type="radio" name="vehicle" value="Java" />4
            </td>
            <td><input type="radio" name="vehicle1" value="Bike" />C
            	<input type="radio" name="vehicle1" value="C++" />C++
            	<input type="radio" name="vehicle1" value="C#" />C#
            	<input type="radio" name="vehicle1" value="Java" />Java
            </td>
            <td><input type="radio" name="vehicle2" value="测试1" />测试1
            	<input type="radio" name="vehicle2" value="测试2" />测试2
            	<input type="radio" name="vehicle2" value="测试3" />测试3
            	<input type="radio" name="vehicle2" value="测试4" />测试4
            </td>
			<td><s:property value="#list.score" /></td>
			<td><a href="#">查询</a></td>
          </tr>
          </s:iterator>
        </tbody>
      </table>
      <div class="page">
        <div>
          <a class="prev" href="">&lt;&lt;</a>
          <a class="num" href="">1</a>
          <span class="current">2</span>
          <a class="num" href="">3</a>
          <a class="num" href="">489</a>
          <a class="next" href="">&gt;&gt;</a>
        </div>
      </div>

    </div>
  </body>

</html>