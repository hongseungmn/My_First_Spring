package com.example.noticeboard.controller;

import com.example.noticeboard.dto.ObjectDetectDTO;
import com.example.noticeboard.service.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.DefaultResponseErrorHandler;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@RestControllerAdvice
@RestController
public class RestAPIController {
  @Autowired
  private RestTemplate restTemplate;



  @CrossOrigin
  @PostMapping(value = "/files",consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
  public ResponseEntity<Map> upload(HttpServletRequest request, @RequestPart List<MultipartFile> files) throws IOException {
    String path = request.getServletContext().getRealPath("/upload");
    for(MultipartFile muFile : files) {
      String newFileName = FileUtils.getNewFileName(path, muFile.getOriginalFilename());
      File file = new File(path+File.separator+newFileName);
      muFile.transferTo(file);
    }
    Map map = new HashMap<>();
    map.put("success", true);
    return ResponseEntity.ok().header("Content-Type","application/json;charset=UTF-8").body(map);
  }
  @ExceptionHandler({Exception.class})
  public ResponseEntity<String> error() {
    return ResponseEntity
            .status(HttpStatus.INTERNAL_SERVER_ERROR)
            .header("Content-Type","text/plain;charset=UTF-8")
            .body("업로드 최대 용량 초과");
  }

  @CrossOrigin
  @PostMapping("/vision/ocr")
  public Map ocr(@RequestParam String base64) {
    restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
    restTemplate.setErrorHandler(new DefaultResponseErrorHandler() {
      @Override
      public boolean hasError(ClientHttpResponse response) throws IOException {
        HttpStatus status = response.getStatusCode();
        return status.series() == HttpStatus.Series.SERVER_ERROR;
      }
    });

    HttpHeaders headers = new HttpHeaders();
    headers.add("Authorization", "Bearer ya29.a0AbVbY6PXY1RYxS0AVtEpXaOOmBewCwtvDkweW5s3Cxa-bxMcbD2JM5e6RGrVinQDZIxwxB8WPX2w7h4UjZ98eObeL2lFQ04Y3U08eYNzaZLZZ2uxyJz1jBctvTfNTcsdc3SH5lF_GjZUwyqYzYosXdjQQ7AN3Yx4DO7pTUlF8qg1gn1zCGbApNxdGsfMXtJwPiGtpvqMJT2c_zxWsoHZ21qnSoVVdk1t1IdvLeZhA6ftd-kjuduHCQx_lMWpqPv3X9lsxzed6urVFNwiBZZpN92SjRFGfn_qQd4J4KdcjeE-decBqykYcP6i_gFiAaGkRR2lBks_PEj0ws1El7MgBPtTipULXDG_THFGq6OQyq6fEquKbmmDqFDmJlDftQcfVwNYI73zsTmIgVVW-2wf5iE1LpkaCgYKAZgSARASFQFWKvPlDQ2nBQ9Q57HV0LNXemuwvA0418");
    headers.add("x-goog-user-project", "sonic-trail-391102");
    headers.add("Content-Type", "application/json;charset=utf-8");
    headers.add("Accept-Language","ko-KR");


    Map<String, List> requestBody = new HashMap<>();
    List value = new Vector<>();

    Map map = new HashMap<>();
    Map imageValue = new HashMap<>();
    imageValue.put("content", base64);
    map.put("image", imageValue);

    List featureValue = new Vector<>();
    Map featureMap = new HashMap<>();
    featureMap.put("type", "TEXT_DETECTION");
    featureValue.add(featureMap);

    map.put("features", featureValue);
    value.add(map);
    requestBody.put("requests",value);

    HttpEntity entity = new HttpEntity(requestBody,headers);

    String url = "https://vision.googleapis.com/v1/images:annotate";

    //외부 OPEN API(구글) 서버로부터 받은 데이터 타입이 {} 인 경우 Map 혹은 DTO, [{},{},{},..]인 경우 List<Map 혹은 DTO>

    ResponseEntity<Map> responseEntity = restTemplate.exchange(
            url,//요청 URL
            HttpMethod.POST, //요청 메소드
            entity,//HttpEntity(요청 바디와 요청 헤더
            Map.class //응답 데이터가 {} 일 때
    );
    System.out.println("응답 코드 : " + responseEntity.getStatusCodeValue());
    System.out.println("응답 헤더 : " + responseEntity.getHeaders());
    System.out.println("응답 바디 : " + responseEntity.getBody());

    return responseEntity.getBody();
  }
}
