---
title: "Git"
parent: "Bash"
nav_order: 3
---

# Git

## 查看

```bash
git remote -v                # 查看推送的远端地址
git branch                   # 查看所有分支
git log                      # 查看提交日志
git log --graph --oneline    # 查看分支形状
```

## 配置

```bash
git remote set-url <name> <newurl> # 设置远端地址
git push -u origin <remote-branch> # 添加上游追踪（远端仓库没有分支可以使用该命令新建）
```

## 恢复

```bash
git restore --staged <file>  # 清除暂存区
git restore <file>           # 丢弃修改
```

## 分支

```bash
git checkout <branch>        # 切换到某一分支
git checkout -b <new-branch> # 新建并切换分支
git merge <branch>           # 合并到当前分支，能快进则快进；不能快进则生成合并提交
git merge --ff-only <branch> # 合并到当前分支，只允许快进
git branch -d <branch>       # 删除合并后的分支
git reset --soft <commit>    # 重置提交记录，不修改暂存区文件
git reset --hard <commit>    # 重置提交记录，完全重置
```

## 下载所有远程分支

```bash
git clone <repository-url>
cd <repository-name>
git fetch --all              # 下载所有远程分支
git branch -r                # 列出所有远程分支
git branch --track <local-branch> origin/<remote-branch>  # 创建本地分支并设置跟踪关系
git branch                   # 查看设置好的本地分支
```
