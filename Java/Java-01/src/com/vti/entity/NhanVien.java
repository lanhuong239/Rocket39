package com.vti.entity;

public class NhanVien extends CanBo{
    private String congViec;
    public NhanVien(String name, int age, Gender gender, String address, String congViec){
        super(name, age, gender, address);
        this.congViec = congViec;
    }

    public String toString(){
        return super.toString() + "Chuc vu: Nhan vien, cong viec la: " + congViec;
    }
}
