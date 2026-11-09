USE escola_cursos;

-- Atividade 1 SELECT * FROM professores;

-- Atividade 2 SELECT nome AS Curso, valor_mensal AS `Mensalidade (R$)` FROM cursos;

-- Atividade 3 SELECT * FROM alunos WHERE cidade = 'Campinas';

-- Atividade 4 SELECT nome, valor_mensal FROM cursos WHERE valor_mensal BETWEEN 300 AND 400;

-- Atividade 5 SELECT nome FROM alunos WHERE nome LIKE '%ar%';

-- Atividade 6 SELECT nome, cidade FROM alunos WHERE email IS NULL;

-- Atividade 7 SELECT nome, data_admissao FROM professores WHERE especialidade = 'Programação' AND data_admissao >= '2020-01-01';

-- Atividade 8 SELECT nome, salario FROM professores ORDER BY salario DESC;

-- Atividade 9 SELECT nome, valor_mensal FROM cursos ORDER BY valor_mensal DESC LIMIT 3;

-- Atividade 10 SELECT DISTINCT cidade FROM alunos ORDER BY cidade ASC;

-- Atividade 11 SELECT cidade, COUNT(*) AS quantidade_alunos FROM alunos GROUP BY cidade ORDER BY quantidade_alunos DESC;

-- Atividade 12 SELECT forma_pagamento, SUM(valor) AS total_recebido FROM pagamentos GROUP BY forma_pagamento HAVING SUM(valor) > 1000;

-- Atividade 13 SELECT alunos.nome, cursos.nome FROM alunos INNER JOIN cursos ON alunos.id_curso = cursos.id_curso

-- Atividade  14 SELECT cursos.nome , professores.nome , professores.especialidade FROM cursos INNER JOIN professores ON cursos.id_professor = professores.id_professor ORDER BY professores.nome ASC

-- Atividade 15 SELECT alunos.nome , cursos.nome FROM alunos LEFT JOIN cursos ON alunos.id_curso = cursos.id_curso ORDER BY alunos.nome ASC

-- Atividade 16 SELECT professores.nome , professores.especialidade FROM professores LEFT JOIN cursos ON professores.id_professor = cursos.id_professor WHERE cursos.id_professor IS NULL;

-- Atividade 17 SELECT cursos.nome , alunos.nome FROM alunos RIGHT JOIN cursos ON alunos.id_curso = cursos.id_curso ORDER BY cursos.nome ASC;

-- Atividade 18 SELECT alunos.nome , cursos.nome FROM alunos LEFT JOIN cursos ON alunos.id_curso = cursos.id_curso UNION SELECT alunos.nome , cursos.nome FROM alunos RIGHT JOIN cursos ON alunos.id_curso = cursos.id_curso;

-- Atividade 19 SELECT pagamentos.data_pagamento, alunos.nome, cursos.nome, professores.nome, pagamentos.valor FROM pagamentos INNER JOIN alunos ON pagamentos.id_aluno = alunos.id_aluno INNER JOIN cursos ON alunos.id_curso = cursos.id_curso INNER JOIN professores ON cursos.id_professor = professores.id_professor ORDER BY pagamentos.data_pagamento ASC;

-- Atividade 20 SELECT cursos.nome, COUNT(DISTINCT alunos.id_aluno) AS quantidade_alunos, COALESCE(SUM(pagamentos.valor), 0) AS total_pago FROM cursos LEFT JOIN alunos ON cursos.id_curso = alunos.id_curso LEFT JOIN pagamentos ON alunos.id_aluno = pagamentos.id_aluno GROUP BY cursos.nome ORDER BY total_pago DESC;