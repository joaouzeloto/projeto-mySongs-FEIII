package com.example.trabalhof3;

import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "loginservelt", value = "/login")
public class loginservelt extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String login, pswd;
        login=request.getParameter("typeEmailX");
        if(login!=null)
        {
            pswd=request.getParameter("typePasswordX");
            String [] a = login.split("@");
            if(login!=null&&a[0].equals(pswd))
            {
                User user=new User(login);
                HttpSession session=request.getSession();
                session.setAttribute("user",user);
                response.sendRedirect("enviamusica.jsp"); //entra no sistema
                return;
            }
        }
        response.sendRedirect("login.jsp"); //volta para o login
    }

}