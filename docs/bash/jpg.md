# JPG处理

## 1. JPG拼接为JPG

直接拼接

```bash
montage image1.jpg image2.jpg image3.jpg -tile 3x1 -geometry +0+0 output.jpg
```

裁剪后拼接

```bash
# 1. 裁剪每张图片的左右边缘各2像素
convert '图4(a).jpg' -shave 2x0 tmp_a4.jpg
convert '图4(b).jpg' -shave 2x0 tmp_b4.jpg
convert '图4(c).jpg' -shave 2x0 tmp_c4.jpg

# 2. 使用 montage 无缝拼接（无间距）
montage tmp_a4.jpg tmp_b4.jpg tmp_c4.jpg -tile 3x1 -geometry +0+0 '图4-full.jpg'

# 3. 清理临时文件
rm tmp_*4.jpg
```

## 2. JPG拼接为PDF

```bash
#!/bin/bash

set -e

if [ $# -ne 2 ]; then
    echo "用法:"
    echo "  $0 <图片目录> <输出PDF>"
    echo
    echo "示例:"
    echo "  $0 ./images result.pdf"
    exit 1
fi

INPUT_DIR="$1"
OUTPUT_PDF="$2"

if [ ! -d "$INPUT_DIR" ]; then
    echo "目录不存在: $INPUT_DIR"
    exit 1
fi

TMP_DIR=$(mktemp -d)

echo "压缩图片..."

find "$INPUT_DIR" \
    -type f \
    \( -iname "*.jpg" -o -iname "*.jpeg" \) \
    | sort \
    | while read -r f
do
    base=$(basename "$f")

    convert "$f" \
        -strip \
        -interlace Plane \
        -sampling-factor 4:2:0 \
        -quality 60 \
        "$TMP_DIR/$base"
done

echo "合并 PDF..."

find "$TMP_DIR" -type f -print0 | sort -z | xargs -0 img2pdf -o "$OUTPUT_PDF"

echo
echo "完成:"
echo "$OUTPUT_PDF"

rm -rf "$TMP_DIR"
```
