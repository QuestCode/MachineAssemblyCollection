
public class FloatingPoint {
	
	private HexToBinary htb;
	private BinaryToDecimal btd;
	private HexToFloat htf;
	private String S;
	private String EBinary;
	private String EDecimal;
	private String PDecimal;
	private String PBinary;
	private String F;
	private String SEF;
	
	public FloatingPoint(String hexString){
		this.htb = new HexToBinary(hexString);
		this.setHtf(new HexToFloat(hexString));
		this.setFloatingPoint(htb);
	}
	
	public String getS() {
		return S;
	}

	public void setS(String s) {
		S = s;
	}

	public String getEBinary() {
		return EBinary;
	}

	public void setEBinary(String e) {
		EBinary = e;
	}
	
	public String getEDecimal() {
		return EDecimal;
	}

	public void setEDecimal(String eDecimal) {
		EDecimal = eDecimal;
	}

	public String getPDecimal() {
		return PDecimal;
	}

	public void setPDecimal(String p) {
		PDecimal = p;
	}
	
	public String getPBinary() {
		return PBinary;
	}

	public void setPBinary(String pBinary) {
		PBinary = pBinary;
	}

	public String getF() {
		return F;
	}

	public void setF(String f) {
		F = f;
	}

	public String getSEF() {
		return SEF;
	}

	public void setSEF(String sEF) {
		SEF = sEF;
	}

	public HexToBinary getHtb() {
		return htb;
	}

	public void setHtb(HexToBinary htb) {
		this.htb = htb;
	}

	public HexToFloat getHtf() {
		return htf;
	}

	public void setHtf(HexToFloat htf) {
		this.htf = htf;
	}

	public BinaryToDecimal getBtd() {
		return btd;
	}

	public void setBtd(BinaryToDecimal btd) {
		this.btd = btd;
	}
	
	
	private void setFloatingPoint(HexToBinary htb){
		int i = Integer.parseInt(htb.getHexValue(), 16);
	    
	    if(i > 0)
	    	this.setS("0");
	    else
	    	this.setS("1");
	    
	    this.setEBinary(this.getEinString(htb.getBinaryString()));
	    
	    BinaryToDecimal etd = new BinaryToDecimal(this.getEBinary());
	    
	    int e = Integer.parseInt(etd.getDecimalString());
	    this.setEDecimal(String.format("%d", e));
	    int p = e - 127;
	    String P = String.format("%d", p);
	    
	    HexToBinary ptb = new HexToBinary(P);
	    this.setPBinary(ptb.getBinaryString());
	    
	    this.setPDecimal(P);
	    
	    String f = htb.getBinaryString();
	       int index = f.lastIndexOf("1");
	       f = f.substring(8,index+1);
	       
	       this.setF(f);
	       
	       this.setSEF(String.format("1.%s", this.getF()));
	}
	
	private String getEinString(String binaryString){
		String E = "";
		for(int i = 0;i<8;i++){ 
			E+= binaryString.charAt(i);
		}
		return E;
	}
	
	public String toString(){
        String sef = String.format("SEF: %s x2^%s",this.getSEF(),this.getPDecimal());
        String efp = String.format("S: %s\tE: %s F: %s\tP: %s",this.getS(),this.getEBinary(),this.getF(),this.getPDecimal());
        return String.format("Decimal Value: %s\n%s\n%s\nE Decimal: %s\tP Binary: %s ",this.getHtf().getFloatString(),efp,sef,this.getEDecimal(),this.getPBinary());
    }
}

