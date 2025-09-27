CREATE DATABASE IF NOT EXISTS plataforma_financeira;

USE plataforma_financeira;

-- Tabela central de usuários
CREATE TABLE usuarios (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    rua VARCHAR(255),
    numero VARCHAR(20),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado CHAR(2),
    cep VARCHAR(9),
    tipo_usuario ENUM('PF', 'PJ') NOT NULL
);

-- Tabela especializada para Pessoa Física
CREATE TABLE usuarios_pf (
    usuario_id INT PRIMARY KEY,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    nome VARCHAR(255) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id) ON DELETE CASCADE
);

-- Tabela especializada para Pessoa Jurídica
CREATE TABLE usuarios_pj (
    usuario_id INT PRIMARY KEY,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    razao_social VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id) ON DELETE CASCADE
);

-- Tabela de contas bancárias
CREATE TABLE contas (
    conta_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    numero_conta VARCHAR(20) NOT NULL UNIQUE,
    agencia VARCHAR(10) NOT NULL,
    tipo_conta ENUM('Corrente', 'Poupança') NOT NULL,
    saldo DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id) ON DELETE CASCADE
);

-- Tabela de transações financeiras
CREATE TABLE transacoes (
    transacao_id INT AUTO_INCREMENT PRIMARY KEY,
    conta_origem_id INT NOT NULL,
    valor DECIMAL(15, 2) NOT NULL,
    data_transacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tipo_transacao ENUM('Débito', 'Crédito', 'Transferência') NOT NULL,
    conta_destino VARCHAR(20),
    agencia_destino VARCHAR(10),
    banco_destino VARCHAR(100),
    FOREIGN KEY (conta_origem_id) REFERENCES contas(conta_id) ON DELETE RESTRICT
);