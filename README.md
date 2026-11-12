# ☁️ AWS RDS & Linux Bastion: Banco de Dados Relacional na Nuvem

![AWS](https://img.shields.io/badge/AWS-RDS%20%7C%20EC2%20%7C%20VPC-232F3E?style=for-the-badge&logo=amazon-aws)
![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-Amazon%20Linux%20%2F%20SSH-FCC624?style=for-the-badge&logo=linux&logoColor=black)

Projeto prático desenvolvido no programa **AWS re/Start (Escola da Nuvem)** focado no provisionamento, isolamento de rede e administração de uma instância gerenciada no **Amazon Relational Database Service (Amazon RDS)** utilizando **MySQL**, com gerenciamento remoto via instância EC2 Linux.

---

## 🏗️ Arquitetura da Solução

```text
[Estação Local (Windows / PowerShell / PuTTY)]
       │
       ▼ (SSH - Porta TCP 22 | Chave .ppk)
[Amazon EC2: LinuxServer (Sub-rede Pública)]
       │
       ▼ (MySQL - Porta TCP 3306 | Security Group)
[Amazon RDS: MySQL Instance (Sub-rede Privada - Lab VPC)]
```

### Especificações Provisionadas:
* **Engine:** Amazon RDS for MySQL (Template Dev/Test - Free Tier).
* **Classe da Instância:** `db.t3.micro` (Burstable performance, Single-AZ).
* **Armazenamento:** General Purpose SSD (`gp2`), limite de 100 GB, sem IOPS provisionado.
* **Segurança:** Isolamento na `Lab VPC` sem exposição pública direta. Comunicação restrita via **Security Groups** apenas entre o `LinuxServer` e o RDS na porta `3306`.

---

## 📂 Estrutura do Repositório

```text
aws-rds-mysql-lab/
├── README.md                 # Documentação principal do projeto
├── .gitignore                # Proteção contra vazamento de chaves (.pem/.ppk)
├── docs/
│   └── architecture.md       # Detalhes de rede, Security Groups e acesso SSH
└── scripts/
    ├── 01_schema.sql         # DDL: Criação do banco e tabelas relacionais
    ├── 02_seed_data.sql      # DML: Carga de dados de amostra
    └── 03_queries.sql        # DQL: Consultas de validação e INNER JOIN
```

---

## 🚀 Guia de Execução

### 1. Conexão SSH ao Servidor Linux (Bastion)
Acesse a instância `LinuxServer` utilizando PuTTY (Windows) ou OpenSSH:

```bash
ssh -i "labsuser.pem" ec2-user@<IP_PUBLICO_LINUX_SERVER>
```

### 2. Instalação do Cliente MySQL e Conexão ao RDS
No terminal do `LinuxServer`, instale o cliente de banco de dados e conecte-se ao endpoint do RDS:

```bash
# Atualizar repositórios e instalar cliente MySQL/MariaDB
sudo yum update -y
sudo yum install mariadb105 -y

# Conectar à instância Amazon RDS
mysql -h <ENDPOINT_DO_RDS> -P 3306 -u admin -p
```

### 3. Execução dos Scripts SQL
Dentro do prompt `MySQL [(none)]>`, execute os scripts na ordem:
1. `scripts/01_schema.sql` — Cria o banco `aws_restart_lab` e as tabelas `RESTART` e `CLOUD_PRACTITIONER`.
2. `scripts/02_seed_data.sql` — Insere 10 alunos na tabela `RESTART` e 5 alunos certificados na tabela `CLOUD_PRACTITIONER`.
3. `scripts/03_queries.sql` — Realiza consultas de verificação e executa um `INNER JOIN` relacionando alunos e datas de certificação.

---

## 🧠 Competências Aplicadas
* **Cloud Architecture:** Provisionamento de bancos gerenciados (PaaS) e arquitetura de sub-redes pública/privada.
* **Network Security:** Configuração de regras stateful em Security Groups (princípio do menor privilégio).
* **Linux Administration:** Acesso remoto seguro via chaves assimétricas (`.pem`/`.ppk`) e gerenciamento de pacotes via `yum`.
* **SQL & Data Modeling:** Definição de chaves primárias/estrangeiras (`PRIMARY KEY`, `FOREIGN KEY`) e consultas relacionais (`INNER JOIN`).
