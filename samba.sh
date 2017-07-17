#!/usr/bin/env bash
docker run \
	-ti \
	--rm \
	-p 139:139 \
	-p 445:445 \
	--name deadline-samba \
	-v deadline-volume:/share \
	dperson/samba \
	    -s "DeadlineRepository8;/share;yes;no;yes;all;none;all"
