-- Consulta 1: Lista todos os usuários e seus dados específicos (PF ou PJ)
SELECT
    u.usuario_id,
    u.email,
    u.tipo_usuario,
    pf.nome,
    pf.cpf,
    pj.razao_social,
    pj.cnpj
FROM
    usuarios u
LEFT JOIN usuarios_pf pf ON u.usuario_id = pf.usuario_id
LEFT JOIN usuarios_pj pj ON u.usuario_id = pj.usuario_id;

-- Consulta 2: Exibe os detalhes e o saldo atualizado da conta de Maria
SELECT
    pf.nome,
    c.numero_conta,
    c.agencia,
    c.saldo
FROM
    contas c
JOIN
    usuarios_pf pf ON c.usuario_id = pf.usuario_id
WHERE
    c.usuario_id = @user_maria_id;

-- Consulta 3: Mostra o histórico de transações da conta de João
SELECT
    t.data_transacao,
    t.tipo_transacao,
    t.valor,
    t.conta_destino,
    t.banco_destino
FROM
    transacoes t
WHERE
    t.conta_origem_id = @conta_joao_id
ORDER BY
    t.data_transacao DESC;