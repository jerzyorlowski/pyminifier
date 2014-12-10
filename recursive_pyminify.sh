#/bin/sh

SEARCH_FOLDER=$1
REMV='ERP/'
num=0
ADDV='ERP2/'
TMPFILE='tmpafhtn.txt'
PYMINIFIER_PATH='/home/jerzy.orlowski/git/pyminifier/pyminifier/pyminifier.py'


for f in $(find $SEARCH_FOLDER -name '*.py'); 
do 
  DIRN=$(dirname $f);
  echo $f;
  DIRN2=${DIRN#'ERP/'};
  F2=${f#'ERP/'};

  num=$(($num + 1))
  echo $num
  if [ $num -eq 99999 ];
  then
    exit;
  fi
  #echo '# coding: utf-8' > $ADDV$F2
  #echo '# -*- coding: utf-8 -*-' >> $ADDV$F2
  python $PYMINIFIER_PATH $f > $ADDV$F2
  if [[ -s "$ADDV$F2" ]]
  then
    cat prepend.txt $ADDV$F2 > $TMPFILE
    mv $TMPFILE $ADDV$F2
  else
    cp $f $ADDV$F2
  fi

done
