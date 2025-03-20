```sql
CREATE DATABASE prontuario_vet CHARACTER SET utf8mb4;

CREATE TABLE especie (
    id_especie INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_especie VARCHAR(50) NOT NULL
);

CREATE TABLE animal (
    id_animal INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_animal VARCHAR(100) NOT NULL,
    especie_id INT NOT NULL -- chave estrangeira
);

CREATE TABLE prontuario (
    data_tratamento DATETIME NOT NULL PRIMARY KEY,
    observacao TEXT NULL,
    animal_id INT NOT NULL, -- chave estrangeira
    tratamento_id INT NOT NULL -- chave estrangeira
);

CREATE TABLE tratamento (
    id_tratamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_tratamento VARCHAR(100) NOT NULL,
    obs_tratamento TEXT NOT NULL
);

ALTER TABLE animal
    ADD CONSTRAINT fk_animal_especie
    FOREIGN KEY (especie_id) REFERENCES especie(id_especie);

ALTER TABLE prontuario
    ADD CONSTRAINT fk_prontuario_animal
    FOREIGN KEY (animal_id) REFERENCES animal(id_animal);

ALTER TABLE prontuario
    ADD CONSTRAINT fk_prontuario_tratamento
    FOREIGN KEY (tratamento_id) REFERENCES tratamento(id_tratamento);

INSERT INTO especie (nome_especie) VALUE ('Cachorro');
INSERT INTO especie (nome_especie) VALUE ('Gato');
INSERT INTO especie (nome_especie) VALUE ('Coelho');

INSERT INTO animal (nome_animal, especie_id) VALUE (
    'Meg',
    1
),
(
    'Luna',
    2
),
(
    'Bolinha',
    3
);

-- alteração na tabela para o id começar a parir de 100(usei mais para eviter confusões em relação ao id)
ALTER TABLE tratamento AUTO_INCREMENT = 100;

INSERT INTO tratamento (nome_tratamento, obs_tratamento) VALUES (
    'Vacina Antirrábica', 'Proteção contra raiva'
),
(
    'Vermifugação', 'Controle de vermes intestinais'
),
(
    'Castração', 'Esterilização'
);

-- como vou manipular todas as colunas, não preciso atribuilas, apenas digitar as informações na ordem esperada
INSERT INTO prontuario (animal_id, tratamento_id, data_tratamento, observacao) VALUES (
    1,
    100,
    '2025-08-30 11:30:00',
    'Renovar em 1 ano'
),
(
    1,
    101,
    '2025-08-30 11:35:00',
    'Houve reação alérgica'
),
(
    2,
    100,
    '2025-09-02 16:30:00',
    null
),
(
    2,
    102,
    '2025-02-10',
    'Demorou para voltar da anestesia, mas nada preocupante'
),
(
    3,
    101,
    '2025-03-01',
    null
);
```