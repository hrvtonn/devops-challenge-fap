# DevOps Challenge - FAP

![DevOps Pipeline](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-blue) ![Docker](https://img.shields.io/badge/Docker-Enabled-blue) ![Terraform](https://img.shields.io/badge/Terraform-AWS-orange) ![Observability](https://img.shields.io/badge/Observability-Prometheus%20%7C%20Grafana-green)

Este repositório contém a entrega final do desafio prático de DevOps do Programa de Formação Aponti (FAP). 

O projeto consolida conhecimentos de infraestrutura e automação com um ciclo de vida completo de uma aplicação Node.js (API de Aluguel de Carros), abordando **Integração Contínua (CI)**, **Entrega Contínua (CD)** e **Observabilidade**.

## 🚀 Arquitetura e Tecnologias

- **Aplicação**: Node.js, Express, TypeScript, Prisma (PostgreSQL).
- **CI/CD**: GitHub Actions (Lint, Testes Unitários, SAST, Build e Deploy).
- **Containerização**: Docker (Multi-stage build).
- **Infraestrutura como Código (IaC)**: Terraform (Provisionamento de instâncias EC2 na AWS).
- **Observabilidade**: Prometheus e Grafana (Métricas de tráfego e requisições expostas via `prom-client`).

---

## 🛠️ Como executar localmente

Para testar a aplicação e visualizar os dados no Grafana, utilize o Docker Compose configurado no repositório:

1. Clone o repositório:
   ```bash
   git clone https://github.com/SEU-USUARIO/devops-challenge-fap.git
   cd devops-challenge-fap
   ```

2. Suba a infraestrutura local (API, Banco de Dados, Prometheus e Grafana):
   ```bash
   docker compose up -d --build
   ```

3. Acesse os serviços nos seguintes endereços:
   - **API REST**: [http://localhost:3000](http://localhost:3000)
   - **Métricas da API**: [http://localhost:3000/metrics](http://localhost:3000/metrics)
   - **Prometheus**: [http://localhost:9090](http://localhost:9090)
   - **Grafana**: [http://localhost:3001](http://localhost:3001) *(Usuário: `admin`, Senha: `admin`)*

---

## 📈 Configurando o Dashboard de Observabilidade

Para visualizar as métricas da API no Grafana:
1. Faça login no Grafana (`localhost:3001`).
2. Adicione uma conexão de Data Source apontando para o Prometheus (`http://prometheus:9090`).
3. Crie uma nova Dashboard e utilize a seguinte PromQL para acompanhar a taxa de requisições por segundo:
   ```promql
   rate(http_request_duration_ms_count[1m])
   ```

---

## ☁️ Como rodar o Pipeline na AWS

O pipeline (`.github/workflows/ci-cd.yml`) provisiona uma EC2 na AWS usando Terraform e faz o deploy do container. Para utilizá-lo, cadastre as seguintes **Secrets** no seu repositório do GitHub:

- `DOCKERHUB_USERNAME` e `DOCKERHUB_TOKEN`: Autenticação no Docker Hub.
- `AWS_ACCESS_KEY_ID` e `AWS_SECRET_ACCESS_KEY`: Credenciais IAM da AWS com permissão de EC2.
- `AWS_KEY_NAME`: Nome do seu Key Pair criado na AWS.
- `EC2_HOST` e `EC2_SSH_KEY`: Endereço de IP e chave `.pem` para conexão SSH na instância criada.
