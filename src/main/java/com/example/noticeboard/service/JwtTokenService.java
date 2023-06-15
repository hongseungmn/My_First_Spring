package com.example.noticeboard.service;

import io.jsonwebtoken.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


@Component
public class JwtTokenService {

  @Value("${jwt.password}")
  private String secretKey;
  private static final long EXPIRATION_TIME= 60 * 60 * 1000;
  public String createToken(String username) {
    long currentTimeMillis = System.currentTimeMillis();
    Map<String, Object> headers = new HashMap<>();
    headers.put("typ","JWT");
    headers.put("alg","HS256");

    JwtBuilder builder = Jwts.builder()
            .setHeader(headers)
            .setSubject(username)
            .setIssuedAt(new Date(currentTimeMillis))
            .setExpiration(new Date())
            .signWith(SignatureAlgorithm.HS256,secretKey.getBytes());

    return builder.compact();
  }

  public Map<String,Object> getTokenPayloads(String token, String keyPath,String key) {
    Map<String, Object> claims = new HashMap<>();
    try {
      claims = Jwts.parser()
              .setSigningKey(secretKey.getBytes("UTF-8"))
              .parseClaimsJws(token)
              .getBody();
      return claims;
    }
    catch (ExpiredJwtException e) {
      claims.put("invalid-token","Validity period is expired");
    }
    catch (Exception e) {
      claims.put("invalid-token","Token is not valid");
    }
    return claims;
  }

  public boolean verifyToken(String token,String keyPath,String key) {
    try {
      Jws<Claims> claims = Jwts.parser()
              .setSigningKey(secretKey.getBytes("UTF-8"))
              .parseClaimsJws(token);
      return !claims.getBody().getExpiration().before(new Date(EXPIRATION_TIME));
    }
    catch (Exception e) {
      return false;
    }
  }

  public static String getToken(HttpServletRequest request, String cookieName) {
    Cookie[] cookies = request.getCookies();
    String token = "";
    if(cookies != null) {
      for(Cookie cookie : cookies) {
        if(cookie.getName().equals(cookieName)) {
          token = cookie.getValue();
        }
      }
    }
    return token;
  }

  public static void removeToken(HttpServletRequest request, HttpServletResponse response) {
    Cookie cookie = new Cookie(request.getServletContext().getInitParameter("COOKIE-NAME"),"");
    cookie.setPath(request.getContextPath());
    cookie.setMaxAge(0);
    response.addCookie(cookie);
  }
}
