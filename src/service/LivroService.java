package service;

import dao.LivroDAO;
import modelo.Livro;

public class LivroService {
    LivroDAO livroDAO;

    public LivroService(){
        this.livroDAO = new LivroDAO();
    }
    
    public void cadastrarLivro(Livro livro){
        livroDAO.cadastrarLivro(livro);
    }
}
