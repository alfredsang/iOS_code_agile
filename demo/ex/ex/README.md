章节做分类



阅读
模拟
测试
错误题库




## db


id，题目，图片地址，答案1-5，正确答案，说明，是否是判断题，是否有图，章节分类

｜－ id －｜－ tName |- tPicAddr －｜－ a1 －-－ a5 －｜－ tanswer －｜－ tdesc －｜－ chapter －｜


CREATE TABLE tb_shiti(id INTEGER primary key autoincrement,tName text,tPicAddr string , a1 string, a2 string, a3 string, a4 string, a5 string, tanswer INTEGER, tdesc string,chapter string)


insert into tb_shiti(tName,tPicAddr,a1, a2, a3 , a4 , a5 , tanswer, tdesc,chapter) values('tName','tPicAddr','a1', 'a2', 'a3' , 'a4' , 'a5' , 1, 'tdesc','chapter');


id INTEGER primary key autoincrement;
tName text;
tPicAddr string;
a1 string;
a2 string;
a3 string;
a4 string;
a5 string;
tanswer INTEGER;
tdesc string;
chapter string;



- id,
- appName,应用名称
- appVersion 应用版本
- fileName 文件名称
- createtime,日志创建时间
- lineNum 当前行号
- logLevel,是日志记录的优先级，Log4j建议只使用四个级别，优先级从高到低分别是ERROR、WARN、INFO、DEBUG。从简
- logCategoryName,分类名称，便于查询
- logContent


rails generate scaffold iLog appname:string appVersion:string filename:string linename:integer loglevel:string logcategoryname:string logcontent:text

在rails里，id和创建的时间戳是默认生成。所以上面的语句足够了。
