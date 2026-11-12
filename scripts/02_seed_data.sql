-- ============================================================================
-- Script: 02_seed_data.sql
-- Descrição: Inserção de registros de amostra nas tabelas do laboratório
-- ============================================================================

USE aws_restart_lab;

-- Etapa 8: Inserção de 10 linhas de amostra na tabela RESTART
INSERT INTO RESTART (student_id, student_name, restart_city, graduation_date) VALUES
(101, 'Isaias Oliveira', 'São Paulo', '2026-11-20 18:00:00'),
(102, 'Mariana Silva', 'Rio de Janeiro', '2026-11-20 18:00:00'),
(103, 'Carlos Eduardo Santos', 'Belo Horizonte', '2026-11-20 18:00:00'),
(104, 'Fernanda Costa', 'Curitiba', '2026-11-20 18:00:00'),
(105, 'Lucas Almeida', 'São Paulo', '2026-11-20 18:00:00'),
(106, 'Juliana Pereira', 'Porto Alegre', '2026-11-20 18:00:00'),
(107, 'Rafael Souza', 'Recife', '2026-11-20 18:00:00'),
(108, 'Camila Rodrigues', 'Salvador', '2026-11-20 18:00:00'),
(109, 'Bruno Ferreira', 'Brasília', '2026-11-20 18:00:00'),
(110, 'Patrícia Lima', 'Florianópolis', '2026-11-20 18:00:00');

-- Etapa 11: Inserção de 5 linhas de amostra na tabela CLOUD_PRACTITIONER
INSERT INTO CLOUD_PRACTITIONER (student_id, certification_date) VALUES
(101, '2026-12-05 14:30:00'),
(102, '2026-12-06 10:00:00'),
(104, '2026-12-08 16:15:00'),
(105, '2026-12-10 09:45:00'),
(109, '2026-12-12 11:20:00');
