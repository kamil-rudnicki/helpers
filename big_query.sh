#EXPORT DATA TO CSV
mysql --user=timecamp --password timecamp 

"SELECT tc_user_log.user_id, tc_user_log.application_id, tc_user_log.end_time, time_span, end_date, REPLACE(SUBSTR(app_name, 1, 30), '\\', ''), REPLACE(SUBSTR(aditional_info, 1, 30), '\\', ''), category_id, synch_time, login_time, register_time, time_zone, login_count, plan, language, admin_userid, root_group_id 
INTO OUTFILE '/tmp/2014-06-02.csv' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n'
from tc_user_log 
left join tc_application on tc_application.application_id = tc_user_log.application_id
left join tc_user on tc_user.user_id = tc_user_log.user_id
where end_date >= '2014-06-01' and end_date <= '2015-02-31';"  

#FIX NULL VALUES
cd /tmp/
time sed -i -e's/\\\"//g' -e's/,\\N,/,,/g' 2014-06-02.csv
#sed '2710369q;d' 2015-08-11.csv 
#head -n 15 /tmp/2015-08-11.csv

#GZIP FILES
time gzip 2014-06-02.csv

#UPLOAD TO GOOGLE CLOUD
time gsutil cp 2014-06-02.csv.gz gs://2015-11/

#ON MAC LOAD DATA INTO BIG QUERY FROM GOOGLE CLOUD
time bq load --nosync --skip_leading_rows=1 --max_bad_record=9999 timecamp2.tc_user_log gs://2015-11/2014-06-02.csv.gz user_id:INTEGER,application_id:INTEGER,end_time:TIMESTAMP,time_span:INTEGER,end_date:STRING,app_name:STRING,aditional_info:STRING,category_id:INTEGER,synch_time:TIMESTAMP,login_time:TIMESTAMP,register_time:TIMESTAMP,time_zone:INTEGER,login_count:INTEGER,plan:INTEGER,language:INTEGER,admin_userid:INTEGER,root_group_id:INTEGER
