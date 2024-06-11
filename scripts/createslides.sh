#! /usr/bin/env bash
MODULE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]%/*}" )" &> /dev/null && pwd )

LECTURE_FOLDER=${MODULE_DIR}/$1

# default name is $1 if $2 not supplied
LECTURE_FILENAME=${2:-$1}

if [[ ! -d ${LECTURE_FOLDER} ]];then
	mkdir -p ${LECTURE_FOLDER}/figures
fi

source ${MODULE_DIR}/config

cat >> ${LECTURE_FOLDER}/${LECTURE_FILENAME}.md << EOF
---
title: DOCUMENT TITLE
description: DESCRIPTION OF DOCUMENT
class: gaia
_class:
  - lead
  - invert
style: |
    #img-right{
      float: right;
    }
    img[alt~="center"] {
      display: block;
      margin: 0 auto;
    }
    table {
      border-collapse: collapse;
      font-size: 22px;
    }
    table, th,tr, td {
      border: none!important;
      vertical-align: middle;
    }
size: 16:9
paginate: true
_paginate: false
marp: true
math: true
---

# LECTURE TITLE

    Course Code: $coursecode

    Course Name: $coursename

    Credits: $credits

    Module Leader: $moduleleader

---
EOF

# declutter environment variables
unset $coursecode $coursename $credits $moduleleader