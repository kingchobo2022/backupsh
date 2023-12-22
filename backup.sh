#!/bin/bash
arr=("aaa" "bbb" "ccc")
bdate=$(date +%Y%m%d)
yoil=$(date +%w)  # 0 sunday

for i in ${arr[@]}
do
        subdir="/backup/${i}"
        subdirold="${subdir}/old"
        subdircur="${subdir}/cur"
        if [ ! -e $subdir ] ; then
                mkdir ${subdir}
                mkdir ${subdirold}
                mkdir ${subdircur}
        fi

        # if sunday 0
        if [ ${yoil} == 0 ]; then
                rm -rf ${subdirold}
                mv ${subdircur} ${subdirold}
                mkdir ${subdircur}

                echo "/home/${i} full backup start"
        else
                echo "/home/${i} inc backup start"
        fi


        tar czpf ${subdircur}/${i}_${bdate}.tar.gz -g ${subdircur}/${i}_list /home/${i}
done
