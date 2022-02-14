package com.example.basicbankingsystem.Customer;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import java.sql.SQLException;
import java.util.ArrayList;
@Service
public interface CustomerService {
    ArrayList<Customer> viewAllCustomers() throws SQLException, ClassNotFoundException;
    void Transfer(@RequestBody String transaction) throws SQLException, ClassNotFoundException;
    public String viewAllTransfers() throws SQLException, ClassNotFoundException;
}
