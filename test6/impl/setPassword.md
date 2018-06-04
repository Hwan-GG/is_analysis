#### 用例： 修改密码
- 权限：学生/老师：修改自己的密码，必须先登录。
- 功能： 修改（设置）用户的密码。    
- API请求地址： 接口基本地址/api/setPassword/<type>
- 请求方式 ： post
- 请求实例：

```
  {         
      "TYPE":"stu",
      "no":"201510414205"
      "password":"123456QWEWR"
  }

```
- 请求参数说明：

参数名称	| 说明
---|---
TYPE |类别
stu_no |学号
password |密码


- 返回实例：
```
{         
      "status": true,
      "info": "success"
  }
```


参数名称 | 说明
---|---
status | bool类型，true表示正确的返回，false表示有错误
info | 返回结果说明信息
