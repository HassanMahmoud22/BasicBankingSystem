package com.example.basicbankingsystem.Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import com.example.basicbankingsystem.Customer.Customer;
import org.json.JSONArray;
import org.json.JSONObject;

public interface DataBaseConnect {
    default Connection establish_connection() throws SQLException, ClassNotFoundException {
        String url="jdbc:mysql://localhost:3306/BankSystem";
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection= DriverManager.getConnection(url,"root","root");
        return connection;
    }
    ArrayList<Customer> listAll() throws SQLException, ClassNotFoundException;
    void Transfer(JSONObject transaction) throws SQLException, ClassNotFoundException;
    void updateBalance(JSONObject transaction) throws SQLException, ClassNotFoundException;
    public JSONArray listAllTransfers() throws SQLException, ClassNotFoundException;
}
