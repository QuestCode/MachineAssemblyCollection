
public class HexToFloat {
	private String hexString;
	private String FloatString;
	
	public HexToFloat(String hexString){
		hexString = hexString.replaceFirst("0x", "");
		this.setHexString(hexString);
	}

	public String getHexString() {
		return hexString;
	}

	public void setHexString(String hexString) {
		this.hexString = hexString;
		Long i = Long.parseLong(hexString, 16);
        Float f = Float.intBitsToFloat(i.intValue());
        this.setFloatString(String.format("%.7f", f));
	}

	public String getFloatString() {
		return FloatString;
	}

	public void setFloatString(String floatString) {
		FloatString = floatString;
	}
}
