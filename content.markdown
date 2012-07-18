

# 序言：论述webapp和native app之争 #

# web开发，js,html5,css3

## 关于div+css概述 
此处需要讲浏览器兼容性
## 基本元素 
## 多页跳转 
## 表单 
## js和html交互（dom操作） 
## 关于事件模型 
## post和get 
## ajax使用 
## json和jsonp,xml举例 
## 如何使用css修改显示样式 
## 理解css盒子模型 
## 理解css sprite 
## 开发与调试工具 
## js测试与压缩 
## js oo 
## 关于雅虎36条军规 


# web进行本地化，phonegap插件实例 
把上一章的例子放到此处打包，让读者直接可以看到效果
## 纯web版,用safari直接打开
## 用phonegap打包


# 整站包装 
## jQuery mobile 
## sencha touch2 


# phonegap原理解析 
## pg历史说明 
## oc调用js实例 
## 如何在应用内部打开其他应用 
## js如何访问oc类 
## pg架构流程 
## 现有插件说明 

## requerJS说明 
### AMD规范 
### SeaJS 

## 开发详解，主要讲插件原理 
## 高级开发：js类机制 

## jQuery插件机制 
### CityUI 
### Ext-core 


# ios native app 说明 
## xcode用法说明 
## 原生应用概括 
## 原生有略分析 
## icon及尺寸常识 
## 来个hello world 
### xib开发方式 
### 纯手写代码

## 常用控件 
### UITableViewController 
### UINavagationViewController 

## MVC说明  
###包分类 
###物理分类 

## 原生扩展（向友盟学习），插件化
## 延时处理（接口回调与通知）
## 条件编译 
## 内部类（block）

## 与其他语言集成
### c/c++ 
### perl 
### lua
### NodeJS


# oc基础 和各种实例 
## gh-unit
## ui test(1:ui automation 2:taobao) 
## 推送通知 
## 分享：思路（sdk,server方式） 

## http和json,xml解析
## 多线程开发
## 缓存处理 
## 看一个实例：egoPhotoViewController

## 存储：(1:归档 2：db 3：NsUserDefault 4:XML) 
## 自定义UI 
## egoRefreshHeadView 
## 消息提示 
## 无网略视图 
## 首次介绍 
## 复选框 
## 分享按钮 
## 应用推荐界面 
## 自定义tabbar 
## 关于view和事件模型 
### view生命周期 
### 响应者链

### 观察者模式 

## 例子

[图片导出]
写一个服务器，然后
iphone客户端把photo里的照片传给服务器，可以采用tcp也可以http,gamekit的p2p

[日志打印]
指定服务器

- [CaixinLogService log:@"%d,%@",1,3];


服务器端指定日期，可以修改应用所在手机的时间


[应用推荐]

- 应用推荐 v1(按钮)
- 应用推荐 v2(table)
- 应用推荐 v3(table + 按钮)
- 应用推荐 v4(table + 按钮 + scroll)
- 应用推荐 v5(table + 按钮 + scroll + 手势打开webview)  打开地址需要 1)appstrore打开  2）自己内置webview打开

[本机启动记录]

记录启动时间

[推荐提醒]

- 连续3天应用推荐提醒
使用数据库做提醒
打成bundle,指定db,表名，字段名称

	[CaixinNotification initDb:(NSString *)db tb:(NSString *)dbname field:(NSString *)fieldName ];
	if([CaixinNotification isSucces]){
		alert(...);
	}
	
- 

## 关于广告 
## 关于newStands新闻杂志 
## iap应用内支付 

## 正则表达式 
## 动画 
## 手势 
## 数据分析：报表 
## 内存使用和泄露查看 
## 内存跟踪与调试 

# UI automation 测试
这部分还需要处理一下，目前了解甚少



# 打包,构建工具 
构建
## 如何构建 
### .app 
### .framework 
### .a 
### 作业依赖 
## 如何发布 

## 更多高级构建场景 
### 测试环境 
### 共存 
### 条件编译 

## 已有构建工具 
## 构建原理 
## 如何自己写一个构建工具  
## 生成api文档 
### doxygen 
### appledoc 

## 如何用git打包，管理分支Merge等操作 


# 关于App store 
## 关于AppleID和DeveloperID 
## 申请DeveloperID 
## 证书和授权文件管理（p12） 
## 同一一应用共存原理 
## 推送配置 

## 应用上线发布等 
### xcode share distrubiltion 
### Application loader 

## 其他

