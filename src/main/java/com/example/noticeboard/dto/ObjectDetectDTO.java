package com.example.noticeboard.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

//구글의 객체 감지 요청 본문 (JSON형식)을 자바빈으로 변환
@Getter
@Setter
public class ObjectDetectDTO {
  private List<Request> requests;

  @Getter
  @Setter
  public static class Request{
    private Image image;
    private List<Feature> features;
    private ImageContext imageContext;
  }

  @Getter
  @Setter
  public static class Image {
    private Source source;
  }

  @Getter
  @Setter
  public static class Source {
    private String imageUri;
  }

  @Getter
  @Setter
  public static class Feature {
    private int maxResults;
    private String type;
  }

  @Getter
  @Setter
  //응답을 한글로 받기(디폴트는 영어)
  public static class ImageContext {
    private List<String> languageHints;
  }
}