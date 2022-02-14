<%@ page import="org.json.JSONArray" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <%
    com.example.basicbanksystemclient.HelloServlet srv1 = new com.example.basicbanksystemclient.HelloServlet();
    JSONArray jsonData = srv1.getAllCustomers();
    %>
    <head>
        <title>Transfer Money</title>
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
                    <%String hiddenSender = "<input type=\"hidden\" value=\"" + request.getParameter("selected") + "\" name = \"sender\">";
                    for(int i = 0; i < jsonData.length(); i++)
                    {
                        String form = "<button class=\"collapsible\" onclick=\"collabse()\"><p id=\"boldInline\">ID: </p>"+jsonData.getJSONObject(i).getInt("id")+"  " +"<p id=\"boldInline\">Name: </p>"+ jsonData.getJSONObject(i).getString("name") +"</button>";
                        String hiddenReceiver ="<input type=\"hidden\" value=\"" + jsonData.getJSONObject(i).getInt("id") + "\" name = \"receiver\">";
                        String transferForm =  "<button style=\"background-color: rgb(229 231 235); border-radius: 5px; color(32,33,49); padding: 5px 15px; " +
                                    "cursor: pointer; \"id = \"transfer"+i+"\" onclick=\"showForm("+i+")\">Transfer</button>\n<br>" +
                                    "               <form action=\"Transfers\" method=\"post\" id=\"formElement"+i+"\" style=\"display: none;\">\n" +
                                    "               <br><p id=\"boldMe\">Enter the amount</p><input type=\"number\" name=\"amount\" required> " +
                                    "               <input type=\"submit\" value=\"submit\">" + hiddenSender + hiddenReceiver +
                                    "               </form>" ;
                        out.println(form);%>
                        <div class="content">
                            <br><p id="boldMe">Email: </p><p><%out.println(jsonData.getJSONObject(i).getString("email"));%></p><br>
                            <p id="boldMe">Balance: </p><p><%out.println(jsonData.getJSONObject(i).getInt("balance"));%>$</p><br>
                            <p id="boldMe">Phone Number: </p><p><%out.println(jsonData.getJSONObject(i).getString("phone_number"));%></p><br>
                            <%out.println(transferForm);%><br>
                        </div>

                    <%}%>
                </div>
            </div>
            <div class="footer">
                <%@include file="footer.html"%>
            </div>
        </div>
    </body>
</html>
