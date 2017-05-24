#! /bin/bash
# lfree 2017-05-23 14:50:00


curr_dir=$PWD

function usage() {
    echo "Usage: dt-mysql-dump [--help|-h]"
    echo "Do a fully dump(structure&data) of the specified database to a date-named file."
    echo ""
    echo "  dump.conf"
    echo "      This file is expected in the current folder('./')"
    echo "      which should contains following info:"
    echo ""
    echo "      db_host=host_address"
    echo "      db_port=port_number"
    echo "      db_user=user_name"
    echo "      db_pass=user_password"
    echo "      db_name=database_name"
    echo "      out_folde=output_folder, default to './'"
    echo ""
    echo "  clean.sql"
    echo "      If this file exists in the current folder, it will be executed before the dump."
    echo 
    echo "lfree 2017-05-24 16:14:00"
    echo "xh.dreamlover@gmail.com xh@ayjiayou.com"
}

# help info
if [[ "$@" == "--help" || "$@" == "-h" ]]; then
    usage
    exit 0
fi

#db_host=127.0.0.1
#db_port=3306
#db_user=ay
#db_pass=ay2016jiayoukeji
#db_name=healthy_id
#out_folder=./

# exit if dump.conf doesn't exits
dump_conf=$curr_dir/dump.conf
if [ ! -f $dump_conf  ]; then
    usage
    exit 1
fi

# read confs
while read conf_line; do
    eval ${conf_line%=*}=${conf_line#*=}
done < <(sed -n '/^[^#   ]\+=[^  ]\+/p' $dump_conf)

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
    echo O clean.sql found and executed!
fi

# dump the whole db
fn=$out_folder$(date +%Y-%m-%d_%H:%M_full.sql)
mysqldump \
    --host=$db_host \
    --port=$db_port \
    --user=$db_user \
    --password=$db_pass \
    --result-file=$fn \
    $db_name
echo O dump finish!

# remove the auto_increment...
sed -i 's/AUTO_INCREMENT=[0-9]\+ //g' $fn 
echo O AUTO_INCREMENT removed!
echo
echo $fn created!
