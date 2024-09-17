import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Client extends Person {
    private String phone;
    private HashSet<Enterprise> isClientof = new HashSet<Enterprise>();

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) throws IllegalArgumentException{
        String patronPhone = "^((\\+|00)\\d{2,3})?\\d{9}$";
        Pattern pattern = Pattern.compile(patronPhone);
        Matcher matcher = pattern.matcher(phone);

        // Verificar si el valor coincide con el patrón
        if (matcher.matches()) {
            this.phone = phone;
        } else {
            throw new IllegalArgumentException(PHONE_NO_VALID);
        }
    }
}
