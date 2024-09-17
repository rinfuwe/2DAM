import java.util.HashSet;

public class Executive extends Employe{
    private String category;
    private HashSet<Employe> supervises = new HashSet<Employe>();


    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    public int subordinates(){
        return supervises.size();
    }

}
