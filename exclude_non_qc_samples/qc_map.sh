for file in $@
do
    NR_LINES=$(cat $file | awk '{print $1}')
    NAME=$(basename $file .bam)
    echo -e "$NAME\t$NR_LINES"
done