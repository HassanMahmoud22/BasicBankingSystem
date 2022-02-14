package com.example.basicbankingsystem.Connection;

import com.example.basicbankingsystem.Customer.Customer;
import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.*;
import java.util.ArrayList;

public class CustomersDataBase implements DataBaseConnect{

    @Override
    public ArrayList<Customer> listAll() throws SQLException, ClassNotFoundException {
        ArrayList<Customer> allCustomers = new ArrayList<>();
        Statement statement = establish_connection().createStatement();
        ResultSet rs = statement.executeQuery("select * from Customers");
        while(rs.next())
        {
            Customer customer = new Customer();
            customer.setId(rs.getInt("id"));
            customer.setName(rs.getString("Name"));
            customer.setEmail(rs.getString("Email"));
            customer.setPhone_number(rs.getString("phone_number"));
            customer.setBalance(rs.getDouble("current_balance"));
            allCustomers.add(customer);
        }
        return allCustomers;
    }

    @Override
    public JSONArray listAllTransfers() throws SQLException, ClassNotFoundException {
        JSONArray allTransactions = new JSONArray();
        Statement statement = establish_connection().createStatement();
        ResultSet rs = statement.executeQuery("select transfers.id as Transfer_Id, transfers.transfer_date, transfers.sender as Sender_Id, u1.name as Sender, transfers.receiver as Receiver_Id, u2.name as Receiver, transfers.amount as Amount\n" +
                "from transfers\n" +
                "inner join customers u1 on u1.id = transfers.sender\n" +
                "inner join customers u2 on u2.id = transfers.receiver\n" +
                "order by transfers.Transfer_Date ASC;");
        while(rs.next())
        {
            JSONObject transaction = new JSONObject();
            transaction.put("Transfer_Id", rs.getInt("Transfer_Id"));
            transaction.put("Transfer_Date", rs.getString("Transfer_Date"));
            transaction.put("Sender_Id", rs.getInt("Sender_Id"));
            transaction.put("Sender", rs.getString("Sender"));
            transaction.put("Receiver_Id", rs.getInt("Receiver_Id"));
            transaction.put("Receiver", rs.getString("Receiver"));
            transaction.put("Amount", rs.getInt("Amount"));
            allTransactions.put(transaction);
        }
        return allTransactions;
    }

    @Override
    public void Transfer(JSONObject transaction) throws SQLException, ClassNotFoundException {
        String query = " insert into Transfers (Sender, Receiver, Amount) values (?,?,?)";
        PreparedStatement preparedStmt = establish_connection().prepareStatement(query);
        preparedStmt.setInt (1, (Integer) transaction.get("Sender"));
        preparedStmt.setInt (2, (Integer) transaction.get("Receiver"));
        preparedStmt.setInt (3, (Integer) transaction.get("Amount"));
        preparedStmt.executeUpdate();
        establish_connection().close();
        System.out.println("Money Transfered Successfully");
    }

    @Override
    public void updateBalance(JSONObject transaction) throws SQLException, ClassNotFoundException {
        int sender = transaction.getInt("Sender");
        double amount = transaction.getDouble("Amount");
        double receiver = transaction.getInt("Receiver");
        String query = " update Customers SET current_balance = current_balance - '" +amount +"'WHERE id = "+sender+" ";
        PreparedStatement preparedStmt = establish_connection().prepareStatement(query);
        preparedStmt.executeUpdate();
        query = " update Customers SET current_balance = current_balance + '" +amount +"'WHERE id = "+receiver+" ";
        preparedStmt = establish_connection().prepareStatement(query);
        preparedStmt.executeUpdate();
        establish_connection().close();
        System.out.println("Balances are updated successfully");
    }
}
