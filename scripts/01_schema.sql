-- ============================================================================
-- Script: 01_schema.sql
-- Descrição: Criação do banco de dados e das tabelas RESTART e CLOUD_PRACTITIONER
-- ============================================================================

CREATE DATABASE IF NOT EXISTS aws_restart_lab;
USE aws_restart_lab;

-- Etapa 7: Criação da tabela RESTART
CREATE TABLE IF NOT EXISTS RESTART (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    restart_city VARCHAR(100) NOT NULL,
    graduation_date DATETIME NOT NULL
);

-- Etapa 10: Criação da tabela CLOUD_PRACTITIONER
CREATE TABLE IF NOT EXISTS CLOUD_PRACTITIONER (
    student_id INT PRIMARY KEY,
    certification_date DATETIME NOT NULL,
    CONSTRAINT fk_restart_student
        FOREIGN KEY (student_id) REFERENCES RESTART(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
