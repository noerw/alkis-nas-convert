#!/bin/bash

srs=${4:-"EPSG:25832"}
format=${3:-"gpkg"}
outfile=${2:-"alkis_`date -I`.$format"}
srcdir=${1:-"."}

function cleanup { rm -f $srcdir/*.{xml,gfs} }
trap cleanup EXIT

echo "unpacking $srcdir/*.gz"
gunzip -dkf $srcdir/*.gz

for f in $srcdir/*.xml; do
  # tested for alkis data RhlPfalz on fedora 27 (ogr2ogr 2.1.4)
  echo "adding $f to $outfile"
  ogr2ogr "$outfile" -f "$format" -append -update -a_srs "$srs" "$f"
done

