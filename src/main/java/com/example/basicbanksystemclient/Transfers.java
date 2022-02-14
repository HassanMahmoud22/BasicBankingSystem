package com.example.basicbanksystemclient;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Transfers", value = "/Transfers")
public class Transfers extends HttpServlet {
    HelloServlet obj = new HelloServlet();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sender= request.getParameter("sender");
        String receiver= request.getParameter("receiver");
        String amount= request.getParameter("amount");
        obj.transfer(sender,receiver,amount);
        response.sendRedirect(request.getContextPath() + "/viewTransfers.jsp");
    }
}
