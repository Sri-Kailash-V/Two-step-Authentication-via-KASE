package pkg;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import javax.crypto.BadPaddingException;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;

public class Decrypter {

    public static File ddec(String fdown,String Deckey) throws Exception {
        String password = Deckey;
        PBEKeySpec pbeKeySpec = new PBEKeySpec(password.toCharArray());
        SecretKeyFactory secretKeyFactory = SecretKeyFactory
                .getInstance("PBEWithMD5AndTripleDES");
        SecretKey secretKey = secretKeyFactory.generateSecret(pbeKeySpec);
        File filein = new File("Crypted\\" + fdown + ".des");
        File fileout = new File("Crypted\\" + fdown);
        try (FileInputStream fis = new FileInputStream(filein)) {
            byte[] salt = new byte[8];
            fis.read(salt);
            PBEParameterSpec pbeParameterSpec = new PBEParameterSpec(salt, 100);
            Cipher cipher = Cipher.getInstance("PBEWithMD5AndTripleDES");
            cipher.init(Cipher.DECRYPT_MODE, secretKey, pbeParameterSpec);
            FileOutputStream fos = new FileOutputStream(fileout);
            byte[] in = new byte[64];
            int read;
            while ((read = fis.read(in)) != -1) {
                byte[] output = cipher.update(in, 0, read);
                if (output != null) {
                    fos.write(output);
                }
            }
            byte[] output = cipher.doFinal();
            fos.write(output);
            fos.flush();
            fos.close();
        }
        return fileout;

    }
}
