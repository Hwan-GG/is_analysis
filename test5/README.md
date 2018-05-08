# 实验4：图书管理系统顺序图绘制
|学号|班级|姓名|照片|
|:-------:|:-------------: | :----------:|:---:|
|201510414205|软件(本)15-2|黄伟|![flow1](../myself.jpg)|

### 1.1 查询图书用例
#### 源码如下：

``` 
@startUml test4-1
title 图书查询
hide footbox
skinparam backgroundColor #ded
actor user
boundary 图书查询窗口
activate user
activate 图书查询窗口
user -> 图书查询窗口: 输入检索条件
图书查询窗口 -> 图书查询窗口: 验证输入信息
user -> 图书查询窗口: 点击查看详情
database book
图书查询窗口 -> book: 查询图书
activate book
book --> 图书查询窗口: 返回图书
@endUml
```
#### 用例顺序图

![flow1](./test4-1.png)
