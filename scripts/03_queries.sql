-- ============================================================================
-- Script: 03_queries.sql
-- Descrição: Validação das tabelas e consulta relacional (INNER JOIN)
-- ============================================================================

USE aws_restart_lab;

-- Etapa 9: Selecionar todas as linhas da tabela RESTART
SELECT * FROM RESTART;

-- Etapa 12: Selecionar todas as linhas da tabela CLOUD_PRACTITIONER
SELECT * FROM CLOUD_PRACTITIONER;

-- Etapa 13: INNER JOIN exibindo Student ID, Student Name e Certification Date
SELECT 
    r.student_id AS 'Student ID',
    r.student_name AS 'Student Name',
    cp.certification_date AS 'Certification Date'
FROM RESTART r
INNER JOIN CLOUD_PRACTITIONER cp 
    ON r.student_id = cp.student_id
ORDER BY cp.certification_date ASC;
