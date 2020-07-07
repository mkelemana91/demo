#!/bin/bash

SED_FILE=data

TEMPLATE_FILE=$1
TARGET_FILE=$2
DB_SOURCE_VALUE=$3
DB_USER_VALUE=$4
DB_PASSWORD_VALUE=$5
ENV_VALUE=$6
PREMISE_ID_VALUE=$7
LEARNER_COUNT_VALUE=$8

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
   curl https://raw.githubusercontent.com/scottyhardy/docker-wine/master/docker-wine -o docker-wine
   chmod +x docker-wine
   chmod +x ./mm.data.generator.exe
   ./docker-wine/mm.data.generator.exe
else
   oops! something went wrong!
fi
