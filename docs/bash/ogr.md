# ogr

## ogrinfo

查看地图文件信息

```bash
ogrinfo -so -al 中国_县.geojson
```

```bash
ogrinfo -dialect sqlite -sql "SELECT ST_GeometryType(geometry), COUNT(*) FROM \"中国_县\" GROUP BY ST_GeometryType(geometry)" 中国_县.geojson
```

## ogr2ogr

将 `中国_县.geojson` 转为 `output.shp`

```bash
ogr2ogr -f "ESRI Shapefile" \
  -lco ENCODING=UTF-8 \
  -dialect sqlite \
  -sql "SELECT * FROM \"中国_县\" WHERE ST_GeometryType(geometry) = 'MULTIPOLYGON'" \
  output.shp 中国_县.geojson
```
