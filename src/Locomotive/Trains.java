package Locomotive;

public class Trains
{
	private int train_no;
	private int ticket_price;
	private String train_name, source, destination;
	

	public int getTrain_no()
	{
		return train_no;
	}
	public void setTrain_no(int train_no)
	{
		this.train_no = train_no;
	}
	
	public int getTicket_price()
	{
		return ticket_price;
	}
	public void setTicket_price(int ticket_price)
	{
		this.ticket_price = ticket_price;
	}
	
	public String getTrain_name()
	{
		return train_name;
	}
	public void setTrain_name(String train_name)
	{
		this.train_name = train_name;
	}
	
	public String getSource()
	{
		return source;
	}
	public void setSource(String source)
	{
		this.source = source;
	}
	
	public String getDestination()
	{
		return destination;
	}
	public void setDestination(String destination)
	{
		this.destination = destination;
	}
}
