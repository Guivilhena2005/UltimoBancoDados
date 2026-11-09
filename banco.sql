
-- ============================================================
-- BANCO DE PRÁTICA: escola_cursos
-- MySQL 8.0+
-- ============================================================

DROP DATABASE IF EXISTS escola_cursos;

CREATE DATABASE escola_cursos
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE escola_cursos;


-- ============================================================
-- 1. CRIAÇÃO DAS TABELAS
-- ============================================================

-- Tabela de professores
CREATE TABLE professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_admissao DATE NOT NULL
);

-- Tabela de cursos
CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    carga_horaria INT NOT NULL,
    valor_mensal DECIMAL(10,2) NOT NULL,
    id_professor INT NULL,

    CONSTRAINT fk_cursos_professores
        FOREIGN KEY (id_professor)
        REFERENCES professores(id_professor)
);

-- Tabela de alunos
CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(60) NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(100) NULL UNIQUE,
    id_curso INT NULL,

    CONSTRAINT fk_alunos_cursos
        FOREIGN KEY (id_curso)
        REFERENCES cursos(id_curso)
);

-- Tabela de pagamentos
CREATE TABLE pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    data_pagamento DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(20) NOT NULL,

    CONSTRAINT fk_pagamentos_alunos
        FOREIGN KEY (id_aluno)
        REFERENCES alunos(id_aluno)
);


-- ============================================================
-- 2. INSERÇÃO DOS DADOS
-- ============================================================

INSERT INTO professores
(nome, especialidade, salario, data_admissao)
VALUES
('Ana Lima', 'Banco de Dados', 6500.00, '2018-02-01'),
('Bruno Costa', 'Programação', 7200.00, '2019-03-15'),
('Carla Souza', 'Design', 5800.00, '2020-08-10'),
('Diego Martins', 'Redes', 6100.00, '2021-01-20'),
('Elisa Rocha', 'Programação', 6900.00, '2023-05-02');

INSERT INTO cursos
(nome, carga_horaria, valor_mensal, id_professor)
VALUES
('Banco de Dados com MySQL', 80, 350.00, 1),
('Lógica de Programação', 60, 280.00, 2),
('Python Essencial', 80, 390.00, 2),
('Design Gráfico', 100, 420.00, 3),
('Redes de Computadores', 120, 450.00, 4),
('Desenvolvimento Web', 100, 400.00, NULL);

INSERT INTO alunos
(nome, cidade, data_nascimento, email, id_curso)
VALUES
('Lucas Almeida', 'Campinas', '2005-03-12', 'lucas@email.com', 1),
('Mariana Silva', 'São Paulo', '2004-07-25', 'mariana@email.com', 1),
('Pedro Santos', 'Belo Horizonte', '2006-01-30', NULL, 2),
('Juliana Ferreira', 'Campinas', '2003-11-05', 'juliana@email.com', 3),
('Rafael Oliveira', 'Curitiba', '2005-09-18', 'rafael@email.com', 3),
('Beatriz Gomes', 'São Paulo', '2004-04-02', NULL, 4),
('Gabriel Rocha', 'Belo Horizonte', '2006-06-14', 'gabriel@email.com', 5),
('Larissa Pereira', 'Campinas', '2005-12-22', 'larissa@email.com', 2),
('Thiago Barbosa', 'Curitiba', '2003-08-09', NULL, NULL),
('Camila Ribeiro', 'São Paulo', '2006-02-27', 'camila@email.com', NULL);

INSERT INTO pagamentos
(id_aluno, data_pagamento, valor, forma_pagamento)
VALUES
(1, '2026-08-05', 350.00, 'PIX'),
(1, '2026-09-05', 350.00, 'PIX'),
(2, '2026-08-10', 350.00, 'CARTAO'),
(3, '2026-08-07', 280.00, 'BOLETO'),
(4, '2026-08-06', 390.00, 'PIX'),
(4, '2026-09-06', 390.00, 'PIX'),
(5, '2026-08-12', 390.00, 'CARTAO'),
(6, '2026-08-15', 420.00, 'BOLETO'),
(7, '2026-08-08', 450.00, 'PIX'),
(7, '2026-09-08', 450.00, 'PIX'),
(8, '2026-09-03', 280.00, 'CARTAO'),
(2, '2026-09-10', 350.00, 'CARTAO');


SELECT *
FROM professores;


SELECT nome, valor_mensal
FROM cursos;

SELECT nome, cidade, email
FROM alunos;


SELECT
    nome AS Professor,
    salario AS 'Salário Mensal'
FROM professores;

SELECT
    nome AS Curso,
    valor_mensal AS Mensalidade,
    valor_mensal * 6 AS Valor_Semestral
FROM cursos;


SELECT
    nome AS Curso,
    valor_mensal AS Mensalidade,
    valor_mensal * 12 AS Valor_Anual
FROM cursos;


SELECT nome, valor_mensal
FROM cursos
WHERE valor_mensal < 400;


SELECT nome, salario
FROM professores
WHERE salario >= 5000;


SELECT nome, cidade
FROM alunos
WHERE cidade = 'Campinas'
   OR cidade = 'Curitiba';


SELECT nome, cidade, email
FROM alunos
WHERE (cidade = 'Campinas'
       OR cidade = 'São Paulo')
  AND email IS NOT NULL
  AND id_curso IS NOT NULL;
