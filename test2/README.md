# 实验2：图书管理系统用例建模
|学号|班级|姓名|照片|
|:-------:|:-------------: | :----------:|:---:|
|201510414205|软件(本)15-2|黄伟|![flow1](../myself.jpg)|

## 1. 图书管理系统的用例关系图

### 1.1 用例图PlantUML源码如下：

``` usecase
@startuml test2
left to right direction
skinparam packageStyle rectangle
图书管理员 as manager
借阅者 as user
游客 as tourists
rectangle 图书馆借阅系统用例图 {
    tourists-->(注册)
    tourists-->(查询图书)
    tourists-->(登出)
    user-->(登出)
    user -->(查看借阅信息)
    user -->(预定图书)
    (预定图书)<..(取消预订):<<include>>
    user-->(借阅图书)
    (借阅图书)<..(续借图书):<<include>>
    user-->(还书)
    (还书)<..(交罚金):<<extend>>
    user-->(修改个人信息)
    user-->(查询图书)
    (登出)<--manager
    (修改个人信息)<--manager
    (增加图书)<--manager
    (修改图书)<--manager
    (查询图书)<--manager
    (拒绝预订)<--manager
    (公告管理)<--manager
    (管理用户)<--manager
    (查看借阅记录)<--manager
    (允许还书)<--manager
    (收取罚金)<..(允许还书):<<extend>>
    (允许借书)<--manager
    (允许续借)<..(允许借书):<<include>>
}
@enduml

```


### 1.2. 用例图如下：

![flow1](./test2-1.png)

**“借阅/续借”用例流程图源码如下：**
```
@startuml test2-2
start;
    if(是否登录？) then(是)
        :查询图书信息;
        :选择目标图书;
        fork
        :点击续借;
        if(是否已续借一次？) then(是)
            :提示仅能续借一次;
            :续借失败;
        else(否)
            :续借成功;
        endif;
        fork again
        :点击借阅;
        if(是否有库存？) then(是)
            if(是否超出借阅上限？) then(是)
                :借书失败;
             else(否)
                :借书成功;
            endif;
        else(否)
            :提示没有库存;
            :借书失败;
        endif;
        endfork;
    else(否)
        :提示需要登录后才能借阅;
        :跳转到登录页面;
    endif;
    :借书（续借）流程结束;
    stop;
@enduml
```

**“借阅/续借”用例流程图如下：**

![uc1_flow](./test2-2.png)

**“登录/注册”用例流程图源码如下：**

```
@startuml
    
    start
    :输入账号;
    :输入密码;
    fork
    :登录;
    :选择读者或管理员身份;
    if(账号是否存在？) then(是)
        if(账号密码是否正确？) then(是)
            :登录成功;
            :进入首页;
         else(否)
            :提示用户账号密码错误;
            :重新登录;
         endif;
    else(否)
        :提示用户账号不存在;
        :重新登录;
    endif;
    fork again
    :注册;
    :再次确认密码;
    :输入验证码;
    if(账号是否存在？) then(是)
        :提示用户账号已存在;
        :注册失败;
    else(否)
        if(两次输入的密码是否相同？) then(是)
            :注册成功;
            :返回登录页面;
        else(否)
            :提示用户两次密码不同;
            :重新注册流程;
        endif;
    endif;
    endfork
    :登录/注册流程结束;
    stop;
    
    @enduml
```
**“登录/注册”用例流程图如下：**

![uc1_flow](./test2-3.png)
