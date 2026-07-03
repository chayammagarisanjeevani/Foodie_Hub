package launch;

import java.util.List;

import com.food.DAO.RestaurantDAO;
import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.Model.Restaurant;

public class RestaurantLaunch {

    public static void main(String[] args) {

        RestaurantDAO restaurantDAO = new RestaurantDAOImpl();

        // ==========================
        // INSERT RESTAURANT
        // ==========================

        Restaurant restaurant = new Restaurant();

        restaurant.setName("Paradise");
        restaurant.setCuisineType("Biryani");
        restaurant.setDeliveryTime(30);
        restaurant.setAddress("Hyderabad");
        restaurant.setAdminUserID(1);
        restaurant.setRating(4.6f);
        restaurant.setIsActive(1);
        restaurant.setImagePath("images/paradise.jpg");

        restaurantDAO.addRestaurant(restaurant);

        // ==========================
        // GET RESTAURANT BY ID
        // ==========================

        System.out.println("\n------ Get Restaurant By ID ------");

        Restaurant r = restaurantDAO.getRestaurant(1);

        if (r != null) {
            System.out.println(r);
        } else {
            System.out.println("Restaurant not found.");
        }

        // ==========================
        // UPDATE RESTAURANT
        // ==========================

        System.out.println("\n------ Update Restaurant ------");

        Restaurant updateRestaurant = restaurantDAO.getRestaurant(1);

        if (updateRestaurant != null) {

            updateRestaurant.setName("Paradise Restaurant");
            updateRestaurant.setCuisineType("North Indian");
            updateRestaurant.setDeliveryTime(40);
            updateRestaurant.setAddress("Bangalore");
            updateRestaurant.setRating(4.8f);
            updateRestaurant.setIsActive(1);
            updateRestaurant.setImagePath("images/paradise_new.jpg");

            int status = restaurantDAO.updateRestaurant(updateRestaurant);

            System.out.println(status + " row updated");
        }

        // ==========================
        // GET ALL RESTAURANTS
        // ==========================

        System.out.println("\n------ All Restaurants ------");

        List<Restaurant> restaurants = restaurantDAO.getALLRestaurants();

        for (Restaurant res : restaurants) {
            System.out.println(res);
        }

        // ==========================
        // DELETE RESTAURANT
        // ==========================

        /*
        int status = restaurantDAO.deleteRestaurant(1);
        System.out.println(status + " row deleted");
        */

    }
}