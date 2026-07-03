package launch;

import java.sql.Timestamp;
import java.util.List;
import java.util.Scanner;

import com.food.DAOImpl.OrdertableDAOImpl;

import com.food.Model.Ordertable;



public class OrdertableLaunch {
	private static Scanner sc=new Scanner(System.in); 

	   static  OrdertableDAOImpl odao=new  OrdertableDAOImpl();
	   
	   public static void addOrdertable() {
		   
		   System.out.println("Enter User ID: ");
		   int UserID=sc.nextInt();
		   
		   System.out.println("Enter  RestaurantID: ");
		   int RestaurantID = sc.nextInt();
		   
		   Timestamp OrderDate= new Timestamp(System.currentTimeMillis());
		   
		   System.out.println("Enter TotalAmount:");
		   float TotalAmount = sc.nextFloat();
		   sc.nextLine();
		   System.out.println("Enter Status :");
		   String  Status = sc.nextLine();
		   
		   System.out.println("Enter PaymentMethod:");
		   String PaymentMethod = sc.nextLine();
		   
		   
		   
		   Ordertable order = new Ordertable(  UserID,RestaurantID,OrderDate,TotalAmount, Status,PaymentMethod);
		   odao.addOrdertable(order);
	   }
	   
	   public static void updateOrdertable() {
		   
		   System.out.println("Enter Updated Values!!");
		   
		   System.out.println("Enter User Id:");
		   int id = sc.nextInt();
		   sc.nextLine();
		   
		   Ordertable order= odao.getOrdertable(id);
		   
		   System.out.println("Enter RestaurantID:");
		   order.setRestaurantID(sc.nextInt());
		   
		   order.setOrderDate(new Timestamp(System.currentTimeMillis()));
		   
		   
		   System.out.println("Enter TotalAmount:");
		   order.setTotalAmount(sc.nextFloat());
		   
		   sc.nextLine();
		   System.out.println("Enter Status:");
		   order.setStatus(sc.nextLine());
		   
		   System.out.println("Enter PaymentMethod:");
		   order.setPaymentMethod(sc.nextLine());
		   
		   System.out.println("Enter OrderID:");
		   order.setPaymentMethod(sc.nextLine());
		   
		  
		   int i = odao.updateOrdertable(order);
		   System.out.print(i+"rows updated");
	   }
	   
	   

	  public static void getOrdertable(){
		  
		  System.out.println("ENTER Order ID: ");
			int id=sc.nextInt();
			Ordertable order=odao.getOrdertable(id) ;
		System.out.println(order);
		  
	  }
	  
	  
	  public static int deleteOrdertable() {
				System.out.println("Enter ID: ");
				int id=sc.nextInt();
				int order=odao.deleteOrdertable(id);
				//System.out.println();
		  
		  
				return order;
		  }
	 
	  public static void getALLOrdertable() {

		    List<Ordertable> order = odao.getALLOrdertable();

		    for (Ordertable o :order ) {
	    System.out.println(o);		    	

		        
		    }
		}
	public static void main(String[] args) {
		
	addOrdertable();
//	getALLOrdertable();
		deleteOrdertable();
//		updateOrdertable();
//		getOrdertable();
	}
	
}
