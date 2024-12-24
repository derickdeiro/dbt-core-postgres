
# DBT Core com PostgreSQL

Este projeto é um estudo das funcionalidades do **DBT Core** utilizando um banco de dados **PostgreSQL**. Ele explora o uso de transformações de dados, documentação, testes e integrações de CI/CD.

## 📚 Descrição

O projeto utiliza o banco de dados Northwind (baseado no projeto original do SQL Server) para exemplificar e testar as funcionalidades do DBT Core. O PostgreSQL e o PgAdmin são executados em um ambiente configurado via `docker-compose`, garantindo facilidade de setup e portabilidade.

## 🛠️ Tecnologias Utilizadas

- **DBT Core**: Para modelagem, transformação e documentação de dados.
- **PostgreSQL**: Banco de dados utilizado para este estudo.
- **PgAdmin**: Interface de gerenciamento para o PostgreSQL.
- **Docker Compose**: Para orquestrar os serviços (PostgreSQL e PgAdmin).
- **CI/CD**: Configuração para integração e entrega contínua das transformações e testes utilizando o GitHub Actions.
- **Projeto Northwind**: Conjunto de dados para estudos e testes.

## 🚀 Funcionalidades

- Configuração de ambiente local com **Docker Compose**.
- Transformações de dados utilizando **DBT Core**.
- Implementação de **testes de dados** para garantir a qualidade dos dados.
- Geração automática de **documentação** do pipeline de dados.
- Configuração de **CI/CD** para automatizar deploys e validações.

## 📂 Estrutura do Repositório

- `/models`: Contém os modelos de transformação DBT.
- `/tests`: Testes para validar os dados transformados.
- `/docker-compose.yml`: Configuração dos serviços Docker.
- `/documentation`: Documentação gerada pelo DBT.

## ⚙️ Configuração e Instalação

### Pré-requisitos
- **Docker** e **Docker Compose** instalados na máquina.
- DBT Core configurado no ambiente local (ou via container).

### Passos para execução
1. Clone este repositório:
   ```bash
   git clone https://github.com/derickdeiro/dbt-core-postgres.git
   cd dbt-core-postgres
   ```
2. Crie um arquivo `.env` para preencher as seguintes variáveis de ambiente:
    ```
    POSTGRES_PASSWORD=DIGITE_SUA_SENHA_POSTGRES
    PGADMIN_DEFAULT_EMAIL=DIGITE_SEU_EMAIL_PARA_ACESSAR_O_PGADMIN
    PGADMIN_DEFAULT_PASSWORD=DIGITE_SUA_SENHA_PARA_PGADMIN
    ```

3. Suba os serviços com Docker Compose:
   ```bash
   docker-compose up -d
   ```

4. Execute os testes:
   ```bash
   dbt test
   ```

5. Execute as transformações DBT:
   ```bash
   dbt run
   ```

6. Visualize a documentação:
   ```bash
   dbt docs generate
   dbt docs serve
   ```

## 🌐 Acesso ao PgAdmin

Após subir os containers, você pode acessar o PgAdmin em:  
`http://localhost:16543`  
Use as credenciais configuradas no arquivo `.env`.

## 🧪 Testes de Dados

Os testes são configurados para validar a integridade dos dados transformados. Utilize o comando `dbt test` para executá-los e garantir a consistência.

