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
            String pasta = "MUSICAS/";
            String pasta_img = "CAPA/";
            String nome = request.getParameter("nameMusic"), autor = request.getParameter("autor"), genero = request.getParameter("genero");
            Part fileMusic = request.getPart("music");
            Part fileImage = request.getPart("image");
            String fileName = nome.replaceAll(" ","")+"_"+genero.replaceAll(" ", "") +"_"+autor.replaceAll(" ","")+".mp3";
            String fileNameI = nome.replaceAll(" ","")+"_"+genero.replaceAll(" ", "") +"_"+autor.replaceAll(" ","")+".png";


            OutputStream out, out2 = null;
            InputStream filecontent, filecontent2 = null;

            //criando a pasta
            File fpasta = new File(getServletContext().getRealPath("/") + "/" + pasta);
            fpasta.mkdir();
            out = new FileOutputStream(new File(fpasta.getAbsolutePath() + "/" + fileName));
            filecontent = fileMusic.getInputStream();
            int read = 0;
            byte[] bytes = new byte[1024];
            while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }

            File gpasta = new File(getServletContext().getRealPath("/") + "/" + pasta_img);
            gpasta.mkdir();
            out2 = new FileOutputStream(new File(gpasta.getAbsolutePath() + "/" + fileNameI));
            filecontent2 = fileImage.getInputStream();
            int readi = 0;
            byte[] bytesi = new byte[1024];
            while ((readi = filecontent2.read(bytesi)) != -1) {
                out2.write(bytesi, 0, readi);
            }

            writer.println("Novo arquivo " + fileName + " criado na pasta " + pasta);
            out.close();
            out2.close();
            filecontent2.close();
            filecontent.close();
            writer.close();
        } catch (Exception fne) {
            writer.println("Erro ao receber o arquivo");
            writer.println("<br/> ERRO: " + fne.getMessage());
        }

    }

    public static String[] parseFileName(String fileName) {
        String[] parts = fileName.split("_");
        String nome = parts[0];
        String estilo = parts[1];
        String cantor = parts[2].substring(0, parts[2].lastIndexOf("."));

        nome = nome.replaceAll("([a-z])([A-Z]+)", "$1 $2");
        estilo = estilo.replaceAll("([a-z])([A-Z]+)", "$1 $2");
        cantor = cantor.replaceAll("([a-z])([A-Z]+)", "$1 $2");

        return new String[] { nome, estilo, cantor };
    }

}