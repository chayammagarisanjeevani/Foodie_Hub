# 🍔 Foodie Hub - Online Food Ordering System

Foodie Hub is a Java-based web application that allows users to browse restaurants, view menus, add food items to a cart, place orders, and manage their profiles. The application is developed using Java, Servlets, JSP, JDBC, MySQL, HTML, CSS, and JavaScript following the MVC architecture.

---

# 📋 Table of Contents

- Project Requirements
- Installation Process
- Execution Steps
- Features
- Technologies Used
- Project Structure
- Conclusion

---

# 1. Project Requirements

Before running the project, ensure the following software is installed.

## Software Requirements

- Java Development Kit (JDK 17 or above)
- Eclipse IDE (Enterprise Edition Recommended)
- Apache Tomcat Server 10.x
- MySQL Server 8.0
- MySQL Workbench (Optional)
- Git (Optional)

## Hardware Requirements

- Windows / Linux / macOS
- Minimum 4 GB RAM
- Dual-Core Processor or higher
- Minimum 2 GB Free Disk Space

## Technologies Used

- Java
- JDBC
- Servlets
- JSP
- HTML5
- CSS3
- JavaScript
- MySQL
- Apache Tomcat
- Git & GitHub

---

# 2. Installation Process

Follow the steps below to install and configure the project.

## Step 1: Clone the Repository

```bash
git clone https://github.com/chayammagarisanjeevani/Foodie_Hub.git
```

Or download the project as a ZIP file from GitHub.

---

## Step 2: Import the Project into Eclipse

- Open Eclipse IDE.
- Click **File → Import**.
- Select **Existing Projects into Workspace**.
- Browse and select the project folder.
- Click **Finish**.

---

## Step 3: Configure Apache Tomcat

- Open the **Servers** tab.
- Add Apache Tomcat Server.
- Add the Foodie Hub project to the server.

---

## Step 4: Create the Database

Open MySQL Workbench and execute:

```sql
CREATE DATABASE foodiehub;
```

Import the SQL file containing the project tables.

---

## Step 5: Configure Database Connection

Update the database credentials in your DBConnection class.

Example:

```java
String url = "jdbc:mysql://localhost:3306/foodiehub";
String username = "root";
String password = "your_password";
```

---

## Step 6: Add MySQL Connector

Place the MySQL Connector JAR inside

```
WEB-INF/lib/
```

or add it through the project's Build Path.

---

# 3. Execution Steps

After completing the installation, follow these steps.

### Step 1

Start the MySQL Server.

### Step 2

Start the Apache Tomcat Server.

### Step 3

Run the project on Tomcat.

### Step 4

Open your browser and navigate to

```
http://localhost:8080/food_app/
```

### Step 5

Register a new account.

### Step 6

Login with your credentials.

### Step 7

Browse the available restaurants.

### Step 8

Select a restaurant to view its menu.

### Step 9

Add your favorite food items to the cart.

### Step 10

Review the cart and update quantities if needed.

### Step 11

Proceed to checkout.

### Step 12

Enter the delivery address.

### Step 13

Place the order.

### Step 14

View order details and order history.

---

# 4. Features

## User Module

- User Registration
- User Login
- User Logout
- User Profile
- Session Management

## Restaurant Module

- Display Restaurants
- Restaurant Images
- Restaurant Ratings
- Cuisine Type
- Delivery Time
- Active Restaurant Status

## Menu Module

- View Food Items
- Food Images
- Item Description
- Categories
- Availability Status
- Price Display

## Cart Module

- Add Items to Cart
- Update Quantity
- Remove Items
- View Total Price
- Continue Shopping

## Order Module

- Checkout
- Delivery Address
- Place Order
- Order Confirmation
- Order History

## Favorites Module

- Add Favorite Restaurants
- View Favorite Restaurants

## UI Features

- Responsive Navigation Bar
- Modern Restaurant Cards
- Attractive Menu Cards
- Responsive Design
- Clean User Interface

## Database Features

- MySQL Integration
- JDBC Connectivity
- CRUD Operations
- Secure Data Storage

---

# Technologies Used

| Technology | Purpose |
|------------|---------|
| Java | Backend Development |
| Servlets | Request Handling |
| JSP | Dynamic Web Pages |
| JDBC | Database Connectivity |
| MySQL | Database |
| HTML5 | Page Structure |
| CSS3 | Styling |
| JavaScript | Client-side Functionality |
| Apache Tomcat | Web Server |
| Git | Version Control |
| GitHub | Repository Hosting |

---

# Project Structure

```
Foodie_Hub
│
├── src/main/java
│   ├── DAO
│   ├── DAOImpl
│   ├── Model
│   ├── Controllers
│   └── Utility
│
├── src/main/webapp
│   ├── Images
│   ├── CSS
│   ├── JS
│   ├── WEB-INF
│   ├── home.jsp
│   ├── login.jsp
│   ├── signup.jsp
│   ├── restaurant.jsp
│   ├── menu.jsp
│   ├── cart.jsp
│   ├── checkout.jsp
│   ├── orderhistory.jsp
│   └── profile.jsp
│
└── README.md
```

---

# 5. Conclusion

Foodie Hub is a full-stack Java web application designed to simplify the online food ordering process. It provides an intuitive interface for users to register, log in, explore restaurants, browse menus, manage their cart, place food orders, and track their order history.

The application is developed using Java Servlets, JSP, JDBC, MySQL, HTML, CSS, and JavaScript while following the MVC architecture. This separation of concerns improves maintainability, scalability, and code organization. The project demonstrates key concepts such as authentication, session management, database connectivity, CRUD operations, and responsive web design.

Foodie Hub serves as an excellent academic project and a strong portfolio project for showcasing Java Full Stack development skills.

---

## 👩‍💻 Author

**Sanjeevani Kumari**

GitHub: https://github.com/chayammagarisanjeevani

Project Repository:
https://github.com/chayammagarisanjeevani/Foodie_Hub

---

⭐ If you found this project useful, consider giving it a **Star** on GitHub!
