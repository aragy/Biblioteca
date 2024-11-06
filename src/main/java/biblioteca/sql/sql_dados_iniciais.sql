USE biblioteca_db;

-- Inserindo Usuários
INSERT INTO usuario (nome, endereco, telefone, email, cpf, categoria, status)
VALUES
('Maria Silva', 'Rua das Flores, 123', '(11) 98765-4321', 'maria.silva@example.com', '123.456.789-00', 'Estudante', 'Ativo'),
('João Souza', 'Av. Brasil, 456', '(21) 91234-5678', 'joao.souza@example.com', '987.654.321-00', 'Professor', 'Ativo'),
('Ana Pereira', 'Praça da Sé, 789', '(31) 99876-5432', 'ana.pereira@example.com', '456.789.123-00', 'Estudante', 'Ativo');

-- Inserindo Livros
INSERT INTO livro (titulo, autor, isbn, editora, ano_publicacao, categoria, disponibilidade)
VALUES
('Dom Casmurro', 'Machado de Assis', '978-85-0000-000-1', 'Editora A', 1899, 'Romance', 'Disponível'),
('O Cortiço', 'Aluísio Azevedo', '978-85-0000-000-2', 'Editora B', 1890, 'Naturalismo', 'Disponível'),
('Memórias Póstumas de Brás Cubas', 'Machado de Assis', '978-85-0000-000-3', 'Editora A', 1881, 'Romance', 'Disponível'),
('Vidas Secas', 'Graciliano Ramos', '978-85-0000-000-4', 'Editora C', 1938, 'Romance', 'Disponível'),
('Grande Sertão: Veredas', 'Guimarães Rosa', '978-85-0000-000-5', 'Editora D', 1956, 'Romance', 'Disponível');

-- Inserindo Empréstimos (Inicialmente vazia, mas podemos simular alguns)
INSERT INTO emprestimo (id_usuario, id_livro, data_emprestimo, data_devolucao_prevista, renovacoes)
VALUES
(1, 2, '2023-09-01', '2023-09-08', 0),
(2, 3, '2023-09-03', '2023-09-18', 0); -- Professor com prazo maior

-- Atualizando disponibilidade dos livros emprestados
UPDATE livro SET disponibilidade = 'Emprestado' WHERE id IN (2, 3);

-- Inserindo Multas (Exemplo de multa gerada)
INSERT INTO multa (id_usuario, id_emprestimo, valor, data_geracao, paga)
VALUES
(1, 1, 5.00, '2023-09-15', 'Não'); -- Multa por atraso

-- Inserindo Reservas (Opcional)
INSERT INTO reserva (id_usuario, id_livro, data_reserva, data_expiracao)
VALUES
(3, 2, '2023-09-05', '2023-09-07');

-- Inserindo Logins (Se houver autenticação)
INSERT INTO login (id_usuario, username, senha, nivel_acesso)
VALUES
(1, 'mariasilva', 'senha_segura_maria', 'Bibliotecario'),
(2, 'joaosouza', 'senha_segura_joao', 'Administrador');
