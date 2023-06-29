package com.example.noticeboard.service.impl;

import com.example.noticeboard.service.NaverLoginService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Service
public class NaverLoginServiceImpl implements NaverLoginService {
  @Override
  public String getAccessToken(String code) throws UnsupportedEncodingException {
    String clientId = "GOd0HW6oGiOPdNnViMLz";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "a5c8Dae0oT";//애플리케이션 클라이언트 시크릿값";
    String redirectURI = URLEncoder.encode("http://127.0.0.1/naverLogin.do", "UTF-8");
    String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
            + "&client_id=" + clientId
            + "&client_secret=" + clientSecret
            + "&redirect_uri=" + redirectURI
            + "&code=" + code;
            //+ "&state=" + state;
    String accessToken = "";
    String refresh_token = "";
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      if (responseCode == 200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuilder result = new StringBuilder();
      while ((inputLine = br.readLine()) != null) {
        result.append(inputLine);
      }
      br.close();
      if (responseCode == 200) {
        System.out.println("response body : "+result.toString());
        //jackson objectMapper 생성
        ObjectMapper objectMapper = new ObjectMapper();
        //Json String -> Map
        Map<String, Object> jsonMap = objectMapper
                .readValue(result.toString(), new TypeReference<Map<String, Object>>() {});

        accessToken = jsonMap.get("access_token").toString();
        refresh_token = jsonMap.get("refresh_token").toString();

        System.out.println("access_token : "+ accessToken);
        System.out.println("refresh_token : "+ refresh_token);

        return accessToken;
      }
    } catch (Exception e) {
      // Exception 로깅
    }
    return null;
  }

  @Override
  public Map getUserInfo(String access_token) {
    HashMap<String, Object> userInfo = new HashMap<String, Object>();
    String reqURL = "https://openapi.naver.com/v1/nid/me";

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



        Map<String, Object> naver_account = (Map<String, Object>) jsonMap.get("response");

        String nickname = naver_account.get("nickname").toString();
        String email = naver_account.get("email").toString();
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
