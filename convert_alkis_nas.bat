@ECHO OFF

SET tooldir="tools"
SET ogr2ogr="%PROGRAMFILES%\QGIS 2.18\bin\ogr2ogr.exe"
SET sevenzip="%tooldir%\7z.exe"

IF NOT EXIST %ogr2ogr% (
    echo QGIS 2.18 installation not found
    exit /B 1
)

IF NOT EXIST %sevenzip% (
    echo 7zip not found
    exit /B 2
)

FOR %%G IN (*.gz) DO (
    %sevenzip% -aoa e %%G
)

FOR %%G IN (*.xml) DO (
  %ogr2ogr% alkis.gpkg -f GPKG -append -update -a_srs %tooldir%\25832.epsg %%G 
)

del *.gfs *.xml
