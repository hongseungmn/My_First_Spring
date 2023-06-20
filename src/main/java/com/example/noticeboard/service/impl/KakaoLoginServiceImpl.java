package com.example.noticeboard.service.impl;

import com.example.noticeboard.service.KakaoLoginService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

@Service
public class KakaoLoginServiceImpl implements KakaoLoginService {
  @Override
  public String getAccessToken(String authorize_code) throws Exception {
    String access_Token="";
    String refresh_Token="";
    String reqURL = "https://kauth.kakao.com/oauth/token";

    try {
      URL url = new URL(reqURL);

      HttpURLConnection conn = (HttpURLConnection)url.openConnection();
      conn.setRequestMethod("POST");
      //POST 요청을 위해서 필요
      conn.setDoOutput(true);

      BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
      StringBuilder sb = new StringBuilder();
      sb.append("grant_type=authorization_code")
              .append("&client_id=")
              .append("d7d2c3ee3262ea4ef749ce998fd7bea6")
              .append("&redirect_uri=")
              .append("http://127.0.0.1:9090/kakaoLogin.do")
              .append("&code=")
              .append(authorize_code);
      bw.write(sb.toString());
      bw.flush();

      //200OK
      int respCode = conn.getResponseCode();
      System.out.println("respCode : "+respCode);

      //JSON 메세지
      BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
      String line = "";
      StringBuilder result = new StringBuilder();

      while((line = br.readLine()) != null) {
        result.append(line);
      }
      System.out.println("response body : "+result.toString());

      //jackson objectMapper 생성
      ObjectMapper objectMapper = new ObjectMapper();
      //Json String -> Map
      Map<String, Object> jsonMap = objectMapper
              .readValue(result.toString(), new TypeReference<Map<String, Object>>() {});

      access_Token = jsonMap.get("access_token").toString();
      refresh_Token = jsonMap.get("refresh_token").toString();

      System.out.println("access_token : "+ access_Token);
      System.out.println("refresh_token : "+ refresh_Token);


      br.close();
      bw.close();
    } catch (IOException e) {
      e.printStackTrace();
    }
    return access_Token;
  }

  @Override
  public HashMap<String, Object> getUserInfo(String access_token) {

    HashMap<String, Object> userInfo = new HashMap<String, Object>();
    String reqURL = "https://kapi.kakao.com/v2/user/me";

    try {
      URL url = new URL(reqURL);
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setRequestMethod("GET");

      //요청에 필요한 Header에 포함될 내용
      conn.setRequestProperty("Authorization", "Bearer " + access_token);
      int responseCode = conn.getResponseCode();
      System.out.println("responseCode : "+ responseCode);
      System.out.println("getErrorStream : "+conn.getErrorStream());
      BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
      String line = "";
      StringBuilder result = new StringBuilder();
      while ((line = br.readLine()) != null) {
        result.append(line);
      }
      System.out.println("response body : " + result);
      System.out.println("result type" +result.getClass().getName());
      try {
        // jackson objectmapper 객체 생성
        ObjectMapper objectMapper = new ObjectMapper();
        // JSON String -> Map
        Map<String, Object> jsonMap = objectMapper.readValue(result.toString(), new TypeReference<Map<String, Object>>() {
        });

        System.out.println(jsonMap.get("properties"));

        Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
        Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");

        String nickname = properties.get("nickname").toString();
        String email = kakao_account.get("email").toString();
        userInfo.put("nickname", nickname);
        userInfo.put("email", email);
      } catch (Exception e) {
        e.printStackTrace();
      }
    } catch (IOException e) {
      e.printStackTrace();
    }
    return userInfo;
  }
}
