import java.util.HashSet;

public class Enterprise {
    private String name;
    private HashSet<Employe> template = new HashSet<Employe>();
    private HashSet<Client> walletOfClients = new HashSet<Client>();


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTotalWalletOfClients() {
        return walletOfClients.size();
    }

    public int getTotalTemplate() {
        return template.size();
    }
}
