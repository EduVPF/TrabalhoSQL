-- Inserindo Usuário Pessoa Física 1 e sua conta
INSERT INTO usuarios (email, senha, rua, numero, bairro, cidade, estado, cep, tipo_usuario) VALUES ('joao.silva@email.com', 'senha123', 'Rua das Flores', '123', 'Centro', 'São Paulo', 'SP', '01000-000', 'PF');
SET @user_joao_id = LAST_INSERT_ID();
INSERT INTO usuarios_pf (usuario_id, cpf, nome) VALUES (@user_joao_id, '111.222.333-44', 'João da Silva');
INSERT INTO contas (usuario_id, numero_conta, agencia, tipo_conta, saldo) VALUES (@user_joao_id, '12345-6', '0001', 'Corrente', 1500.75);
SET @conta_joao_id = LAST_INSERT_ID();

-- Inserindo Usuário Pessoa Física 2 e sua conta
INSERT INTO usuarios (email, senha, rua, numero, bairro, cidade, estado, cep, tipo_usuario) VALUES ('maria.santos@email.com', 'senha456', 'Avenida Principal', '456', 'Jardins', 'Rio de Janeiro', 'RJ', '20000-000', 'PF');
SET @user_maria_id = LAST_INSERT_ID();
INSERT INTO usuarios_pf (usuario_id, cpf, nome) VALUES (@user_maria_id, '555.666.777-88', 'Maria dos Santos');
INSERT INTO contas (usuario_id, numero_conta, agencia, tipo_conta, saldo) VALUES (@user_maria_id, '65432-1', '0002', 'Poupança', 3250.00);
SET @conta_maria_id = LAST_INSERT_ID();

-- Inserindo Usuário Pessoa Jurídica e sua conta
INSERT INTO usuarios (email, senha, rua, numero, bairro, cidade, estado, cep, tipo_usuario) VALUES ('contato@acmesolucoes.com', 'senha789', 'Rua do Comércio', '789', 'Distrito Industrial', 'Belo Horizonte', 'MG', '30000-000', 'PJ');
SET @user_acme_id = LAST_INSERT_ID();
INSERT INTO usuarios_pj (usuario_id, cnpj, razao_social, nome_fantasia) VALUES (@user_acme_id, '12.345.678/0001-99', 'ACME Soluções em Tecnologia Ltda.', 'ACME Tech');
INSERT INTO contas (usuario_id, numero_conta, agencia, tipo_conta, saldo) VALUES (@user_acme_id, '9876-5', '0003', 'Corrente', 25000.00);
SET @conta_acme_id = LAST_INSERT_ID();

-- Inserindo uma transação de exemplo (a ser efetivada pelo script de UPDATE)
INSERT INTO transacoes (conta_origem_id, valor, tipo_transacao, conta_destino, agencia_destino, banco_destino) VALUES (@conta_joao_id, 250.50, 'Transferência', '65432-1', '0002', 'Este Banco');