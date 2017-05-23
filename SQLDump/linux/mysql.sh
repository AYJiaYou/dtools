#! /bin/bash
# lfree 2017-05-23 14:50:00


curr_dir=$PWD

# help info
db_host=127.0.0.1
db_port=3306
db_user=ay
db_pass=ay2016jiayoukeji
db_name=healthy_id

# exit if dump.conf doesn't exits
dump_conf=$curr_dir/dump.conf
if [ ! -f $dump_conf  ]; then
    echo no dump.conf found!
    exit 1
fi

# read confs
while read conf_line; do
    echo $conf_line
done < $dump_conf
exit 0

# run clean.sql if it exists
clean_sql=$curr_dir/clean.sql
if [ -f $clean_sql ]; then
    mysql \
        --host=$db_host \
        --port=$db_port \
        --user=$db_user \
        --password=$db_pass \
        --show-warnings=FALSE \
        $db_name < clean.sql
    echo clean.sql found and executed!
fi
