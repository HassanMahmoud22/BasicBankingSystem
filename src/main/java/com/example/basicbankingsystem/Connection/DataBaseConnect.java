package com.example.basicbankingsystem.Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import com.example.basicbankingsystem.Customer.Customer;
import org.json.JSONArray;
import org.json.JSONObject;

public interface DataBaseConnect {
    Customer customer = new Customer();
    default Connection establish_connection() throws SQLException, ClassNotFoundException {
        String url="jdbc:mysql://b15ac2a343b8b9:35b36f26@eu-cdbr-west-02.cleardb.net/heroku_9bd1e1239aac862?reconnect=true";
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection= DriverManager.getConnection(url,"b15ac2a343b8b9","35b36f26");
        return connection;
    }
    ArrayList<Customer> listAll() throws SQLException, ClassNotFoundException;
    void Transfer(JSONObject transaction) throws SQLException, ClassNotFoundException;
    void updateBalance(JSONObject transaction) throws SQLException, ClassNotFoundException;
    public JSONArray listAllTransfers() throws SQLException, ClassNotFoundException;
}
