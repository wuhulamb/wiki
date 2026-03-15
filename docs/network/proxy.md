# 科学上网

## 1. 拥有一台可以访问外网的服务器

可以使用ssh登录

## 2. 使用 `ssh -D` 代理流量

```bash
ssh -D 1080 -N user@your_machine
```

- `-D 1080` : 将本地1080端口的流量转发到服务器
- `-N` : 不执行远程命令（所以也不会登录进去获得shell）

## 3. 本地设置流量转发到1080端口

(1) firefox浏览器可直接在网络设置中配置手动代理

- SOCKS Host: `127.0.0.1`
- Port: `1080`
- 勾选SOCKS v5

(2) 命令行使用 `export` 修改环境变量

```bash
export ALL_PROXY=socks5://127.0.0.1:1080
export http_proxy=socks5://127.0.0.1:1080
export https_proxy=socks5://127.0.0.1:1080
export http_proxy=http://127.0.0.1:1080
export https_proxy=http://127.0.0.1:1080
```

删除ALL_PROXY变量，关闭代理

```bash
unset ALL_PROXY
```

