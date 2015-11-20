/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import com.h4t.modelo.EstadoSesion;
import com.h4t.modelo.FabricaWS;
import com.h4t.servicios.DataReserva;
import com.h4t.servicios.PublicadorControladorReserva;
import com.h4t.servicios.PublicadorControladorReservaService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author Bruno González
 */
public class InfoReserva extends HttpServlet {

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
        int nro = Integer.parseInt((String) request.getParameter("nro"));

        if (request.getSession().getAttribute("estado_sesion") == EstadoSesion.LOGGED_IN) {
            String nick = (String) request.getSession().getAttribute("Usuario");
            PublicadorControladorReservaService servicio = new PublicadorControladorReservaService();
            PublicadorControladorReserva port = servicio.getPublicadorControladorReservaPort();
            request.setAttribute("info_reserva_dr", port.infoReservaProveedor(nro, nick));
            request.setAttribute("info_reserva_fac", port.obtenerFacturaReserva(nro));
            request.setAttribute("proveedor_facturo", port.proveedorFacturoReserva(nick, nro));
            request.setAttribute("urlt2", FabricaWS.getInstance().getT2URL());
            request.getRequestDispatcher("/InfoReserva.jsp").forward(request, response);
        }else{
            response.sendRedirect("");
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
