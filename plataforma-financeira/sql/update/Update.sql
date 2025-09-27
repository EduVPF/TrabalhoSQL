-- Simula a efetivação da transferência registrada anteriormente
START TRANSACTION;

-- Debita o valor da conta de origem (João)
UPDATE contas SET saldo = saldo - 250.50 WHERE conta_id = @conta_joao_id;

-- Credita o valor na conta de destino (Maria)
UPDATE contas SET saldo = saldo + 250.50 WHERE conta_id = @conta_maria_id;

-- Confirma a transação se ambos os updates ocorrerem com sucesso
COMMIT;