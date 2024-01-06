import java.util.ArrayList;
import java.util.List;

public class QuanLySach {

    List<TaiLieu> listTL = new ArrayList<>();
    public void addDoc(TaiLieu taiLieu){
        listTL.add(taiLieu);
    }

    public void deleteDoc(String maTaiLieu){
        for (TaiLieu taiLieu : listTL){
            if (taiLieu.maTaiLieu== Integer.parseInt(maTaiLieu)){
                listTL.remove(taiLieu);
                System.out.println("Remove done");
                return;
            }
        }
        System.out.println();

    }
}
