#!/bin/bash

oldside=${1}
if [ "${oldside}" = ":none" ]; then 
 oldside="" ; newside=":both"
else
 newside=${oldside}
fi
oldwhere=${3}
newwhere=${oldwhere}
if [ "${oldwhere}" = "on_street" ]; then 
 newwhere="lane"
fi
if [ "${oldwhere}" = "lay_by" ]; then 
 newwhere="street_side"
fi
echo "*[parking:lane${oldside}:${2}=${oldwhere}] {"
echo "    throwWarning: tr(\"{0} is deprecated\", \"{0.tag}\");"
echo "    group: tr(\"deprecated tagging\");"
echo "    fixRemove: \"parking:lane${oldside}:${2}\";"
echo "    fixAdd: \"parking${newside}:orientation=${2}\";"
echo "    fixAdd: \"parking${newside}=${newwhere}\";"
echo "}"
