package pkg;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;

public class Ftpcon {

    FTPClient client = new FTPClient();
    FileInputStream fis = null;
    boolean status;

    public boolean upload(File file, String fname) {
        try {
            client.connect("ftp.drivehq.com", 21);
            client.login("SriKailash", "kailash@1116");
            client.enterLocalPassiveMode();
            fis = new FileInputStream(file);
            status = client.storeFile("/intern/" + fname, fis);
            client.logout();
            fis.close();
        } catch (IOException e) {
            System.out.println(e);
        } catch (Exception e) {
            System.out.println(e);
        }
        if (status) {
            System.out.println("success");
            return true;
        } else {
            System.out.println("failed");
            return false;
        }
    }

    public boolean download(String fname) {
        try {
            client.connect("ftp.drivehq.com", 21);
            client.login("SriKailash", "kailash@1116");
            client.enterLocalPassiveMode();
            String remoteFile1 = "/intern/" + fname + ".des";
            File downloadFile1 = new File("DCrypted\\" + fname + "1.des");
            OutputStream outputStream1 = new BufferedOutputStream(new FileOutputStream(downloadFile1));
            status = client.retrieveFile(remoteFile1, outputStream1);
            downloadFile1.delete();
        } catch (IOException e) {
            System.out.println(e);
        } catch (Exception e) {
            System.out.println(e);
        }
        if (status) {
            System.out.println("success");
            return true;
        } else {
            System.out.println("failed");
            return false;
        }
    }

    public boolean delete(String fname) {
        try {
            client.connect("ftp.drivehq.com", 21);
            client.login("SriKailash", "kailash@1116");
            client.enterLocalPassiveMode();
            String remoteFile1 = "/intern/" + fname + ".des";
            status = client.deleteFile(remoteFile1);
        } catch (IOException e) {
            System.out.println(e);
        } catch (Exception e) {
            System.out.println(e);
        }
        if (status) {
            System.out.println("success");
            return true;
        } else {
            System.out.println("failed");
            return false;
        }
    }
}
