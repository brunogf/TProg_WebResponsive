/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.h4t.controladores;

import com.h4t.servicios.PublicadorControladorUsuario;
import com.h4t.modelo.EstadoSesion;
import com.h4t.modelo.FabricaWS;
import com.h4t.servicios.DataCliente;
import com.h4t.servicios.DataProveedorBean;
import com.h4t.servicios.DataUsuario;
import com.h4t.servicios.PublicadorControladorUsuarioService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author piñe
 */
@WebServlet(name = "IniciarSesion", urlPatterns = {"/IniciarSesion"})
public class IniciarSesion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        PublicadorControladorUsuarioService servicio = FabricaWS.getInstance().getUsuarioService();
        com.h4t.servicios.PublicadorControladorUsuario port = servicio.getPublicadorControladorUsuarioPort();
        
        String usr = request.getParameter("Usuario");

        switch (port.comprobarUsuario(usr, request.getParameter("Pass")))
        {
            case 0://TODO OK
                {
                DataUsuario du;
                du = port.infoUsuario(port.getNickUsuario(usr));
                if (du instanceof DataProveedorBean){
                  request.getSession().setAttribute("Usuario", du.getNickname());
                  request.getSession().setAttribute("estado_sesion", EstadoSesion.LOGGED_IN);
                  String nombre = du.getNombre() + " " + du.getApellido();
                  request.getSession().setAttribute("Nombre", nombre);              
                  response.sendRedirect("Home.jsp");
                  }
                else{
                    request.getSession().setAttribute("estado_sesion", EstadoSesion.INVALID_LOGIN);
                    response.sendRedirect("");//redirecciona al inicio
                }
                    
                }   
                break;
            case 1:
                {
                    request.getSession().setAttribute("estado_sesion", EstadoSesion.INVALID_LOGIN);
                    response.sendRedirect("");//redirecciona al inicio
                }
                break;
            case 2:
                {
                    request.getSession().setAttribute("estado_sesion", EstadoSesion.INVALID_LOGIN);
                    response.sendRedirect("");//redirecciona al inicio
                }
                break;
        }
            
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
