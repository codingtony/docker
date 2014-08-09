#!/bin/bash
CNAME=$1
BACKUPDIR=$2
function usage() {	
	echo EZ Docker Container Backup Tool
	echo Released under APLv2
	echo by codingtony :  https://github.com/codingtony/docker
	echo
	echo "Usage $0 [data container name] [backup destination base directory]"
	echo "e.g. $0 mydatacontainer $(pwd)/backup"
	echo 
	echo "Data container name must exist."
	echo "Backup destination dir must exist and be writable"
	echo
	exit 1;
}

if [[ -z ${CNAME} || $# != 2 || ! -w "${BACKUPDIR}" || ! -d "${BACKUPDIR}" ]]; then
	usage
fi

CID=$(docker ps -a | grep ${CNAME} | cut -d" " -f1)

if [[ -z "${CID}" ]]; then
	echo "Container \"${CNAME}\" does not exist!"
	exit 1;
fi

VOLS=$(docker inspect --format  '{{ range $v,$va := .VolumesRW}} {{$v}} {{end}}' ${CID})

if [[ -z  ${VOLS} ]]; then
	echo "No volumes to backup!"
	exit 1;
fi
BACKUPFILE=${BACKUPDIR}/backup-${CNAME}-$(date +"%Y%m%d_%H%M%S").tar.gz

docker run  --rm --volumes-from ${CNAME} busybox tar cpf - $VOLS | gzip > ${BACKUPFILE}
echo "Backup completed in ${BACKUPFILE}"
