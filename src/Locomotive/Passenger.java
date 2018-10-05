package Locomotive;

public class Passenger implements Comparable<Passenger>
{
	private String name;
	private int age;
	private String gender;
	
	public Passenger(String name, int age, String gender)
	{
		super();
		this.name = name;
		this.age = age;
		this.gender = gender;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public int getAge()
	{
		return age;
	}

	public void setAge(int age)
	{
		this.age = age;
	}

	public String getGender()
	{
		return gender;
	}

	public void setGender(String gender)
	{
		this.gender = gender;
	}
	
	public int compareTo(Passenger age)
	{
		if (age.getAge() > this.getAge())
		{
			return 1;
		}
		else
		{
			return 1;
		}
	}

	@Override
	public String toString()
	{
		return name + "\t\t" + age + "\t" + gender;
	}
	
}
