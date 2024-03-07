package com.example.trabalhof3;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@MultipartConfig(
        location="/",
        fileSizeThreshold=1024*1024,    // 1MB *
        maxFileSize=1024*1024*100,      // 100MB **
        maxRequestSize=1024*1024*10*10  // 100MB ***
)

@WebServlet(name = "uploadServlet", value = "/upservlet")
public class uploadServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = response.getWriter();
        try {
            // lê a pasta de destino
            String pasta = request.getParameter("destination");
            Part filePart = request.getPart("file");  // Lê o arquivo de upload
            String fileName = filePart.getSubmittedFileName();

            OutputStream out = null;
            InputStream filecontent = null;

            //criando a pasta
            File fpasta = new File(getServletContext().getRealPath("/") + "/" + pasta);
            fpasta.mkdir();
            out = new FileOutputStream(new File(fpasta.getAbsolutePath() + "/" + fileName));
            filecontent = filePart.getInputStream();
            int read = 0;
            byte[] bytes = new byte[1024];
            while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
            writer.println("Novo arquivo " + fileName + " criado na pasta " + pasta);
            out.close();
            filecontent.close();
            writer.close();
        } catch (Exception fne) {
            writer.println("Erro ao receber o arquivo");
            writer.println("<br/> ERRO: " + fne.getMessage());
        }

    }

}