package com.example.noticeboard.service;

import io.jsonwebtoken.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.nio.charset.StandardCharsets;
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
            .claim("uid",username)
            .setIssuedAt(new Date(currentTimeMillis))
            .setExpiration(new Date(currentTimeMillis + EXPIRATION_TIME))
            .signWith(SignatureAlgorithm.HS256,secretKey.getBytes());

    return builder.compact();
  }

  public String getTokenPayloads(String token) {
    Map<String, Object> claims = new HashMap<>();
    try {
      claims = Jwts.parser()
              .setSigningKey(secretKey.getBytes(StandardCharsets.UTF_8))
              .parseClaimsJws(token)
              .getBody();
      return claims.get("uid").toString();
    }
    catch (ExpiredJwtException e) {
      claims.put("invalid-token","Validity period is expired");
    }
    catch (Exception e) {
      claims.put("invalid-token","Token is not valid");
    }
    return claims.get("invalid-token").toString();
  }

  public boolean verifyToken(String token) {
    long currentTimeMillis = System.currentTimeMillis();
    try {
      Jws<Claims> claims = Jwts.parser()
              .setSigningKey(secretKey.getBytes("UTF-8"))
              .parseClaimsJws(token);
      return !claims.getBody().getExpiration().before(new Date(0));
    }
    catch (Exception e) {
      return false;
    }
  }

  public String getToken(HttpServletRequest request, String cookieName) {
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

  public void removeToken(HttpServletRequest request, HttpServletResponse response) {
    Cookie cookie = new Cookie("User-Token","");
    request.getSession().removeAttribute("UserId");
    cookie.setPath("/");
    cookie.setMaxAge(0);
    response.addCookie(cookie);
  }
}
