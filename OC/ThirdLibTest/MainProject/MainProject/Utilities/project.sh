#!/bin/sh

#  project.sh
#  MainProject
#
#  Created by 江连松 on 2017/12/21.
#  Copyright © 2017年 JLS. All rights reserved.


#从某个bundle复制图片到本工程下
function copy_resource_from_bundle() {
RESOURCE_FOLDER_PATH=${CODESIGNING_FOLDER_PATH/${FULL_PRODUCT_NAME}}$1
for file in $(ls -R ${RESOURCE_FOLDER_PATH})
do
if [[ ${file} == *'.jpg' || ${file} == *'.jpeg' || ${file} == *'.png' ]]; then
echo ${file} >> /Users/jiangliansong/Desktop/code.txt
cp ${RESOURCE_FOLDER_PATH}/${file} ${CODESIGNING_FOLDER_PATH}/${file}
fi
done
}

#搜索本工程下所有的bundle，复制所有的bundle里的图片到本工程下
function copy_all_resource() {
for file in $(ls -R ${CODESIGNING_FOLDER_PATH/${FULL_PRODUCT_NAME}})
do
if [[ ${file} == *'.bundle' ]]
then
echo ${file} > /Users/jiangliansong/Desktop/code.txt
copy_resource_from_bundle ${file}
fi
done
}


copy_all_resource
exit 0
