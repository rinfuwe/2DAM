public class Employe extends Person{
    private Double grossSalary;

    public Double getGrossSalary() {
        return grossSalary;
    }

    public void setGrossSalary(Double grossSalary) {
        if (grossSalary < 0)
            throw new IllegalArgumentException(SALARY_NO_VALID);
        this.grossSalary = grossSalary;
    }
}
