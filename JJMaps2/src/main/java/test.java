import Geocoder.geoCoding;

public class test {

	public static void main(String[] args) {
		geoCoding geo = new geoCoding();
		String addr = "광주 북구 용봉택지로25";
		Float[] coords = geo.geocode(addr);

		System.out.println(addr + ": " + coords[0] + ", " + coords[1]);

;
		

	}

}
