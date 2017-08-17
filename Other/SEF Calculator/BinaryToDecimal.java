
public class BinaryToDecimal {
	private String binaryString;
	private String decimalString;
	
	public BinaryToDecimal(String binaryString){
		this.setBinaryString(binaryString);
	}
	
	
	public String getBinaryString() {
		return binaryString;
	}
	
	public void setBinaryString(String binaryString) {
		this.binaryString = binaryString;
		this.setDecimalString(this.toDecimalString(binaryString));
	}
	
	public String getDecimalString() {
		return decimalString;
	}
	
	public void setDecimalString(String decimalString) {
		this.decimalString = decimalString;
	}
	
	private String toDecimalString(String binaryString){
		int decimalValue = Integer.parseInt(binaryString, 2);
		return Integer.toString(decimalValue);
	}
	
}
