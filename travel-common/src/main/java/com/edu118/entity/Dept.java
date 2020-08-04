package com.edu118.entity;

import java.io.Serializable;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class Dept implements Serializable {
    private static final long serialVersionUID=1L;
    /**
     * 部门id
     */
    private Long did;
    /**
     * 部门名称
     */
    private String dname;
    /**
     * 部门领导
     */
    private String eid;
}