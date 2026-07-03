package com.food.DAO;

import java.util.List;

import com.food.Model.User;

public interface UserDAO {
void addUser(User user);

int updateUser(int userId);

int deleteUser(int userId);

User getUser(int userId);

List<User> getAllUsers();


}