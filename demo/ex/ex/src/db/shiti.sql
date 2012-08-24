CREATE TABLE tb_shiti(id INTEGER primary key autoincrement,tid string,zid string,tName text,tPicAddr string , a1 string, a2 string, a3 string, a4 string, a5 string, tanswer string, tdesc string,chapter string)



CREATE TABLE  tb_shoucang(
    scid INTEGER primary key autoincrement,
    tid number,
    tnum number,
    TNAME VARCHAR2(255),
    CREATE_TIME DATETIME DEFAULT (datetime(CURRENT_TIMESTAMP,'localtime'))
);


insert into tb_shoucang(tid,tnum,tname) values(11,11,'22');

select date(create_time) from tb_shoucang;