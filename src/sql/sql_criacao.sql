USE biblioteca_teste;

-- Tabela de Usuários
CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(20),
    email VARCHAR(100) NOT NULL UNIQUE,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    categoria ENUM('Estudante', 'Professor') NOT NULL,
    status ENUM('Ativo', 'Inativo') DEFAULT 'Ativo',
    data_cadastro DATE 
);

-- Tabela de Livros
CREATE TABLE livro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    editora VARCHAR(100),
    ano_publicacao INT,
    categoria VARCHAR(50),
    disponibilidade INT
);

-- Tabela de Empréstimos
CREATE TABLE emprestimo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao_prevista DATE NOT NULL,
    data_devolucao_real DATE,
    renovacoes INT DEFAULT 0,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_livro) REFERENCES livro(id)
);

-- Tabela de Multas
CREATE TABLE multa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_emprestimo INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_geracao DATE NOT NULL,
    paga ENUM('Sim', 'Não') DEFAULT 'Não',
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_emprestimo) REFERENCES emprestimo(id)
);

-- Tabela de Reservas (Opcional)
CREATE TABLE reserva (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    data_reserva DATE NOT NULL,
    data_expiracao DATE NOT NULL,
    notificacao_enviada ENUM('Sim', 'Não') DEFAULT 'Não',
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_livro) REFERENCES livro(id)
);

-- Tabela de Login (Se houver autenticação)
CREATE TABLE login (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    nivel_acesso ENUM('Administrador', 'Bibliotecario') NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);
