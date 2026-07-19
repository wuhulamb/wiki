# cerbot

查看所有域名证书

```bash
sudo certbot certificates
```

对所有域名renew

```bash
sudo certbot renew --dry-run
```

对指定域名renew

```bash
sudo certbot renew --cert-name mail.ooops.dpdns.org --dry-run
```

更新完域名证书后，需要重启相关服务，例如：重启 `dovecot` 和 `postfix` 服务

```bash
sudo systemctl restart dovecot postfix
```
