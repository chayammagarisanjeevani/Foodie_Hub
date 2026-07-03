package launch;

import java.util.List;
import java.util.Scanner;

import com.food.DAOImpl.OrderitemDAOImpl;
import com.food.Model.Orderitem;


public class OrderitemLaunch {

private static final OrderitemDAOImpl oidao = new OrderitemDAOImpl();
//	private static final String item = null;

	private static Scanner sc=new Scanner(System.in); 

	   
	   public static void addOrderitem() {
		      
		   System.out.println("Enter  MenuID: ");
		   int MenuID= sc.nextInt();
		   
		   System.out.println("Enter Quantity:");
		   int Quantity = sc.nextInt();
		   
		   System.out.println("Enter ItemTotal :");
		   float ItemTotal = sc.nextFloat();
		   
		   System.out.println("Enter OrderID:");
		   int OrderID = sc.nextInt();
		   OrderitemDAOImpl oidao = new OrderitemDAOImpl();
		   Orderitem item = new Orderitem(OrderID ,MenuID,Quantity,ItemTotal);
		   
		   oidao.addOrderitem(item);
	   }
	   
	   
public static void updateOrderitem() {
		   
		   System.out.println("Enter Updated Values!!");
		 
		   System.out.println("Enter OrderitemID:");
		   int OrderItemID= sc.nextInt();
		   Orderitem item = oidao.getOrderitem(OrderItemID);
		  
		   System.out.println("Enter  MenuID:");
		   item.setMenuID(sc.nextInt());
		   
		   
		   
		   System.out.println("Enter Quantity:");
		   item.setQuantity(sc.nextInt());
		   
		   
		   System.out.println("Enter ItemTotal:");
		   item.setItemTotal(sc.nextFloat());
		  
		   System.out.println("Enter OrderID:");
		   item.setOrderID(sc.nextInt());
		   
		   
		   int i = oidao.updateOrderitem(item);
		   System.out.print(i+"rows updated");
	   }
	   

public static void getOrderitem (){
	  
	  System.out.println("ENTER OrderitemID: ");
		int id=sc.nextInt();
	Orderitem item=oidao.getOrderitem(id) ;
	System.out.println(item);
	  
}
	   
public static int deleteOrderitem () {
	System.out.println("Enter ID: ");
	int id=sc.nextInt();
	int item=oidao.deleteOrderitem(id);


	return item;
}
	   
public static void getALLOrderitem() {

    List<Orderitem> item= oidao.getALLOrderitem();

    for (Orderitem o :item ) {
System.out.println(o);		    	

        
    }
}
public static void main(String[] args) {

//addOrderitem();
//getALLOrderitem();
//deleteOrderitem();
//updateOrderitem();
getOrderitem(); 
	   
	   
}
}