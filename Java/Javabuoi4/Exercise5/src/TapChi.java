import java.time.Month;
import java.util.Date;

public class TapChi extends TaiLieu{
    int soPhatHanh;
    Month thangPhatHanh;
    public TapChi(int maTaiLieu, String nhaXuatBan, int soBanPhatHanh, int soPhatHanh, Month thangPhatHanh) {
        super(maTaiLieu, nhaXuatBan, soBanPhatHanh);
        this.soPhatHanh = soPhatHanh;
        this.thangPhatHanh = thangPhatHanh;
    }
}
