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
