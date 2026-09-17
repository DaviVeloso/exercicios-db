INSERT INTO profissional (nome, telefone, especialidade, percentual_comissao)
VALUES ('Carlos Mendes', '62999999999', 'Cabeleireiro', 40.00);

INSERT INTO cliente (nome, telefone, email)
VALUES ('João Silva', '62988888888', 'joao@email.com');

INSERT INTO servico (nome, preco_base, duracao_minutos)
VALUES ('Corte de Cabelo', 50.00, 60);

INSERT INTO agendamento (
    data,
    hora_inicio,
    hora_fim,
    valor_final,
    id_cliente,
    id_profissional,
    id_servico
)
VALUES (
    '2026-03-10',
    '14:00',
    '15:00',
    50.00,
    1,
    1,
    1
);

INSERT INTO comissao (
    valor_servico,
    percentual_aplicado,
    valor_comissao,
    id_agendamento
)
VALUES (
    50.00,
    40.00,
    20.00,
    1
);
