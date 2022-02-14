<%@ page import="org.json.JSONArray" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    com.example.basicbanksystemclient.HelloServlet srv1 = new com.example.basicbanksystemclient.HelloServlet();
    JSONArray jsonData = srv1.getAllTransfers();
%>
<head>
    <title>View Transfers</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="Styles/footerStyle.css">
    <link rel="stylesheet" href="Styles/transferTableStyle.css">
    <link rel="stylesheet" href="Styles/navBarStyle.css">
</head>

<body>
<div class="gridContainer">
    <div class="header">
        <%@ include file="navBar.html"%>
    </div>
    <div class="main">
        <div class="table-wrapper">
            <table style="width:100%" class="fl-table">
                <thead>
                <tr>
                    <th>Transfer ID</th>
                    <th>Transfer Date</th>
                    <th>Sender ID</th>
                    <th>Sender Name</th>
                    <th>Receiver ID</th>
                    <th>Receiver Name</th>
                    <th>Amount Transfered</th>
                </tr>
                </thead>
                <%for(int i = 0; i < jsonData.length(); i++)
                { %>
                <tr>
                    <td><%out.println(jsonData.getJSONObject(i).getInt("Transfer_Id"));%></td>
                    <td><%out.println(jsonData.getJSONObject(i).getString("Transfer_Date"));%></td>
                    <td><%out.println(jsonData.getJSONObject(i).getInt("Sender_Id"));%></td>
                    <td><%out.println(jsonData.getJSONObject(i).getString("Sender"));%></td>
                    <td><%out.println(jsonData.getJSONObject(i).getInt("Receiver_Id"));%></td>
                    <td><%out.println(jsonData.getJSONObject(i).getString("Receiver"));%></td>
                    <td><%out.println(jsonData.getJSONObject(i).getInt("Amount"));%></td>
                </tr>
                <%}%>
            </table>
        </div>
    </div>
    <div class="footer">
        <%@include file="footer.html"%>
    </div>
</div>

</body>
</html>
