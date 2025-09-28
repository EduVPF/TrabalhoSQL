# Plataforma de Transações Financeiras Simplificada

## 1. Descrição do Projeto

Este projeto consiste na modelagem e implementação de um banco de dados para uma plataforma de transações financeiras simplificada. O sistema foi projetado para gerenciar usuários, tanto pessoas físicas (PF) quanto jurídicas (PJ), suas respectivas contas bancárias e o registro de transações.

O desenvolvimento seguiu as etapas clássicas de modelagem de dados: conceitual (DER), lógica e física, culminando na implementação dos scripts SQL para o SGBD MySQL.

## 2. Integrantes do Grupo

* Matheus Ferreira de Souza
* Eduardo Vieira Ponce Firmino

## 3. Como Executar o Banco de Dados

Para configurar e executar o banco de dados em um ambiente MySQL, siga os passos abaixo:

1.  **Pré-requisito:** Certifique-se de ter um servidor MySQL instalado e em execução.

2.  **Criação do Banco de Dados:** Execute o arquivo `CriaçãoDasTabelas.sql` em seu cliente MySQL preferido (MySQL Workbench, DBeaver, terminal, etc.).

    O script realizará as seguintes ações automaticamente:
    * Criação do banco de dados `plataforma_financeira`.
    * Criação de todas as tabelas: `usuarios`, `usuarios_pf`, `usuarios_pj`, `contas` e `transacoes`.
    * Inserção de dados de exemplo para popular o banco.
    * Execução de uma transação de `UPDATE` para simular uma transferência.
    * Execução de consultas `SELECT` para demonstrar o funcionamento.

3.  **Verificação:** Após a execução, você pode conectar-se ao banco de dados `plataforma_financeira` e executar as consultas `SELECT` para verificar os dados.
