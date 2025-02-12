![logo](https://eliasdh.com/assets/media/images/logo-github.png)
# 💙🤍Setup Nginx Ingress🤍💙

## 📘Table of Contents

1. [📘Table of Contents](#📘table-of-contents)
2. [🖖Introduction](#🖖introduction)
3. [✨Steps](#✨steps)
    1. [👉Step 1: Preparation](#👉step-1-preparation)
4. [🔗Links](#🔗links)

---

## 🖖Introduction

This document provides a step-by-step guide to setting up the `Nginx Ingress` on the Kubernetes clusters in the supercluster. The steps outlined in this document are essential for ensuring the proper functioning of the clusters and the supercluster.

## ✨Steps

### 👉Step 1: Preparation

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
# kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
```

## 🔗Links
- 👯 Web hosting company [EliasDH.com](https://eliasdh.com).
- 📫 How to reach us elias.dehondt@outlook.com