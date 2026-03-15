---
title: "PDF处理"
parent: "Bash"
nav_order: 2
---

# PDF处理

## 1. 简单提取/合并PDF文件

先使用 `pdfseparate` 将 input.pdf 的33-35页分别提取至单个PDF文件中（page_33.pdf, page_34.pdf, page_35.pdf）

```bash
pdfseparate -f 33 -l 35 input.pdf page_%d.pdf
```

再使用 `pdfunite` 将这些单个PDF文件（page_33.pdf, page_34.pdf, page_35.pdf）合并到output.pdf中

```bash
pdfunite page_{33,34,35}.pdf output.pdf
```

## 2. 高级合并PDF文件（保留文档内部超链接）

假如有 simple_1.pdf, complex\_2\_20.pdf, simple_21.pdf ，其中 simple\_\*.pdf 均为简单pdf文件，不包含超链接，而 complex\_2\_20.pdf 包含完整的文档内部超链接，超链接不指向 simple\_\*.pdf ，则可以使用 `qpdf` 工具进行合并

安装 `qpdf`

```bash
sudo apt update
sudo apt install qpdf
```

合并PDF使用示例

```bash
qpdf --empty --pages simple_1.pdf complex_2_20.pdf simple_21.pdf -- output.pdf
```

## 3. PDF转JPG

使用 Poppler 工具包中的 `pdftoppm` 工具

```bash
pdftoppm -jpeg -r 300 input.pdf output
```

`-r` 选项指定输出分辨率为300（默认为150），最后输出结果为 `output-1.jpg` , `output-2.jpg`, `output-3.jpg`, ... （依据input.pdf的页数）
