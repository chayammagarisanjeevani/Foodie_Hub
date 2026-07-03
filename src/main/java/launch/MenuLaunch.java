package launch;

import java.sql.Timestamp;
import java.util.List;

import com.food.DAO.MenuDAO;
import com.food.DAOImpl.MenuDAOImpl;
import com.food.Model.Menu;

public class MenuLaunch {

    public static void main(String[] args) {

        MenuDAO menuDAO = new MenuDAOImpl();

        // ==========================
        // INSERT MENU
        // ==========================

        Menu menu = new Menu();
        menu.setRestaurantID(1);
        menu.setItemName("Chicken Biryani");
        menu.setDescription("Hyderabadi Dum Biryani");
        menu.setPrice(299.00f);
        menu.setIsAvailable(true);
        menu.setCategory("Main Course");
        menu.setCreatedAt(new Timestamp(System.currentTimeMillis()));
        menu.setUpdatedAt(new Timestamp(System.currentTimeMillis()));

        menuDAO.addMenu(menu);

        // ==========================
        // GET MENU BY ID
        // ==========================

        System.out.println("\n------ Get Menu By ID ------");

        Menu m = menuDAO.getMenu(1);

        if (m != null) {
            System.out.println(m);
        } else {
            System.out.println("Menu not found.");
        }

        // ==========================
        // UPDATE MENU
        // ==========================

        System.out.println("\n------ Update Menu ------");

        Menu updateMenu = menuDAO.getMenu(1);

        if (updateMenu != null) {

            updateMenu.setItemName("Special Chicken Biryani");
            updateMenu.setDescription("Extra Spicy");
            updateMenu.setPrice(349.00f);
            updateMenu.setCategory("Biryani");
            updateMenu.setIsAvailable(true);
            updateMenu.setUpdatedAt(new Timestamp(System.currentTimeMillis()));

            int status = menuDAO.updateMenu(updateMenu);

            System.out.println(status + " row updated");
        }

        // ==========================
        // GET ALL MENUS
        // ==========================

        System.out.println("\n------ All Menus ------");

        List<Menu> allMenus = menuDAO.getALLMenu();

        for (Menu menuObj : allMenus) {
            System.out.println(menuObj);
        }

        // ==========================
        // GET MENU BY RESTAURANT ID
        // ==========================

        System.out.println("\n------ Menus of Restaurant ID = 1 ------");

        List<Menu> restaurantMenus = menuDAO.getALLMenuByRestaurantID(1);

        for (Menu menuObj : restaurantMenus) {
            System.out.println(menuObj);
        }

        // ==========================
        // DELETE MENU
        // ==========================

        /*
        int status = menuDAO.deleteMenu(1);
        System.out.println(status + " row deleted");
        */

    }
}