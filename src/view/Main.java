package view;


import modelo.Livro;
import service.LivroService;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		LivroService lservice = new LivroService();
		Livro livro = lservice.cosultarLivro(1);
		
		System.out.println("Livro:"+livro.getTitulo());
		
		Livro livro2 = new Livro();
		
		livro2.setTitulo("Aventuras em Java no mundo da Turma do de Tads");
		//livro2.setTitulo("");
		livro2.setAutor("A Classe");
		livro2.setISBN("000-0000-00001");
		livro2.setAnoPublicacao(2024);
		livro2.setDisponibilidade(0);
		
		lservice.cadastrarLivro(livro2);
		

	}

}
