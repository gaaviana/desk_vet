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
```