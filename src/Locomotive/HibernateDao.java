package Locomotive;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;

public class HibernateDao
{
	StandardServiceRegistry ssr;
	Metadata m;
	SessionFactory f;
	Session s;
	
	public void addUser(String username, String password, String email)
	{
		Session sin=getConnection();
		Transaction t = sin.beginTransaction();
		Login l = new Login();
		l.setUsername(username);
		l.setPassword(password);
		l.setEmail(email);
		
		sin.save(l);
		t.commit();
			
		sin.close();
		f.close();
		ssr.close();
	}
	
	public boolean loginCheck(String username, String password)
	{
		Session sin=getConnection();
		Query q = sin.createQuery("from Login where username = :id and password = :ps");
		q.setParameter("id", username);
		q.setParameter("ps", password);
			
		List<Login> l = q.list();
		if (!l.isEmpty())
		{
			sin.close();
			f.close();
			ssr.close();
			return true;
		}
		else
		{
			sin.close();
			f.close();
			ssr.close();
			return false;
		}
	}
	
	public int newUser(String username, String email)
	{
		int result = 0;
		
		Session sin=getConnection();
		Query q1 = sin.createQuery("from Login where username = :id");
		Query q2 = sin.createQuery("from Login where email = :em");

		q1.setParameter("id", username);
		q2.setParameter("em", email);
			
		List<Login> l1 = q1.list();
		List<Login> l2 = q2.list();
		if (!l1.isEmpty())
		{
			result += 5;
		}
		if (!l2.isEmpty())
		{
			result += 10;
		}

		sin.close();
		f.close();
		ssr.close();
		
		return result;
	}
	
	public List<Trains> trainTable()
	{
		Session sin=getConnection();
		Query q = sin.createQuery("from Trains");
		List<Trains> list = q.list();
		sin.close();
		f.close();
		ssr.close();
		return list;
	}
	
	public Trains getTrain(int trainNo)
	{
		Session sin=getConnection();
		Query q = sin.createQuery("from Trains where TRAIN_NO = :tn");
		q.setParameter("tn", trainNo);
		Trains train = (Trains) q.getSingleResult();
		
		sin.close();
		f.close();
		ssr.close();
		return train;
		/*if (train == null)
		{
			sin.close();
			f.close();
			ssr.close();
			return null;
		}
		else
		{
			sin.close();
			f.close();
			ssr.close();
			return train;
		}*/
	}
	
	public boolean trainValidate(int trainNo)
	{
		Session sin=getConnection();
		Query q = sin.createQuery("from Trains where TRAIN_NO = :tn");
		q.setParameter("tn", trainNo);
		List<Trains> list = q.list();
		
		if (!list.isEmpty())
		{
			sin.close();
			f.close();
			ssr.close();
			return true;
		}
		else
		{
			sin.close();
			f.close();
			ssr.close();
			return false;
		}
	}
	
	public Session getConnection()
	{
		 ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
		 m = new MetadataSources(ssr).getMetadataBuilder().build();
		 f = m.getSessionFactoryBuilder().build();
		 s = f.openSession();
		 return  s;
	}
}
