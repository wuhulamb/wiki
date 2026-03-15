# Wireshark

## TLS/SSL 加密流量解密

创建 `/path/to/ssl_key.log` 空文件

```bash
touch /path/to/ssl_key.log
```

设置 `SSLKEYLOGFILE` 环境变量，再在此终端中打开浏览器（浏览器使用此环境变量将ssl_key记录到文件中）

```bash
export SSLKEYLOGFILE=/path/to/ssl_key.log
```

打开 Wireshark，进入 Edit -> Preferences -> Protocols -> TLS

设置 (Pre)-Master-Secret log filename 为上述密钥日志文件路径（如 `/path/to/ssl_key.log` ）

重新抓包，HTTPS 流量将自动解密。找到 Client Hello 包，右击选择 Follow -> TLS Stream ，即可看到解密后的明文

（payload部分如果是乱码，有可能是因为 HTTPS 流量使用 `Content-Encoding: gzip` 压缩，Wireshark不会自动解压压缩数据。Gzip 文件头格式为 `1F 8B` ，可以将这部分内容提取出来，解压后即为明文。）

```bash
xxd -r -p hex.txt response.gz
gzip -d response.gz  # response.gz被删除，输出解压后的文件 response
```
