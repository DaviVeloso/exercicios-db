SELECT 
    a.nome AS aluno,
    d.nome AS disciplina,
    m.data_matricula
FROM matricula m
JOIN aluno a ON m.id_aluno = a.id_aluno
JOIN disciplina d ON m.id_disciplina = d.id_disciplina;