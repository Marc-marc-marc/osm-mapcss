#!/bin/bash

oldside=${1}
if [ "${oldside}" = ":none" ]; then 
 oldside="" ; newside=":both"
else
 newside=${oldside}
fi
echo "*[parking:lane${oldside}:${2}=painted_area_only] {"
echo "    throwWarning: tr(\"{0} is deprecated\", \"{0.tag}\");"
echo "    group: tr(\"deprecated tagging\");"
echo "    fixRemove: \"parking:lane${oldside}:${2}\";"
echo "    fixAdd: \"parking${newside}:markings=yes\";"
echo "    fixAdd: \"parking${newside}:orientation=${2}\";"
echo "}"
