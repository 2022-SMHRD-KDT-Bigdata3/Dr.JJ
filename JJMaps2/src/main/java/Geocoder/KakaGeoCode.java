package Geocoder;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;

public class KakaGeoCode {

	private static String GEOCODE_URL="http://dapi.kakao.com/v2/local/search/address.json?query=";
    private static String GEOCODE_USER_INFO="KakaoAK 1154e936cf7c28a1cc798a7f1a46351f"; 
    
    public static void main(String[] args){
//    	public <json> json geocode(String addr)		
        URL obj;
        String store_addr="광주 동구 예술길 33";
        try{
            //인코딩한 String을 넘겨야 원하는 데이터를 받을 수 있다.
            String address = URLEncoder.encode(store_addr, "UTF-8");
            
            obj = new URL(GEOCODE_URL+address);
			
            HttpURLConnection con = (HttpURLConnection)obj.openConnection();
            
            //get으로 받아오면 된다. 자세한 사항은 카카오개발자센터에 나와있다.
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization",GEOCODE_USER_INFO);
            con.setRequestProperty("content-type", "application/json");
            con.setDoOutput(true);
            con.setUseCaches(false);
            con.setDefaultUseCaches(false);
			
            Charset charset = Charset.forName("UTF-8");
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), charset));
        
       
            String inputLine;
            StringBuffer result = new StringBuffer();
           
            
            while ((inputLine = in.readLine()) != null) {
                result.append(inputLine);
            }
			
        			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}