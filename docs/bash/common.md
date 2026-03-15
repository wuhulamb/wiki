# Common

## 1. 将当前文件夹所有pdf文件转成txt文件

```bash
#!/usr/bin/env bash

# 遍历当前文件夹中的所有文件
for file in *.pdf; do
  # 使用 pdftotext 将 PDF 转换为文本
  pdftotext "$file" "${file%.pdf}.txt"
  echo "Convert $file to ${file%.pdf}.txt"
done

echo "Conversion complete."
```

或者

```bash
find . -maxdepth 1 -name "*.pdf" -print0 | xargs -0 -n 1 pdftotext
```

## 2. 将myprogram放到后台运行，标准输出和错误重定向到logfile，退出bash保持运行

```bash
nohup myprogram &> logfile &
```

或者

```bash
nohup myprogram > logfile 2>&1 &
```

## 3. 发送Ctrl+C信号给后台运行的myprogram

先用 `ps aux | grep myprogram` 找出myprogram的PID，再用 `kill` 命令发出信号.

```bash
kill -SIGINT <PID>
```

## 4. 使用sed替换文本文件

假设有一个 `files.txt` 文件包含了当前文件夹中需要移动位置的文件，现在需要生成一个 `move_files.sh` 文件，包含很多移动命令（类似 `mv /home/user/demo1.txt /tmp/somewhere/` ）

使用下面的sed命令会对 `files.txt` 每一行进行替换，并将结果输出到终端。 `^` 表示从头匹配， `$` 表示从结尾匹配

```bash
sed "s|^|mv /home/user/|; s|$| /tmp/somewhere/|" files.txt
```
