# 实验5：图书管理系统数据库设计与界面设计
|学号|班级|姓名|照片|
|:-------:|:-------------: | :----------:|:---:|
|201510414205|软件(本)15-2|黄伟|![flow1](../myself.jpg)|

### 1.数据库设计
#### 1.1 book表
|字段|类型|主键，外键|可以为空|默认值|约束|说明|
|:-------:|:-------------:|:------:|:----:|:---:|:----:|:-----|
|bookNum|varchar2(14)|主键|否| | | 图书编号|
|ISBN|varchar2(14)||否| | | 为书本印刷的ISBN号|
|bookName|varchar2(60)| |否|||书名|
|author|varchar2(50)| |是|||作者|
|publisher|varchar2(100)| |是|||出版社|
|price|double| |否|0.0||单价|
|totalNum|int| |否|0| |即该图书库存的总量|
|restNum|int| |否|0| |目前可借的图书量|
#### 1.2 user表
|字段|类型|主键，外键|可以为空|默认值|约束|说明|
|:-------:|:-------------:|:------:|:----:|:---:|:----:|:-----|
|userID|varchar2(14)|主键|否| | | 用户编号|
|username|varchar2(14)||否| | | 用户名|
|password|varchar2(60)| |否|||密码|
|information|varchar2(100)| |是|||个人简介|
#### 1.3 manager表
|字段|类型|主键，外键|可以为空|默认值|约束|说明|
|:-------:|:-------------:|:------:|:----:|:---:|:----:|:-----|
|adminID|varchar2(14)|主键|否| | | 管理员编号|
|username|varchar2(14)||否| | | 用户名|
|password|varchar2(60)| |否|||密码|
#### 1.4 ManageBookInfo表
|字段|类型|主键，外键|可以为空|默认值|约束|说明|
|:-------:|:-------------:|:------:|:----:|:---:|:----:|:-----|
|adminID|varchar2(14)|主键|否| | | 管理员编号|
|bookNum|varchar2(14)||否| | | 图书编号|
|actionTime|varchar2(60)| |否|||操作时间|
|action|varchar2(30)| |否|||操作|
|eventId|varchar2(14)| |否|||事件编号|
#### 1.5 LendRecord表
|字段|类型|主键，外键|可以为空|默认值|约束|说明|
|:-------:|:-------------:|:------:|:----:|:---:|:----:|:-----|
|userID|varchar2(14)|主键|否| | | 用户编号|
|bookNum|varchar2(14)||否| | | 图书编号|
|borrowTime|varchar2(30)| |否|||借阅时间|
|returnTime|varchar2(30)| |否|||归还时间|
|isOverTime|bool| |否|||是否超期|
|fine|float| |是|null||罚金|
#### 1.6 BookRecord表
|字段|类型|主键，外键|可以为空|默认值|约束|说明|
|:-------:|:-------------:|:------:|:----:|:---:|:----:|:-----|
|userID|varchar2(14)|主键|否| | | 用户编号|
|bookNum|varchar2(14)||否| | | 图书编号|
|startTime|varchar2(30)| |否|||预定借阅时间|
|endTime|varchar2(30)| |否|||预定归还时间|
|bookingNum|int| |否|0||预定数量|
|isCancel|bool| |否|||取消操作|
### 2 页面设计
#### 2.1图书管理系统原型
![flow1](./manage.jpg)
#### 2.2系统api
##### 2.2.1 getBook
- getStudents接口
        
        - 功能：
            返回所有学生的列表。   
            
            学生登录，或者未登录不能看到RESULT_SUM，WEB_SUM，老师登录可以看到RESULT_SUM，WEB_SUM。
            
            该接口服务于：http://202.115.82.8:1522
            
        - API请求地址： 
            http://202.115.82.8:1522/v1/api/getStudents
        
        - 请求方式 ：
            GET  
        
        - 请求参数说明:        
            无
            
        - 返回实例：

                {
                    "status": true,
                    "info": null, 
                    "total": 121,         
                    "data": [
                        {"WEB_SUM": "Y,Y,Y,Y,Y,N", 
                        "RESULT_SUM": "83.75,90,80,80,85,N", 
                        "GITHUB_USERNAME": "Chinajuedui", 
                        "STUDENT_ID": "201510315203", 
                        "CLASS": "软件(本)15-1", 
                        "NAME": "陈松华", 
                        "UPDATE_DATE": "2018-04-02 13:48:01"}, 
                        {
                        ...其他学生
                        }
                    ] 
                }
          
        - 返回参数说明：    
         
          |参数名称|说明|
          |:---------:|:--------------------------------------------------------|      
          |status|bool类型，true表示正确的返回，false表示有错误|
          |info|返回结果说明信息|
          |total|返回学生人数|
          |data|所有学生的数组|
          |WEB_SUM|网址是否正确的汇总|
          |RESULT_SUM|成绩的汇总|
          |GITHUB_USERNAME|GITHUB 用户名|
          |STUDENT_ID|学号|
          |CLASS|班级|
          |NAME|真实姓名|
          |UPDATE_DATE|GitHUB用户名修改日期|
