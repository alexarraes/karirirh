package br.com.karirirh.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 * 
 * @author Alex Jr Arraes
 *
 */
public class Conexao {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			// Colocar o nome do banco não o da conexao
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/banco", "root",
					"dudu1991");

		} catch (SQLException e) {
			System.out.println("Erro - Não pode Conectar - " + e.getMessage());
		} catch (ClassNotFoundException e) {
			System.out.println("Erro - Não encontra o Driver - "
					+ e.getMessage());
		}
		return con;
	}
}

