<%@ page import="org.json.JSONArray" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    com.example.basicbanksystemclient.HelloServlet srv1 = new com.example.basicbanksystemclient.HelloServlet();
    JSONArray jsonData = srv1.getAllCustomers();
%>
<head>
    <title>View All Customers</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="Styles/footerStyle.css">
    <link rel="stylesheet" href="Styles/viewStyle.css">
    <link rel="stylesheet" href="Styles/navBarStyle.css">

    <script type = "text/javascript" src="Scritpts/script.js"></script>
</head>
<body>
<div class="gridContainer">
    <div class="header">
        <%@ include file="navBar.html"%>
    </div>
    <div class="main">
        <div class="customers">
            <% for(int i = 0; i < jsonData.length(); i++)
            {

                String form = "<button class=\"collapsible\" onclick=\"collabse()\"> <p id=\"boldInline\">ID: </p>"+jsonData.getJSONObject(i).getInt("id") + "  " +"<p id=\"boldInline\">Name: </p>"+ jsonData.getJSONObject(i).getString("name") +"</button>";
                String hiddenButton = "<input type=\"hidden\" value=\"" + jsonData.getJSONObject(i).getInt("id") + "\" name = \"selected\">";%>
                <%out.println(form);%>
                <div class="content">
                    <br><form action="transferMoney.jsp" method="post" class="form">
                        <p id="boldMe">Email: </p><p><%out.println(jsonData.getJSONObject(i).getString("email"));%></p><br>
                        <p id="boldMe">Balance: </p><p><%out.println(jsonData.getJSONObject(i).getInt("balance"));%>$</p><br>
                        <p id="boldMe">Phone Number: </p><p><%out.println(jsonData.getJSONObject(i).getString("phone_number"));%></p><br>
                        <p><%out.println(hiddenButton);%></p>
                        <input type = submit value = "select and proceed">
                    </form>
                    <br>
                </div>
            <%}%>
        </div>
    </div>
    <div class="footer">
        <%@ include file="footer.html" %>
    </div>
</div>
</body>
</html>
