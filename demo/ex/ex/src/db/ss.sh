#! /bin/bash

# 1.1.1.1$100100	机动车驾驶人、行人违反道路交通安全法律、法规关于道路通行规定的行为，属于___。\n\n2\n违章行为\n违法行为\n过失行为\n过错行为\n“违反道路交通安全法律、法规”明显的是违法，题干已暗示了是“违法”行为。

# $1
# replace $  to  @
# %s/\$/@/g

# $2
# replace \n\  to  -
# :%s/\\n\\/-/g

# -  to ===
# ”  =====

# replace \n  to  -
# :%s/\\n/-/g
# 1.1.2.1$102900	在中华人民共和国境内与道路交通活动有关的单位和个人，都必须遵守《中华人民共和国道路交通安全法》。\n\n1\n正确\n错误\n\n\n听政府的话，不然会有麻烦的！
# echo "1.1.1.1@100100	机动车驾驶人、行人违反道路交通安全法律、法规关于道路通行规定的行为，属于___。-n2-违章行为-违法行为-过失行为-过错行为-“违反道路交通安全法律、法规”明显的是违法，题干已暗示了是“违法”行为。"|awk -F"	" '{
	
# 19.1.2.31@296700	A车在没有中心线或者同方向只有一条机动车道的道路上从前边行驶的B车的右侧超越发生事故，A车负全部责任。-n1-正确-错误-n-
	
	
	


# cat q.txt|awk -F"	" '{
# 4个图片的
# echo "2.2.1.5@121200	图中标志的含义是___。-image4.jpg-1-下陡坡-滑行-下行-上陡坡-看黄色三角形的尖角方向，：=====左下右上=====，尖角方向向左的就是下坡，向右的就是上坡。"|awk -F"	" '{
# 2个图片的
# echo "2.2.2.2@127800	图中是双向弯路标志。-image70.jpg-2-正确-错误-=====两侧变窄=====，没有双向弯路标志这一说法。	"|awk -F"	" '{
	# insert into tb_shiti(tid,zid,tName,tPicAddress, tanswer,a1,a2,tdesc)  values(#9.1.1.24#,#180600#,#图中标志的含义是___。#,#image147.jpg#,#3#,#载货汽车驶入#,#禁止载客汽车驶入#,#禁止载货汽车驶入#)
# echo "1.1.1.9@100900	机动车在设有最高限速标志的道路上行驶时，___。-n1-不得超过标明的最高时速-允许超过标明最高时速的10%-"
cat s1628.txt |awk -F"	" '{
  # printf( "%s\n",$2);

  split($1,myids,"@")
  split($2,myarr,"-")
  for(i=0;i<length(myarr);i++)
  {
 
	if( i==length(myarr)-1){
		 # printf( "--%d %s\n",i,myarr[i]);
	}else{
		if(i==1){
			
		}
		# printf( "%d %s\n",i,myarr[i]);
	}
  }

	if(match($2,/jpg/)!=0){
		#printf( "tupian -- %s\n",$2);
		
			if(  length(myarr) > 6  ){
				printf( "insert into tb_shiti(tid,zid,tName,tPicAddress,tanswer,a1,a2, a3,a4,tdesc)  values(#%s#,#%s#,#%s#,#%s#,#%s#, #%s#,#%s#,#%s#,#%s#,#%s#)\n",myids[1],myids[2],myarr[1],myarr[2],myarr[3],myarr[4],myarr[5],myarr[6],myarr[7],myarr[8],myarr[9]);
			}else{
				printf( "insert into tb_shiti(tid,zid,tName,tPicAddress, tanswer,a1,a2,tdesc)  values(#%s#,#%s#,#%s#,#%s#,#%s#,#%s#,#%s#,#%s#)\n",myids[1],myids[2],myarr[1],myarr[2],myarr[3],myarr[4],myarr[5],myarr[6]);
			}
			
			
	}else{

		
		if(  length(myarr) >=6 ){
			printf( "insert into tb_shiti(tid,zid,tName, tanswer,  a1, a2, a3, a4,tdesc)  values(#%s#,#%s#,#%s#,#%s#,#%s#, #%s#,#%s#,#%s#,#%s#)\n",myids[1],myids[2],myarr[1],myarr[2],myarr[3],myarr[4],myarr[5],myarr[6],myarr[7]);
		}else{
			printf( "insert into tb_shiti(tid,zid,tName,tanswer, a1,a2,tdesc)  values(#%s#,#%s#,#%s#,#%s#,#%s#, #%s#,#%s#)\n",myids[1],myids[2],myarr[1],myarr[2],myarr[3],myarr[4],myarr[5]);
		}
	}

 
}'


# insert into tb_shiti(tName,tPicAddr,a1, a2, a3 , a4 , a5 , tanswer, tdesc,chapter) 
# values('tName','tPicAddr','a1', 'a2', 'a3' , 'a4' , 'a5' , 1, 'tdesc','chapter');

# \w$ ./ss.sh
# 1.1.1.100100
# 0 
# 1 机动车驾驶人、行人违反道路交通安全法律、法规关于道路通行规定的行为，属于___。
# 2 n2
# 3 违章行为
# 4 违法行为
# 5 过失行为
# 6 过错行为
# --7 “违反道路交通安全法律、法规”明显的是违法，题干已暗示了是“违法”行为。
