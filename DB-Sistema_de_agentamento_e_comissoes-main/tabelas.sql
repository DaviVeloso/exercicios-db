CREATE TABLE profissional (
    id_profissional SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    especialidade VARCHAR(100),
    percentual_comissao DECIMAL(5,2) NOT NULL CHECK (percentual_comissao >= 0),
    ativo BOOLEAN DEFAULT TRUE
);

-- =========================
-- TABELA: CLIENTE
-- =========================
CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(150) UNIQUE NOT NULL,
    data_cadastro DATE DEFAULT CURRENT_DATE
);

-- =========================
-- TABELA: SERVICO
-- =========================
CREATE TABLE servico (
    id_servico SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco_base DECIMAL(10,2) NOT NULL CHECK (preco_base >= 0),
    duracao_minutos INT NOT NULL CHECK (duracao_minutos > 0),
    ativo BOOLEAN DEFAULT TRUE
);

-- =========================
-- TABELA: AGENDAMENTO
-- =========================
CREATE TABLE agendamento (
    id_agendamento SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    status VARCHAR(20) DEFAULT 'AGENDADO',
    valor_final DECIMAL(10,2) NOT NULL CHECK (valor_final >= 0),

    id_cliente INT NOT NULL,
    id_profissional INT NOT NULL,
    id_servico INT NOT NULL,

    CONSTRAINT fk_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
        ON DELETE CASCADE,

    CONSTRAINT fk_profissional
        FOREIGN KEY (id_profissional)
        REFERENCES profissional(id_profissional)
        ON DELETE CASCADE,

    CONSTRAINT fk_servico
        FOREIGN KEY (id_servico)
        REFERENCES servico(id_servico)
        ON DELETE CASCADE
);


CREATE EXTENSION IF NOT EXISTS btree_gist;

ALTER TABLE agendamento
ADD CONSTRAINT evitar_sobreposicao
EXCLUDE USING gist (
    id_profissional WITH =,
    tsrange(
        (data::timestamp + hora_inicio),
        (data::timestamp + hora_fim)
    ) WITH &&
);

-- =========================
-- TABELA: COMISSAO
-- =========================
CREATE TABLE comissao (
    id_comissao SERIAL PRIMARY KEY,
    valor_servico DECIMAL(10,2) NOT NULL,
    percentual_aplicado DECIMAL(5,2) NOT NULL,
    valor_comissao DECIMAL(10,2) NOT NULL,
    data_calculo DATE DEFAULT CURRENT_DATE,
    status_pagamento VARCHAR(20) DEFAULT 'PENDENTE',

    id_agendamento INT UNIQUE NOT NULL,

    CONSTRAINT fk_agendamento
        FOREIGN KEY (id_agendamento)
        REFERENCES agendamento(id_agendamento)
        ON DELETE CASCADE
);