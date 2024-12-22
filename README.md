![logo](https://eliasdh.com/assets/media/images/logo-github.png)
# 💙🤍README🤍💙

## 📘Table of Contents

1. [📘Table of Contents](#📘table-of-contents)
2. [🖖Introduction](#🖖introduction)
3. [📚Documentation](#📚documentation)
4. [🌌Supercluster Design](#🌌supercluster-design)
    1. [🌌Cluster 01](#🌌cluster-01)
    2. [🌌Cluster 02](#🌌cluster-02)
    3. [🌌Cluster 03](#🌌cluster-03)
5. [🖥️Interesting tools to manage your clusters](#🖥️interesting-tools-to-manage-your-clusters)
6. [📜A must read](#📜a-must-read)
7. [🔗Links](#🔗links)

---

## 🖖Introduction

I kindly request your thorough examination and absorption of the comprehensive documentation incorporated within the confines of this repository. Your diligent review of the diverse materials provided herein will undoubtedly enhance your understanding of the intricacies and nuances associated with the contents therein.

Please also see following documents:
- [LICENSE](LICENSE.md)
- [SECURITY](SECURITY.md)
- [CONTRIBUTING](CONTRIBUTING.md)

## 📚Documentation

- Setup Supercluster:
    1. [Setup The Operating System For The Nodes](Documentation/Setup-OS.md).
    2. [Setup The Hypervisor For The Nodes](Documentation/Setup-Hypervisor.md).
    3. [Setup Kubernetes](Documentation/Setup-Kubernetes.md).
    4. [Setup The Proxy Server For The Master Nodes](Documentation/Setup-Proxy.md).
    5. [Setup The Clusters For The Supercluster](Documentation/Setup-Clusters.md).

- Setup Cluster Infrastructure:
    1. [Setup Cert Manager](Documentation/Setup-CertManager.md).
    2. [Setup Metallb](Documentation/Setup-Metallb.md).
    3. [Setup Nginx Ingress](Documentation/Setup-NginxIngress.md).
    4. [Setup Longhorn](Documentation/Setup-Longhorn.md).

## 🌌Supercluster Design

### 🌌Cluster 01

- Nodes:
    | ID  | Name    | Cluster   | Roll    | IP        | CPU | RAM   | Disk | OS               |
    | --- | ------- | --------- | ------- | --------- | --- | ----- | -----| -----------------|
    | 001 | node01  | cluster01 | Master  | 10.1.0.1  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 002 | node02  | cluster01 | Master  | 10.1.0.2  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 003 | node03  | cluster01 | Master  | 10.1.0.3  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 004 | node04  | cluster01 | Worker  | 10.1.0.4  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 005 | node05  | cluster01 | Worker  | 10.1.0.5  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 006 | node06  | cluster01 | Worker  | 10.1.0.6  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 007 | node07  | cluster01 | Worker  | 10.1.0.7  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 008 | node08  | cluster01 | Worker  | 10.1.0.8  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 009 | node09  | cluster01 | Worker  | 10.1.0.9  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 010 | proxy01 | cluster01 | Worker  | 10.1.0.10 | 1   | 1GB   | 0KB  | Ubuntu 24.04 LTS |

### 🌌Cluster 02

- Nodes:
    | ID  | Name    | Cluster   | Roll    | IP        | CPU | RAM   | Disk | OS               |
    | --- | ------- | --------- | ------- | --------- | --- | ----- | -----| -----------------|
    | 011 | node11  | cluster02 | Master  | 10.2.0.1  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 012 | node12  | cluster02 | Master  | 10.2.0.2  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 013 | node13  | cluster02 | Master  | 10.2.0.3  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 014 | node14  | cluster02 | Worker  | 10.2.0.4  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 015 | node15  | cluster02 | Worker  | 10.2.0.5  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 016 | node16  | cluster02 | Worker  | 10.2.0.6  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 017 | node17  | cluster02 | Worker  | 10.2.0.7  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 018 | node18  | cluster02 | Worker  | 10.2.0.8  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 019 | node19  | cluster02 | Worker  | 10.2.0.9  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 020 | proxy02 | cluster02 | Worker  | 10.2.0.10 | 1   | 1GB   | 0KB  | Ubuntu 24.04 LTS |

### 🌌Cluster 03

- Nodes:
    | ID  | Name    | Cluster   | Roll    | IP        | CPU | RAM   | Disk | OS               |
    | --- | ------- | --------- | ------- | --------- | --- | ----- | -----| -----------------|
    | 021 | node31  | cluster03 | Master  | 10.3.0.1  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 022 | node32  | cluster03 | Master  | 10.3.0.2  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 023 | node33  | cluster03 | Master  | 10.3.0.3  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 024 | node34  | cluster03 | Worker  | 10.3.0.4  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 025 | node35  | cluster03 | Worker  | 10.3.0.5  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 026 | node36  | cluster03 | Worker  | 10.3.0.6  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 027 | node37  | cluster03 | Worker  | 10.3.0.7  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 028 | node38  | cluster03 | Worker  | 10.3.0.8  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 029 | node39  | cluster03 | Worker  | 10.3.0.9  | 16  | 64GB  | 8TB  | Ubuntu 24.04 LTS |
    | 030 | proxy03 | cluster03 | Worker  | 10.3.0.10 | 1   | 1GB   | 0KB  | Ubuntu 24.04 LTS |

## 🖥️Interesting tools to manage your clusters

1. [K9s](Documentation/Setup-K9s.md).
2. [K10s](https://github.com/eliasdehondt/k10s).

## 📜A must read

1. [Github Repository - Kubeadm Load Balancing](https://github.com/kubernetes/kubeadm/blob/main/docs/ha-considerations.md#options-for-software-load-balancing).

## 🔗Links
- 👯 Web hosting company [EliasDH.com](https://eliasdh.com).
- 📫 How to reach us elias.dehondt@outlook.com