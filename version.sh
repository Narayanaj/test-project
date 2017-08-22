#!/bin/bash

cd sbi/pom.xml

version=`grep "version = " pom.xml | cut -d= -f2 | tr -d ' ' | tr -d "'"`
tmp=`echo $version | cut -d. -f3`
upTmp=`expr $tmp + 1`
newVersionNum=`echo $version | cut -d. -f1-2`.$upTmp

sed -i "s/version = .*/version = '$newVersionNum'/" pom.xml
git add pom.xml
git commit -am "$newVersionNum"
git push -u origin versiontest 
