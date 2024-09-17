import java.util.ArrayList;

public class Students {
    private ArrayList<Student> listStudent;

    public void add(Student student)
    {
        listStudent.add(student);
    }

    public Student Average(int num)
    {
        if (num >= 0 && num <= listStudent.size())
        {
            return listStudent.get(num);
        }
        return null;
    }

    public float getAverage()
    {
            if (listStudent.size() == 0)
                return 0;
            else
            {
                float average = 0;
                for (int i = 0; i < listStudent.size(); i++)
                {
                    average += listStudent.get(i).getMark();
                }
                return (average / listStudent.size());
            }
    }
}