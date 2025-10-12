package com.n11.sportshop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class ImageService {
    private final ServletContext servletContext;

    public ImageService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handelImage(MultipartFile file, String target) {
        String finalName = "";
        String rootPath = this.servletContext.getRealPath("/resources/images");
        byte[] bytes;
        try {
            bytes = file.getBytes();

            File dir = new File(rootPath + File.separator + target);
            if (!dir.exists())
                dir.mkdirs();

            // Create the file on server
            finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);

            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return finalName;
    }

    public void deleteImage(String fileName, String target) {
        String uploadDir = "src/main/webapp/resources/images/" + target + "/";
        Path path = Paths.get(uploadDir + fileName);
        try {
            Files.deleteIfExists(path);
            System.out.println("✅ Deleted: " + path.toAbsolutePath());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
