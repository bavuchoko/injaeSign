package com.example.demo.util;

import java.security.MessageDigest;

public class Utility {
	public static String encoding(String userpw) {
		String encodeString="";
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(userpw.getBytes());
			byte[] encodeDate = md.digest();
			
			for(int i=0; i<encodeDate.length; i++){
				encodeString += Integer.toHexString(encodeDate[i]&0xFF);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return encodeString;
	}
}

	

