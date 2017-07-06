/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vedisoft.danishhousing.config;

import java.sql.*;
import java.util.*;
import java.io.InputStream;

public class ConnectionPool {
    static ArrayList<Connection> connections = null;
    static ConnectionPool instance = null;
    
    public synchronized void initialize() {
        if(connections == null){
            try{
                Properties pro = new Properties();
                InputStream ins = getClass().getResourceAsStream("Connection.properties");
                pro.load(ins);
                String driver = pro.getProperty("driver");
                String url = pro.getProperty("url");
                String userName = pro.getProperty("username");
                String password = pro.getProperty("password");
                int maxConnection = Integer.parseInt(pro.getProperty("maxconnection"));
                
                Class.forName(driver);
                connections = new ArrayList<Connection>();
                int count = 0;
                while(count < maxConnection) {
                    Connection c = DriverManager.getConnection(url, userName, password);
                    connections.add(c);
                    count++;
                }
            }catch(Exception e) {
                System.out.println("Cannot connect to Database Server");
            }
        }
    } 

public static synchronized ConnectionPool getInstance() {
    if(instance == null){
        instance = new ConnectionPool();
    }
    return instance;
}

public synchronized Connection getConnection() {
    Connection c = null;
    if(connections == null) {
        return null;
    }
    while(true){
        if(connections.size() > 0) {
            c = connections.get(0);
            connections.remove(0);
            break;
        }
        else {
            try{
                wait();
            }catch(Exception ie){
                ie.printStackTrace();
            }
        }
    }
    return c;
}

public synchronized void putConnection(Connection c) {
    connections.add(c);
    notifyAll();
}

public synchronized void removeAllConnections() {
    try {
        if(connections == null){
            return;
        }
        int sz = connections.size();
        for(int i=0; i<sz; i++){
            Connection c = connections.get(i);
            c.close();
            connections.clear();
            connections = null;
        }
    }catch(SQLException sqlE){
        System.out.println(sqlE);
      }
    
}
}