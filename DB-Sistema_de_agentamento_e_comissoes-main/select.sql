SELECT 
    a.id_agendamento,
    c.nome AS cliente,
    p.nome AS profissional,
    s.nome AS servico,
    a.data,
    a.hora_inicio,
    a.hora_fim,
    a.valor_final,
    cm.valor_comissao
FROM agendamento a
JOIN cliente c ON a.id_cliente = c.id_cliente
JOIN profissional p ON a.id_profissional = p.id_profissional
JOIN servico s ON a.id_servico = s.id_servico
JOIN comissao cm ON cm.id_agendamento = a.id_agendamento;