package com.vti.entity;

public class KySu extends CanBo{
    private String nganhDaoTao;

    public KySu(String name, int age, Gender gender, String address, String nganhDaoTao){
        super(name, age, gender, address);
        this.nganhDaoTao = nganhDaoTao;
    }
    public String toString(){
        return super.toString() + "Chuc vu: Ky su, nganh dao tao: " + nganhDaoTao;
    }
}
