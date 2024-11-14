package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import modelo.Livro;
import utils.ConexaoBD;

public class LivroDao {

    /*
     * C - create - cadastrar
     * R - read
     * U - update
     * D - delete
     */
    public void cadastrarLivro(Livro livro){
        String query = "INSERT INTO livro (titulo, autor, "+
        "isbn,ano_publicacao,disponibilidade)"+
        "values (?, ?, ?,?,?)";
        try {
            Connection conn = ConexaoBD.getConnection(); 
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, livro.getTitulo());
            stmt.setString(2, livro.getAutor());
            stmt.setString(3, livro.getISBN());
            stmt.setInt(4, livro.getAnoPublicacao());
            stmt.setInt(5, livro.getDisponibilidade());
            stmt.executeUpdate();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
    public Livro consultarLivro(int id){
        String query = "SELECT * FROM livro WHERE id = ?";
        Livro livro =null;
        try{
            Connection conn = ConexaoBD.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                livro =new Livro();
                livro.setId(rs.getInt("id"));
                livro.setAutor(rs.getString("autor"));
                livro.setTitulo(rs.getString("titulo"));
                livro.setISBN(rs.getString("isbn"));
                livro.setAnoPublicacao(rs.getInt("ano_publicacao"));
                livro.setDisponibilidade(rs.getInt("disponibilidade"));

            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return livro;
    }
    public void atualizarLivro(Livro livro){
        String query = "UPDATE  livro SET titulo = ?, autor = ?, isbn = ?,"+
        "ano_publicacao = ?, disponibilidade = ? where id = ?";
        try {
            Connection conn = ConexaoBD.getConnection(); 
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, livro.getTitulo());
            stmt.setString(2, livro.getAutor());
            stmt.setString(3, livro.getISBN());
            stmt.setInt(4, livro.getAnoPublicacao());
            stmt.setInt(5, livro.getDisponibilidade());
            stmt.setInt(6, livro.getId());
            stmt.executeUpdate();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }

    public void removerLivro(int id){
    	String query = "DELETE FROM livro WHERE id = ?";
    	try {
    		Connection conn = ConexaoBD.getConnection();
    		PreparedStatement stmt = conn.prepareStatement(query);
    		stmt.setInt(1, id);
    		stmt.executeUpdate();
    	}
    	catch(SQLException e) {
    		e.printStackTrace();
    	}
    }
    
}

