/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.modelo;

import com.h4t.servicios.PublicadorControladorPublicacionService;
import com.h4t.servicios.PublicadorControladorReservaService;
import com.h4t.servicios.PublicadorControladorUsuarioService;
import java.io.FileInputStream;
import java.net.URL;
import java.util.Properties;

/**
 *
 * @author Nico
 */
public class FabricaWS {
    
    private static FabricaWS instancia_ = null;
    private static String server = null;
    private static String clientet2 = null;
    private static String clientet3 = null;
    
    private FabricaWS(){
    }
    
    public static FabricaWS getInstance(){
        if (instancia_ == null){
            instancia_ = new FabricaWS();
            String srv = "http://";
            Properties config = new Properties();
            try{
                FileInputStream input;
                if(System.getProperty("os.name").toUpperCase().contains("WINDOWS"))
                    input = new FileInputStream(System.getProperty("user.home") + "/Documents/server.properties");
                else
                    input = new FileInputStream(System.getProperty("user.home") + "/Quick Order/server.properties");
                config.load(input);
                srv = srv + config.getProperty("host") +":"+ config.getProperty("port");
                clientet2 = config.getProperty("t2url");
                clientet3 = config.getProperty("t3url");
            }catch(Exception e){
                srv = "http://localhost:9128";
            }
            server = srv;
        }
        
        return instancia_;
    } 
    
    public PublicadorControladorPublicacionService getPublicacionService(){
        URL srv;
        try{
        if (server != null)
            srv = new URL(server + "/controlador_publicacion?wsdl");
        else
            srv = new URL("http://localhost:9128/controlador_publicacion?wsdl");
        }catch(Exception e){
            return new PublicadorControladorPublicacionService();
        }           
        return new PublicadorControladorPublicacionService(srv);
    }
    
    public PublicadorControladorReservaService getReservaService(){
        URL srv;
        try{
        if (server != null)
            srv = new URL(server + "/controlador_reserva?wsdl");
        else
            srv = new URL("http://localhost:9128/controlador_reserva?wsdl");
        }catch(Exception e){
            return new PublicadorControladorReservaService();
        }           
        return new PublicadorControladorReservaService(srv);
    }
    
    public PublicadorControladorUsuarioService getUsuarioService(){
        URL srv;
        try{
        if (server != null)
            srv = new URL(server + "/controlador_usuario?wsdl");
        else
            srv = new URL("http://localhost:9128/controlador_usuario?wsdl");
        }catch(Exception e){
            return new PublicadorControladorUsuarioService();
        }           
        return new PublicadorControladorUsuarioService(srv);
    }
    
    public String getT2URL(){
        if (clientet2 != null)
            return clientet2;
        else
            return "http://localhost:8080/t2tpgr32";
    }
    
    public String getT3URL(){
        if (clientet3 != null)
            return clientet3;
        else
            return "http://localhost:8080/t3tpgr32";
    }
    
}
