import java.io.FileInputStream;
import java.io.*;
import java.sql.*;
import java.util.Random;
import java.util.Scanner;
import java.util.Properties;

import oracle.jdbc.pool.OracleDataSource; //sterownik bazy danych Oracle

public class EmpApp {
	Connection conn; // obiekt Connection do nawiazania polaczenia z baza danych

	public static void main(String[] args) {
		EmpApp app = new EmpApp();

		try {
			app.setConnection(); // otwarcie polaczenia z BD
			//app.showEmployees(); // test polaczenia
			//app.showEmployeesByDepartment(); // wykonanie zapytania
			//app.updateSalary(); // obsluga transakcji
			//app.luckyEmployees();
			app.closeConnection();// zamkniecie polaczenia z BD
		} 
		catch (SQLException eSQL) {
			System.out.println("Blad przetwarzania SQL " + eSQL.getMessage());
		}
		catch (IOException eIO) {
			System.out.println("Nie mozna otworzyc pliku" );
		}
	}

	public void setConnection() throws SQLException, IOException { // metoda nawiazuje polaczenie
		
		Properties prop = new Properties();
		FileInputStream in = new FileInputStream("connection.properties"); // w pliku znajduja sie parametry polaczenia
		prop.load(in); // zaczytanie danych z pliku properties
		in.close(); // zamkniecie pliku

		String host = prop.getProperty("jdbc.host");
		String username = prop.getProperty("jdbc.username");
		String password = prop.getProperty("jdbc.password");
		String port = prop.getProperty("jdbc.port");
		String serviceName = prop.getProperty("jdbc.service.name");

		String connectionString = String.format(
									"jdbc:oracle:thin:%s/%s@//%s:%s/%s",
									username, password, host, port, serviceName);

		System.out.println (connectionString);
		OracleDataSource ods; // nowe zrodlo danych (klasa z drivera  Oracle)
		ods = new OracleDataSource();

		ods.setURL(connectionString);
		conn = ods.getConnection(); // nawiazujemy polaczenie z BD

		DatabaseMetaData meta = conn.getMetaData();

		System.out.println("Polaczenie do bazy danych nawiaane.");
		System.out.println("Baza danych:" + " " + meta.getDatabaseProductVersion());
	}

	public void closeConnection() throws SQLException { // zamkniecie polaczenia
		conn.close();
		System.out.println("Polaczenie z baza zamkniete poprawnie.");
	}

	public void showEmployees() throws SQLException {
		System.out.println("Lista pracowników:");

		Statement stat = conn.createStatement(); // Statement przechowujacy polecenie SQL

		// wydajemy zapytanie oraz zapisujemy rezultat w obiekcie typu ResultSet
		ResultSet rs = stat.executeQuery("SELECT name, surname FROM employees");

		System.out.println("---------------------------------");
		// iteracyjnie odczytujemy rezultaty zapytania
		while (rs.next())
			System.out.println(rs.getString(1) + " " + rs.getString(2));
		System.out.println("---------------------------------");

		rs.close();
		stat.close();
	}

	public void showEmployeesByDepartment() throws SQLException {
		System.out.println("Prepared statement:");

		// Zwoc uwage na znak zapytania w zapytaniu. W to miejsce zostanie
		// wstawiona wartosc wprowadzona przez uzytkownika
		PreparedStatement preparedStatement = conn
				.prepareStatement("SELECT name, surname FROM employees WHERE department_id = ?");

		System.out.println("Podaj Numer zakładu:");
		Scanner in = new Scanner(System.in);

		preparedStatement.setString(1, in.nextLine());
		ResultSet rs = preparedStatement.executeQuery(); // Wykonaj zapytanie oraz zapamietaj zbior rezultatow

		System.out.println("---------------------------------");
		while (rs.next()) {
			System.out.println(rs.getString(1) + " " + rs.getString(2));		}
		System.out.println("---------------------------------");

		rs.close();
		preparedStatement.close();
	}

	public void updateSalary() throws SQLException {
		System.out.println("Obsluga transakcji");

		try {
			conn.setAutoCommit(false);

			Statement stat = conn.createStatement();
			int rsInt = stat.executeUpdate("UPDATE employees SET salary = 4500 WHERE surname LIKE 'J%'");
			System.out.println("Liczba uaktualnionych wierszy: " + rsInt);
			
			rsInt = stat.executeUpdate("UPDATE employees SET salary = 4500 WHERE surname LIKE 'K%'");
			System.out.println("Liczba uaktualnionych wierszy: " + rsInt);

			conn.commit();
			stat.close();
		
		} catch (SQLException eSQL) {
			System.out.println("Transakcja wycofana");
			conn.rollback();
		}
	}

	public void luckyEmployees() throws SQLException {
		System.out.println("Dodatek stażowy");

		CallableStatement callFunction = conn.prepareCall("{? = call calculate_seniority_bonus(?)}");
		callFunction.registerOutParameter(1, Types.DOUBLE);

		Random ran = new Random();
		int min = 101;
		int max = 150;
		int numInterations = 5;

		for (int i = 0; i < numInterations; i++) {
			int id = ran.nextInt(max-min) + min;
			callFunction.setInt(2, id);
			callFunction.execute();
			double bonus = callFunction.getDouble(1);
			System.out.println("Pracownik " + id + " otrzymuje bonus " + bonus);
		}
		callFunction.close();
	}
}
