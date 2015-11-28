#EXPORT DATA TO CSV
mysql --user=timecamp --password= timecamp -e "SELECT tc_user_log.user_id, tc_user_log.application_id, tc_user_log.end_time, time_span, end_date, app_name, aditional_info, category_id, synch_time, login_time, register_time, time_zone, login_count, plan, language, admin_userid, root_group_id 
INTO OUTFILE '/tmp/2015-11.csv' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n'
from tc_user_log 
left join tc_application on tc_application.application_id = tc_user_log.application_id
left join tc_user on tc_user.user_id = tc_user_log.user_id
where end_date >= '2015-11-01' and end_date <= '2015-11-31';"  

#FIX NULL VALUES
cd /tmp/
time sed -i -e's/,\\N,/,,/g' 2015-11.csv
head -n 15 /tmp/2015-11.csv

#GZIP FILES
time gzip 2015-11.csv

#UPLOAD TO GOOGLE CLOUD
time gsutil cp 2015-11-1.csv.gz gs://2015-11/

#ON MAC LOAD DATA INTO BIG QUERY FROM GOOGLE CLOUD
time bq load --nosync --skip_leading_rows=1 --max_bad_record=300 timecamp2.tc_user_log gs://2015-11/2015-11-1.csv.gz user_id:INTEGER,application_id:INTEGER,end_time:TIMESTAMP,time_span:INTEGER,end_date:STRING,app_name:STRING,aditional_info:STRING,category_id:INTEGER,synch_time:TIMESTAMP,login_time:TIMESTAMP,register_time:TIMESTAMP,time_zone:INTEGER,login_count:INTEGER,plan:INTEGER,language:INTEGER,admin_userid:INTEGER,root_group_id:INTEGER
