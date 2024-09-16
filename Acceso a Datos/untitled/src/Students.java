import java.util.ArrayList;

public class Students {
    private ArrayList<Student> listStudent;

    public void add(Student student)
    {
        listStudent.add(student);
    }

    public Student Average(int num)
    {
        if (num >= 0 && num <= listStudent.stream().count())
        {
            return listStudent.get(num);
        }
        return null;
    }

    public float getAverage()
    {
            if (listStudent.stream().count() == 0)
                return 0;
            else
            {
                float average = 0;
                for (int i = 0; i < listStudent.stream().count(); i++)
                {
                    average += listStudent.get(i).getMark();
                }
                return (average / listStudent.stream().count());
            }
    }
}