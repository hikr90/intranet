package com.intr.utils;

import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Properties;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class AESCrypto {
    
    private static String KEY_STRING;
    private static String IV_STRING;

    // 클래스 로딩 시 properties 파일 읽기
    static {
    	//
        try {
        	//
        	InputStream input = AESCrypto.class.getClassLoader().getResourceAsStream("config/aes/aes.properties");
            Properties prop = new Properties();
            if (input == null) {
                // 경로에 파일이 없을 경우 예외
                throw new RuntimeException("aes.properties 파일을 찾을 수 없습니다.");
            }
            prop.load(input);
            KEY_STRING = prop.getProperty("aes.key");
            IV_STRING = prop.getProperty("aes.iv");
            
        } catch (Exception e) {
            throw new ExceptionInInitializerError("AESCrypto 초기화 실패 (Properties 로드 오류): " + e.getMessage());
        }
    }

    // 시크릿 키 반환
    public static SecretKey getKey() throws Exception {
        return new SecretKeySpec(KEY_STRING.getBytes(StandardCharsets.UTF_8), "AES");
    }

    // 초기화 벡터 (IV) 반환
    public static IvParameterSpec getIv() {
        return new IvParameterSpec(IV_STRING.getBytes(StandardCharsets.UTF_8));
    }

    // 암호화 처리
    public static String encrypt(String specName, SecretKey key, IvParameterSpec iv, String plainText) throws Exception {
        Cipher cipher = Cipher.getInstance(specName);
        cipher.init(Cipher.ENCRYPT_MODE, key, iv);
        byte[] encrypted = cipher.doFinal(plainText.getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(encrypted);
    }

    // 복호화 처리
    public static String decrypt(String specName, SecretKey key, IvParameterSpec iv, String cipherText) throws Exception {
        Cipher cipher = Cipher.getInstance(specName);
        cipher.init(Cipher.DECRYPT_MODE, key, iv);
        byte[] decrypted = cipher.doFinal(Base64.getDecoder().decode(cipherText));
        return new String(decrypted, StandardCharsets.UTF_8);
    }
}