package com.example.basicbanksystemclient;

import org.json.JSONArray;
import javax.ws.rs.ClientErrorException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class HelloServlet {

    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "https://task1-basicbankingsystem.herokuapp.com/api/customer";
    public HelloServlet() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
    }

    public JSONArray getAllCustomers() throws ClientErrorException {
        webTarget = client.target(BASE_URI).path("viewAllCustomers");
        JSONArray temp = new JSONArray(webTarget.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class));
        return temp;
    }

    public JSONArray getAllTransfers() throws ClientErrorException {
        webTarget = client.target(BASE_URI).path("viewAllTransfers");
        JSONArray temp = new JSONArray(webTarget.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(String.class));
        return temp;
    }

    public void transfer(String sender, String receiver, String amount) throws ClientErrorException {
        try {
            URL url = new URL("https://task1-basicbankingsystem.herokuapp.com/api/customer/Transfer");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setDoOutput(true);
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            String input = "{\"Sender\":"+sender+",\"Receiver\":"+receiver+",\"Amount\":"+amount+"}";
            OutputStream os = conn.getOutputStream();
            os.write(input.getBytes());
            os.flush();
            BufferedReader br = new BufferedReader(new InputStreamReader(
                    (conn.getInputStream())));
            conn.disconnect();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public void close() {
        client.close();
    }
}