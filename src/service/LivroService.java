package service;

import dao.LivroDao;
import modelo.Livro;

public class LivroService {
    LivroDao livroDao;

    public LivroService(){
    	
    	
        this.livroDao = new LivroDao();
    }
    
    public Livro cosultarLivro(int id) {
    	System.out.println("Estamos consultando! Aguarde!!!");
    	Livro livro = livroDao.consultarLivro(id);
    	return livro;
    }
    
    public void cadastrarLivro(Livro livro){
    	if(livro.getTitulo().length()>0) {
    		livroDao.cadastrarLivro(livro);
    		System.out.println("Cadastro realizado com sucesso!!");
    	}
    	else {
    		System.out.println("Precisa preencher o titulo");
    	}
    }
}
