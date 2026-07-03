package launch;

import java.util.List;
import java.util.Scanner;


import com.food.DAOImpl.UserDAOImpl;
import com.food.Model.User;

public class UserLaunch {
private static	Scanner sc=new Scanner(System.in);
private static UserDAOImpl dao = new UserDAOImpl();

	
	public static void addUser() {
		System.out.println("Enter ID:");
		int userId=sc.nextInt();
		System.out.println("ENTER USER NAME:");
		String name = sc.next();
		System.out.println("ENTER MAIL :");
		String email = sc.next();
		System.out.println("ENTER USER PASSWORD:");
		String password = sc.next();
		System.out.println("ENTER PHONE:");
		String phone = sc.next();
		System.out.println("ENTER ADDRESS :");
		String address = sc.next();
		System.out.println("ENTER ROLE:");
		String role = sc.next();

		User user = new User(userId, name, email, password,
		        phone, address, role,
		        null, null);
		dao.addUser(user);
	}
	public static void getUser() {
		System.out.println("ENTER USER ID: ");
		int id=sc.nextInt();
		User user = dao.getUser(id);
		System.out.println(user.getName() + " " +
		        user.getEmail() + " " +
		        user.getPassword() + " " +
		        user.getPhone() + " " +
		        user.getAddress() + " " +
		        user.getRole() + " " +
		        user.getCreatedAt() + " " +
		        user.getLastLoginAt());
	}
	
	public static void updateUser() {
		System.out.println("ENTER USER ID: ");
		int id=sc.nextInt();
		int i = dao.updateUser(id);
		System.out.println(i+ " update sucessfully");
	}
	public static int deleteUser() {
		System.out.println("Enter ID: ");
		int id=sc.nextInt();
		int user=dao.deleteUser(id);
	//	System.out.println();
		return user;
		
	}
	public static void getAllUsers() {

		    List<User> users = dao.getAllUsers();

		    for (User u : users) {
          System.out.println(u);		    	

		        
		    }
		}
	
public static void main(String[] args) {
	
//    addUser();
	//getUser();
	//updateUser();
//	deleteUser();
	getAllUsers();
}
}