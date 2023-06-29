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
  @PostMapping("/vision/object-detect")
  public Map objectDetect(@RequestBody Map paramMap) {
    //401 : 인증 오류시 아래 에러 핸들러 추가
    restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
    restTemplate.setErrorHandler(new DefaultResponseErrorHandler() {
      @Override
      public boolean hasError(ClientHttpResponse response) throws IOException {
        HttpStatus status = response.getStatusCode();
        return status.series() == HttpStatus.Series.SERVER_ERROR;
      }
    });
    HttpHeaders headers = new HttpHeaders();
    headers.add("Authorization", "Bearer ya29.a0AWY7Ckl71XQTJ_oIqUmvF8z98MuNEmSBni3fTo-Ai3uulq65qdb_YvD62ekAm5fZG_toRYvXABt7XJ9th0vcLo4NcFVQBerB4aSf0WtS5PUSCAvLOMek1L3Q_0wF1rYaO1lBpUucrU7VLfkcH6TD_YZIBSQTtG1wZdK4x6TWHPLAPMJsJAfqiAgceaW0haCXhDknbRn_ikA7RiGQvRFiV0sQkhKuuiGFqJF6Qr3YjVCSHkiHem9LT4rYQRbp09F6LAmSLAIudQhSmuRT7vM3VwbhLXSOxutrQL0MinaccD53zm-wD_eznpzMJUzHiljNSECQBpOmWUkR-zhuElvAOPxc_Drw6I8RzUoG-MjzkwsnHkTVebr9_9tRzpfcZLgHAYlCHtmA4vDykZp7fyK7R3XxQ44aCgYKAeQSARASFQG1tDrpGA7Nd6QJ-iyXPQ9IlUCEjA0418");
    headers.add("x-goog-user-project", "sonic-trail-391102");
    headers.add("Content-Type", "application/json;charset=utf-8");
    headers.add("Accept-Language","ko-KR");

    ObjectDetectDTO requestBody = new ObjectDetectDTO();
    ObjectDetectDTO.Source source = new ObjectDetectDTO.Source();

    source.setImageUri(paramMap.get("url").toString());

    ObjectDetectDTO.Image image = new ObjectDetectDTO.Image();
    image.setSource(source);


    ObjectDetectDTO.Feature feature = new ObjectDetectDTO.Feature();
    feature.setMaxResults(20);
    feature.setType(paramMap.get("type").toString());

    ObjectDetectDTO.Request request = new ObjectDetectDTO.Request();


    ObjectDetectDTO.ImageContext imageContext  = new ObjectDetectDTO.ImageContext();
    imageContext.setLanguageHints(Arrays.asList("ko"));
    request.setImage(image);
    request.setImageContext(imageContext);
    request.setFeatures(Arrays.asList(feature));
    requestBody.setRequests(Arrays.asList(request));
    HttpEntity entity = new HttpEntity(requestBody,headers);
    String url = "https://vision.googleapis.com/v1/images:annotate";

    ResponseEntity<Map> responseEntity = restTemplate.exchange(
            url,//요청 URL
            HttpMethod.POST, //요청 메소드
            entity,//HttpEntity(요청 바디와 요청 헤더
            Map.class

    );
    System.out.println("응답 코드 : " + responseEntity.getStatusCodeValue());
    System.out.println("응답 헤더 : " + responseEntity.getHeaders());
    System.out.println("응답 바디 : " + responseEntity.getBody());

    return responseEntity.getBody();
  }

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
    headers.add("Authorization", "Bearer ya29.a0AbVbY6O1k4KH1yg2s2ykHCB5ft9AjRt_vykSPHMWOTtGsOk2zwJ_IrF_PZLXtZAwTLrfP6azmfULVClNqh0aG8lQsCvzerukIWfXzQ3XPttqUXvZF7_jSuf6FFGkvMjr0MGCz9PaHUlBpY8fcZtYayjf4WqmBaEdgYtdL4BtXLR9PYSRyACimli9opsQiHGgAgqqhzAnK5NXZXtMqWSaMCEE45l55nMYNH7AWd3CezHtOS87Ff_1FVcCpaDVzhVCcr3-M3B1Mhw0TPpKmH8QK8LwlRqbI53vpy4GCVvjuXtSYRPSN9W5KHlNkmnTUgObpMGY765DqL4Kj_hA2IDXVdYroMW6kUpDjcE0XlLs0tDvuXGKcJelY-At39owb2wXCPsqrWChMdCnH3lxiYfkcoO9tAaCgYKAV4SARASFQFWKvPlO9XGUrKts_BnXmLu5a9gGA0417");
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
