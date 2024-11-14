package Principal;

import dao.LivroDAO;

public class Main {

    public static void main(String[] args) {
        LivroDAO livroDAO = new LivroDAO();

        livroDAO.consultarLivro(1);
        
    }

}
