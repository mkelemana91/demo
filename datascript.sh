#!/bin/bash

SED_FILE=data

TEMPLATE_FILE=${1:-template}
TARGET_FILE=${2:-temp}
DB_SOURCE_VALUE=${3:-localdb}
DB_USER_VALUE=${4:-Meli}
DB_PASSWORD_VALUE=${5:-Meli123}
ENV_VALUE=${6:-QA}
PREMISE_ID_VALUE=${7:-BLK}
LEARNER_COUNT_VALUE=${8:-10}

rm -r $SED_FILE
printf 's:$DBSource:'"$DB_SOURCE_VALUE"':\n' > $SED_FILE
printf 's:$DBUser:'"$DB_USER_VALUE"':\n' >> $SED_FILE
printf 's:$DBPassword:'"$DB_PASSWORD_VALUE"':\n' >> $SED_FILE
printf 's:$Env:'"$ENV_VALUE"':\n' >> $SED_FILE
printf 's:$PremiseId:'"$PREMISE_ID_VALUE"':\n' >> $SED_FILE
printf 's:$LearnerCount:'"$LEARNER_COUNT_VALUE"':\n' >> $SED_FILE
printf 's:$CourseId:'"$COURSE_ID_VALUE"':\n' >> $SED_FILE

sed -f $SED_FILE $TEMPLATE_FILE > $TARGET_FILE

if [ $? -eq 0 ]; then
   echo sed replacement command passed!
else
   echo sed replacement command failed!
fi
