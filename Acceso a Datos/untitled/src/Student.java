public class Student {
    private String name;
    private Integer mark;

    public String getName() {
        return name;
    }

    public void setName(String nombre) {
        this.name = nombre;
    }

    public Integer getMark() {
        return mark;
    }

    public void setMark(Integer nota) {
        this.mark = nota;
    }

    public Boolean aproved(Integer mark) {
        if (mark >= 5)
            return true;
        else
            return false;
    }
}
