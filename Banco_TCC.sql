DROP DATABASE cuidadores;

CREATE DATABASE cuidadores; 
USE cuidadores;

CREATE TABLE tipos (
    id INT NOT NULL PRIMARY KEY,
    tipo VARCHAR(10) NOT NULL
);

CREATE TABLE estados (
    id INT NOT NULL PRIMARY KEY,
    estado VARCHAR(255) NOT NULL
);

CREATE TABLE cidades (
    id INT NOT NULL PRIMARY KEY,
    cidade VARCHAR(255) NOT NULL,
    estado_id INT NOT NULL,
    FOREIGN KEY (estado_id) REFERENCES estados(id)
);

CREATE TABLE usuarios (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipos_id INT NOT NULL,
    nome VARCHAR(255),
    data_de_nasc DATE,
    cpf VARCHAR(11),
    celular VARCHAR(128),
    endereco VARCHAR(255),
    cep VARCHAR(8),
    cidades_id INT NOT NULL,
    email VARCHAR(128),
    senha VARCHAR(128),
    FOREIGN KEY (cidades_id) REFERENCES cidades(id),
    FOREIGN KEY (tipos_id) REFERENCES tipos(id)
);

CREATE TABLE cidades_usuarios (
    usuario_id INT NOT NULL,
    cidade_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (cidade_id) REFERENCES cidades(id),
    PRIMARY KEY (usuario_id, cidade_id)
);

INSERT INTO tipos (id, tipo) VALUES (1, 'Babá'), (2, 'Cliente');

INSERT INTO estados (id, estado) VALUES 
(1, 'Acre'), (2, 'Alagoas'), (3, 'Amapá'), (4, 'Amazonas'), (5, 'Bahia'), (6, 'Ceará'), (7, 'Distrito Federal'), (8, 'Espírito Santo'),
(9, 'Goiás'), (10, 'Maranhão'), (11, 'Mato Grosso'), (12, 'Mato Grosso do Sul'), (13, 'Minas Gerais'), (14, 'Pará'), (15, 'Paraíba'),
(16, 'Paraná'), (17, 'Pernambuco'), (18, 'Piauí'), (19, 'Rio de Janeiro'), (20, 'Rio Grande do Norte'), (21, 'Rio Grande do Sul'),
(22, 'Rondônia'), (23, 'Roraima'), (24, 'Santa Catarina'), (25, 'São Paulo'), (26, 'Sergipe'), (27, 'Tocantins');

INSERT INTO cidades (id, cidade, estado_id) VALUES 
(1, 'Barueri', 25), 
(2, 'Santana de Parnaíba', 25), 
(3, 'Rio de Janeiro', 19), 
(4, 'Niterói', 19);

INSERT INTO usuarios (tipos_id, nome, data_de_nasc, cpf, celular, endereco, cep, cidades_id, email, senha)values
(1, 'Maria', '2023-03-05', '48854448898', '4896328974', 'estrada', '06524135', 1, 'ggg@gmail.com', 'tereterer'),
(2, 'Luiz', '2006-03-05', '56859918898', '32679328974', 'avenida', '12524135', 2, 'hhg@gmail.com', '35533'),
(2, 'Lukas', '2002-03-05', '96859918898', '32679328974', 'sitio', '0823135', 3, 'hhg@gmail.com', 'mmmmm'),
(2, 'João', '1923-03-05', '22259988898', '1336328974', 'rua', '02584135', 4, 'lll@gmail.com', 'gugugu');

select * from usuarios;
