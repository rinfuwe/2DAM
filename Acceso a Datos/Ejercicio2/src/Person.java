import java.time.LocalDate;
import java.time.Period;

public class Person {
    public static final String BIRTHDAY_NO_VALID = "Birthday no valid";
    public static final String PHONE_NO_VALID = "Phone no valid";
    public static final String SALARY_NO_VALID = "Salary no valid";

    private String name;
    private LocalDate birthday;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) throws IllegalArgumentException{
        if (birthday.equals(LocalDate.now()))
            throw new IllegalArgumentException(BIRTHDAY_NO_VALID);
        this.birthday = birthday;
    }
    public int Age() {
        LocalDate today = LocalDate.now();
        int year = today.getYear() - birthday.getYear();
        return Math.abs(year);
    }
}
