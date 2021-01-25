# All system files
for file in $(find $HOME/system/system -mindepth 1);
do
    if [ -f $file ]; then
        . $file
    fi
done
