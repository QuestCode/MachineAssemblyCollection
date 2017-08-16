
public class HexToBinary {
	private String hexValue;
	private String binaryString;
	
	
	public HexToBinary(String hexValue){
		this.setHexValue(hexValue);
		this.setBinaryString(hexValue);
	}
	
	private String fromHexToBinary(String hexString) {
		hexString = hexString.replaceFirst("0x", "");
		this.setHexValue(hexString);
	    int i = Integer.parseInt(hexString, 16);
	    String binaryString = Integer.toBinaryString(i);
	    String padded = String.format("%8s", binaryString.replace(' ', '0'));
	    return padded;
	}

	public String getHexValue() {
		return hexValue;
	}

	public void setHexValue(String hexValue) {
		this.hexValue = hexValue;
	}

	public String getBinaryString() {
		return binaryString;
	}

	public void setBinaryString(String hexValue) {
		this.binaryString = this.fromHexToBinary(hexValue);
	}
	
	
}
