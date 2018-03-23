# ALKIS NAS converter

Tiny commandline tool for conversion of ALKIS NAS konvois to (Q)GIS compatible
data formats.

- shell script for unix, dependent on gzip and ogr2ogr
- batch script for windows, dependent on QGIS 2.18, ships with 7zip

## usage on unix
Given you have an *ALKIS NAS Konvoi*, a set of compressed GML files like the following:

```
EcoLibro_20180313T000000_00von25_32400000_5585000.xml.gz
EcoLibro_20180313T000000_01von25_32400000_5585000.xml.gz
EcoLibro_20180313T000000_02von25_32400000_5585000.xml.gz
...
EcoLibro_20180313T000000_25von25_32400000_5585000.xml.gz
```

Run `./convert_alkis_nas.sh <input-nas-dir>`.
This will generate `./alkis_2018-03-13.gpkg` file containing your data.
Parameters to customize output filename, format, and SRS are available:

```sh
./convert_alkis_nas.sh <input dir> <outfile> <ogr driver> <out srs>
```

## usage on windows
Place your NAS Konvoi input data files (`*.gz`, see above) inside the directory of this batch script.
Run the `convert_alkis_nas.bat` script. `alkis.gpkg` will contain your data.
No parameters are available.

## todos
- [ ] add parameters to windows version
- [ ] windows: search for `ogr2ogr` in path, use QGIS/bin as fallback only

## license
GPL-3.0
