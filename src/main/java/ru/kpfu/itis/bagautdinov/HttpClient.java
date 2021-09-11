package ru.kpfu.itis.bagautdinov;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

public class HttpClient implements HttpClientInterface{

    public static void main(String[] args) {
        Map<String, String> hashMap1 = new HashMap<>();
        Map<String, String> hashMap2 = new HashMap<>();
        hashMap1.put("Content-Type","application/json");
//        hashMap1.put("Accept","application/json");
        hashMap2.put("x-forwarded-proto","https");
        hashMap2.put("x-forwarded","https");

        System.out.println(new HttpClient().get("https://postman-echo.com/get", hashMap1, hashMap2));
    }

    @Override
    public String get(String url, Map<String, String> headers, Map<String, String> params) {
        try {
            url += "?";
            for (Map.Entry<String,String> pair: params.entrySet()){
                url += pair.getKey()+"="+pair.getValue()+"&";
            }
            url = url.substring(0,url.length()-1);
            HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setRequestMethod("GET");
            for (Map.Entry<String,String> pair: headers.entrySet()){
                connection.setRequestProperty(pair.getKey(),pair.getValue());
            }

            try (BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(connection.getInputStream()))){
                StringBuilder content = new StringBuilder();
                String input;
                while ((input = bufferedReader.readLine()) != null) {
                    content.append(input);
                }
                connection.disconnect();
                return content.toString();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public String post(String url, Map<String, String> headers, Map<String, String> params) {
        try {
            HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setRequestMethod("POST");
            for (Map.Entry<String,String> pair: headers.entrySet()){
                connection.setRequestProperty(pair.getKey(),pair.getValue());
            }

//            try (final DataOutputStream outputStream = new DataOutputStream(connection.getOutputStream())){
//                int count = 0;
////                outputStream.writeBytes("{");
//                for (Map.Entry<String,String> pair: params.entrySet()){
//                    if(count < params.entrySet().size()-1) {
//                        outputStream.writeBytes(pair.getKey() + ":" + pair.getValue() +",");
//                    }else {
//                        outputStream.writeBytes(pair.getKey() + ":" + pair.getValue());
//                    }
//                    count++;
//                }
//
//            }
//
//            System.out.println("\"");
            String jsonInputString = "{";
            int count = 0;
            for (Map.Entry<String, String> pair : params.entrySet()) {
                if(count < params.entrySet().size()-1) {
                    jsonInputString += "\""+pair.getKey()+"\": "+"\""+pair.getValue()+"\",";
                }else{
                    jsonInputString += "\""+pair.getKey()+"\": "+"\""+pair.getValue()+"\"";
                }
                count++;
            }
            jsonInputString += "}";


            System.out.println(jsonInputString);

            connection.setDoOutput(true);
            try (OutputStream outputStream = connection.getOutputStream()) {
                byte[] input = jsonInputString.getBytes(StandardCharsets.UTF_8);
                outputStream.write(input, 0, input.length);
                System.out.println(outputStream);
            }

            System.out.println(connection.getResponseCode());

            try (BufferedReader reader =
                         new BufferedReader(
                                 new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8)
                         )
            ) {
                StringBuilder content = new StringBuilder();
                String input;
                while ((input = reader.readLine()) != null) {
                    content.append(input.trim());
                }
                connection.disconnect();
                return content.toString();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
}
