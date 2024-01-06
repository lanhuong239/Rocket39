import java.util.Date;

public class Bao extends TaiLieu{
    Date ngayPhatHanh;

    public Bao(int maTaiLieu, String nhaXuatBan, int soBanPhatHanh, Date ngayPhatHanh) {
        super(maTaiLieu, nhaXuatBan, soBanPhatHanh);
        this.ngayPhatHanh = ngayPhatHanh;
    }
}
