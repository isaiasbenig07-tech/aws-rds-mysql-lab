# 🛡️ Arquitetura de Rede, Segurança e Acesso Remoto

Este documento detalha as configurações de rede e conectividade utilizadas no laboratório **Amazon RDS Challenge**.

---

## 1. Isolamento de Rede (VPC & Security Groups)

Para evitar a exposição direta do banco de dados à internet pública, a infraestrutura foi configurada em camadas:

| Camada | Recurso AWS | Porta | Origem Permitida | Finalidade |
| :--- | :--- | :--- | :--- | :--- |
| **Camada de Acesso** | EC2 (`LinuxServer`) | TCP `22` (SSH) | IP Administrativo | Terminal de administração remota (Bastion Host) |
| **Camada de Dados** | RDS (`MySQL`) | TCP `3306` (MySQL) | Security Group do `LinuxServer` | Tráfego exclusivo de consultas SQL internas |

> **Nota de Segurança:** Em vez de liberar um endereço IP fixo na regra de entrada do RDS, vincula-se o **ID do Security Group** da instância EC2. Isso garante que apenas instâncias autorizadas dentro da `Lab VPC` consigam alcançar a porta `3306`.

---

## 2. Configuração de Acesso SSH no Windows (PuTTY / PowerShell)

### Opção A: Via Windows PowerShell (OpenSSH nativo)
```powershell
# Ajustar permissões da chave .pem (se necessário) e conectar
ssh -i .\labsuser.pem ec2-user@<ENDERECO_PUBLICO_EC2>
```

### Opção B: Via PuTTY (Chave `.ppk`)
1. Abra o **PuTTY** e informe o Host Name: `ec2-user@<ENDERECO_PUBLICO_EC2>` na porta `22`.
2. Navegue até **Connection > SSH > Auth > Credentials**.
3. Em *Private key file for authentication*, selecione o arquivo `.ppk` baixado do painel **Details > Show** do laboratório.
4. Clique em **Open** para iniciar a sessão.

---

## 3. Modelo Entidade-Relacionamento (MER)

```text
+--------------------------+          +----------------------------+
|         RESTART          |          |     CLOUD_PRACTITIONER     |
+--------------------------+          +----------------------------+
| PK | student_id (INT)    |◄────┐    | PK, FK | student_id (INT)  |
|    | student_name        |     └────|        | certification_date|
|    | restart_city        |          +----------------------------+
|    | graduation_date     |
+--------------------------+
```

* **Relacionamento 1:1 (Opcional):** Todo registro em `CLOUD_PRACTITIONER` obrigatoriamente referencia um `student_id` válido cadastrado previamente na tabela `RESTART`.
