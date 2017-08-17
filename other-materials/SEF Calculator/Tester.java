import java.util.Scanner;

public class Tester {

	private static Scanner input;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		input = new Scanner(System.in);
		
		System.out.print("Enter Hexadecimal1: ");
		String hex1 = input.nextLine(); 
		FloatingPoint fp1 = new FloatingPoint(hex1);
		System.out.print("Enter Hexadecimal2: ");
		String hex2 = input.nextLine(); 
		FloatingPoint fp2 = new FloatingPoint(hex2);
		
		System.out.println("\nnum1: \n" + fp1.toString());
        System.out.println("\nnum2: \n"+ fp2.toString());
		
		
			
	}

}
