package Locomotive;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
import java.util.Map.Entry;
import java.util.TreeMap;

public class Ticket
{
	private int counter = 100;
	private String pnr;
	private Date travelDate;
	private Trains train;
	private TreeMap<Passenger, Double> passengers = new TreeMap<Passenger, Double>();
	
	public Ticket(Date travelDate, Trains train)
	{
		super();
		this.travelDate = travelDate;
		this.train = train;
	}
	
	@SuppressWarnings("deprecation")
	private String generatePNR()
	{
		char s = train.getSource().charAt(0);
		char d = train.getDestination().charAt(0);
		int year = travelDate.getYear()+1900;
		String month = String.format("%02d", travelDate.getMonth()+1);
		String date = String.format("%02d", travelDate.getDate());
		pnr = "" + s + d + "_" + year + month + date + "_" + counter;
		counter++;
		return pnr;
	}
	
	private double calcPassengerFare(Passenger passenger)
	{
		double fare = train.getTicket_price();
		int age = passenger.getAge();
		String gender = passenger.getGender();
		
		if (age <= 12)
		{
			fare *= .5;
		}
		
		else if (age >= 60)
		{
			fare *= .6;
		}
		
		if (gender.equals("Female"))
		{
			fare *= .75;
		}
		
		return fare;
	}
	
	public void addPassenger(String name, int age, String gender)
	{
		Passenger passengerInfo = new Passenger(name,age,gender);
		double fare = calcPassengerFare(passengerInfo);
		passengers.put(passengerInfo, fare);
	}
	
	private double calculateTotalTicketPrice()
	{
		double totalPrice = 0;
		
		for (int i = 0; i < passengers.size(); i++)
		{
			Object x = passengers.values().toArray()[i];
			totalPrice += (double) x;
		}
		
		return totalPrice;
	}
	
	@SuppressWarnings("deprecation")
	private StringBuilder generateTicket()
	{
		/*generate ticket as
		PNR        	:  -------------			
		Train no	:  -----
		Train Name	:  -------------			
		From      	:  -------------			
		To		:  -------------
		Travel Date	: dd/mm/yyyy

		Passengers :
		Name			Age		Gender	Fare
		-------------------		---		-------	              x,xxx.xx
		-------------------		---		-------	              x,xxx.xx
		-------------------		---		-------                  x,xxx.xx
		Total Price : xx,xxx.xx
		*/
		// then return in StringBuilder
		StringBuilder sb = new StringBuilder();
		int year = travelDate.getYear()+1900;
		String month = String.format("%02d", travelDate.getMonth()+1);
		String date = String.format("%02d", travelDate.getDate());
		
		sb.append("PNR\t\t: " + generatePNR());
		sb.append("\nTrain no\t: " + train.getTrain_no());
		sb.append("\nTrain Name\t: " + train.getTrain_name());
		sb.append("\nFrom\t\t: " + train.getSource());
		sb.append("\nTo\t\t: " + train.getDestination());
		sb.append("\nTravel Date\t: " + date + "/" + month + "/" + year);
		sb.append("\n\nPassengers\t: ");
		sb.append("\nName\tAge\tGender\tFare");
		for(Entry<Passenger, Double> entry:passengers.entrySet())
		{
			sb.append("\n" + entry.getKey().toString() + "\t" + entry.getValue().toString());
		}
		sb.append("\nTotal Price\t: " + calculateTotalTicketPrice());
		
		return sb;
	}
	
	public StringBuilder print()
	{
		StringBuilder sb = new StringBuilder();
		int year = travelDate.getYear()+1900;
		String month = String.format("%02d", travelDate.getMonth()+1);
		String date = String.format("%02d", travelDate.getDate());
		
		sb.append("<pre>"
				+ "     PNR         :   " + generatePNR() + "<br>");
		sb.append("     Train no    :   " + train.getTrain_no() + "<br>");
		sb.append("     Train Name  :   " + train.getTrain_name() + "<br>");
		sb.append("     From        :   " + train.getSource() + "<br>");
		sb.append("     To          :   " + train.getDestination() + "<br>");
		sb.append("     Travel Date :   " + date + "/" + month + "/" + year + "<br>");
		sb.append("     ===========================================<br><br>");
		sb.append("     Passengers  :   " + "<br>");
		sb.append("     Name               Age     Gender     Fare" + "<br>");
		for(Entry<Passenger, Double> entry:passengers.entrySet())
		{
			String spaces;
			sb.append("     " + entry.getKey().toString());
			if (entry.getKey().getGender().equals("Male"))
			{
				spaces = "       ";
			}
			else
			{
				spaces = "     ";
			}
			sb.append(spaces + entry.getValue().toString() + "<br>");
		}
		sb.append("     Total Price :   " + calculateTotalTicketPrice() + "</pre>");
		
		return sb;
	}
	
	public void writeTicket() throws IOException
	{
		//writes generated ticket to a file
		
		String output = generateTicket().toString();
	    BufferedWriter writer = new BufferedWriter(new FileWriter("/C:\\Users\\Ino\\workspace\\Case_Study_Two\\WebContent\\WEB-INF\\ticket.txt"));
///c:\\new\\ticket.txt
	    String[] words = output.split("\\r?\\n");
	    for (String word: words) {
	        writer.write(word);
	        writer.newLine();
	    }
	    writer.close();
	}
}
