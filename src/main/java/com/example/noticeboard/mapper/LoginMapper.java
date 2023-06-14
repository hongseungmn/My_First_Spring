package com.example.noticeboard.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface LoginMapper {

  boolean findByIdAndPassword(Map map);
}
