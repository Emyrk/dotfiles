# All system files
for file in $(find $HOME/system/system -mindepth 1 | sort);
do
    if [ -f $file ]; then
        . $file
    fi
done
