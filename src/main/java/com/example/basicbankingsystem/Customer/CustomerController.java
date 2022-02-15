package com.example.basicbankingsystem.Customer;
import com.example.basicbankingsystem.Connection.CustomersDataBase;
import com.example.basicbankingsystem.Connection.DataBaseConnect;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;

import java.util.ArrayList;

@RequestMapping("/api/customer")
@RestController
public class CustomerController implements CustomerService{
    DataBaseConnect dataBase = new CustomersDataBase();

    @Autowired
    public CustomerController(){}

    @RequestMapping("viewAllCustomers")
    @Override
    @GetMapping
    public ArrayList<Customer> viewAllCustomers() throws SQLException, ClassNotFoundException {
        return dataBase.listAll();
    }

    @RequestMapping("Transfer")
    @Override
    @PostMapping
    public void Transfer(@RequestBody String transaction) throws SQLException, ClassNotFoundException {
        JSONObject object = new JSONObject(transaction);
        dataBase.updateBalance(object);
        dataBase.Transfer(object);
    }

    @RequestMapping("viewAllTransfers")
    @Override
    @GetMapping
    public String viewAllTransfers() throws SQLException, ClassNotFoundException {
        return dataBase.listAllTransfers().toString();
    }
}
