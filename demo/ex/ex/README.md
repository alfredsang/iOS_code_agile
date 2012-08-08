章节做分类



阅读
模拟
测试
错误题库




## db


 
### tb_shiti结构说明

｜－ id －｜－tid －｜－zid －｜－ tName |- tPicAddress －｜－ a1 －a5 －｜－ tanswer －｜－ tdesc －｜

- id          自增id
- tid         章节-带点
- zid         章节-数值
- tName       试题内容
- tPicAddress 图片地址
- a1          试题选项
- a2          试题选项
- a3          试题选项
- a4          试题选项
- tanswer     答案
- tdesc       答案解释或提示



### sql记录

    drop TABLE tb_shiti;
    CREATE TABLE tb_shiti(id INTEGER primary key autoincrement,tid string,zid string,tName text,tPicAddress string , a1 string, a2 string, a3 string, a4 string, a5 string, tanswer string, tdesc string);

    insert into tb_shiti(tid,zid,tName, tanswer,  a1, a2, a3, a4,tdesc)  values('1.1.1.1','100100','机动车驾驶人、行人违反道路交通安全法律、法规关于道路通行规定的行为，属于___。','n2','违章行为', '违法行为','过失行为','过错行为','=====违反道路交通安全法律、法规=====明显的是违法，题干已暗示了是=====违法=====行为。');


 
 

rails generate scaffold iLog appname:string appVersion:string filename:string linename:integer loglevel:string logcategoryname:string logcontent:text

在rails里，id和创建的时间戳是默认生成。所以上面的语句足够了。




## 模式

typedef enum {
    PatternModel_Seq = 0,//顺序练习
    PatternModel_Random = 1,//随机练习
    PatternModel_Chapter = 2,//章节练习
    PatternModel_Exam = 3,//模拟考试-交卷，收藏
} MyPatternModel;

- 自由模式
    --顺序练习
    --随机练习
    --章节练习
- 答题模式
    --模拟考试

## 公共设置

下拉

- 答题后直接跳到下一页
- 答题后显示答案
- 答题后显示解释信息
- 答题模式，自由|答题

##功能设计

### 顺序练习
1------最后

### 随机练习
产生随机数（1--最后）

#### 查出所有随机题的id，然后仍然按照id去查题，这样效率更好



### 章节练习
分类

### 模拟考试
-交卷，收藏，限时

### 我的错题


### 我的收藏


查看答案
收藏里，移除此题，取消收藏，查看答案

 
- [清空考试痕迹按钮]




                                


