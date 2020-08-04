package com.edu118.entity;

import java.io.Serializable;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class Level implements Serializable {
    private static final long serialVersionUID=1L;
    private String lid;
    private String title;
    private Integer level;
}