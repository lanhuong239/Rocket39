public class Sach extends TaiLieu{
    String tenTacGia;
    int soTrang;

    public Sach(int maTaiLieu, String nhaXuatBan, int soBanPhatHanh, String tenTacGia, int soTrang) {
        super(maTaiLieu, nhaXuatBan, soBanPhatHanh);
        this.tenTacGia = tenTacGia;
        this.soTrang = soTrang;
    }
}
