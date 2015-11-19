/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.h4t.controladores;

import com.h4t.modelo.EstadoSesion;
import com.h4t.servicios.DataPromocion;
import com.h4t.servicios.DataPublicacion;
import com.h4t.servicios.DataServicioBean;
import com.h4t.servicios.PublicadorControladorPublicacion;
import com.h4t.servicios.PublicadorControladorPublicacionService;
import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author spesamosca
 */
public class InfoPromocion extends HttpServlet {

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
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        if(request.getSession().getAttribute("estado_sesion") == EstadoSesion.LOGGED_IN){
            String promocion = (String)request.getParameter("Promocion");
            String usuario = (String)request.getSession().getAttribute("Usuario");
            PublicadorControladorPublicacionService service = new PublicadorControladorPublicacionService();
            PublicadorControladorPublicacion port = service.getPublicadorControladorPublicacionPort();
            DataPromocion dtp = port.infoPromocion(usuario, promocion);    
            List<DataServicioBean> Servicios = port.listarServiciosDePromocion(usuario, promocion).getItem();
            Set<DataServicioBean> servicios_de_promocion = null;
            servicios_de_promocion = new HashSet<DataServicioBean>();
            Iterator it = Servicios.iterator();
            while (it.hasNext()){
                DataPublicacion pub = (DataPublicacion) it.next();
                if (pub instanceof DataServicioBean){
                    servicios_de_promocion.add((DataServicioBean) pub);
                }
            }
            request.setAttribute("info_promocion",dtp);
            request.setAttribute("servicios_de_promocion",servicios_de_promocion);
            request.getRequestDispatcher("/InfoPromocion.jsp").forward(request, response);
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
