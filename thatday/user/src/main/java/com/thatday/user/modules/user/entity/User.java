package com.thatday.user.modules.user.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

/**
 * 用户表
 */
@Data
@Entity(name = "td_user")
public class User {

    @Id
    private String id;

    @NotNull
    private String nickname;



}
