public class Prog2
{
    public static void main(String[] args) {
        System.out.println("input low: " + args[0]);
        System.out.println("input upp: " + args[1]);
        String low = new StringBuilder(args[0]).reverse().toString();
        String upp = new StringBuilder(args[1]).reverse().toString();
      
        int l = Integer.parseInt(args[2]);
        int h = Integer.parseInt(args[3]);
      
        int[] b = new int[12];
        b[1] = Integer.parseInt(String.valueOf(low.charAt(3)));
        b[2] = Integer.parseInt(String.valueOf(low.charAt(5)));
        b[3] = Integer.parseInt(String.valueOf(low.charAt(6)));
        b[4] = Integer.parseInt(String.valueOf(low.charAt(7)));
        b[5] = Integer.parseInt(String.valueOf(upp.charAt(1)));
        b[6] = Integer.parseInt(String.valueOf(upp.charAt(2)));
        b[7] = Integer.parseInt(String.valueOf(upp.charAt(3)));
        b[8] = Integer.parseInt(String.valueOf(upp.charAt(4)));
        b[9] = Integer.parseInt(String.valueOf(upp.charAt(5)));
        b[10] = Integer.parseInt(String.valueOf(upp.charAt(6)));
        b[11] = Integer.parseInt(String.valueOf(upp.charAt(7)));
        
        int[] p = new int[9];
        p[0] = Integer.parseInt(String.valueOf(low.charAt(0)));
        p[1] = Integer.parseInt(String.valueOf(low.charAt(1)));
        p[2] = Integer.parseInt(String.valueOf(low.charAt(2)));
        p[4] = Integer.parseInt(String.valueOf(low.charAt(4)));
        p[8] = Integer.parseInt(String.valueOf(upp.charAt(0)));
        
        int[] pp = new int[9];
        pp[8] = b[11] ^ b[10] ^ b[9] ^ b[8] ^ b[7] ^ b[6] ^ b[5];    // p8
        pp[4] = b[11] ^ b[10] ^ b[9] ^ b[8] ^ b[4] ^ b[3] ^ b[2];    // p4
        pp[2] = b[11] ^ b[10] ^ b[7] ^ b[6] ^ b[4] ^ b[3] ^ b[1];    // p2
        pp[1] = b[11] ^ b[9]  ^ b[7] ^ b[5] ^ b[4] ^ b[2] ^ b[1];    // p1
        pp[0] = b[11] ^ b[10] ^ b[9] ^ b[8] ^ b[7] ^ b[6] ^ b[5] ^ b[4] ^ b[3] ^ b[2] ^ b[1] ^ p[8] ^ p[4] ^ p[2] ^ p[1];    // p0
        
        int[] s = new int[4];
        int g = pp[0] ^ p[0];
        s[0] = pp[1] ^ p[1];
        s[1] = pp[2] ^ p[2];
        s[2] = pp[4] ^ p[4];
        s[3] = pp[8] ^ p[8];
        String d_str = String.valueOf(s[3]) + String.valueOf(s[2]) + String.valueOf(s[1]) + String.valueOf(s[0]);
        int d = Integer.parseInt(d_str, 2);
        
        
        String low_out = String.valueOf(b[8]) + String.valueOf(b[7]) + String.valueOf(b[6]) + String.valueOf(b[5]) + String.valueOf(b[4]) + String.valueOf(b[3]) + String.valueOf(b[2]) + String.valueOf(b[1]); 
        String upp_out = String.valueOf(b[11]) + String.valueOf(b[10]) + String.valueOf(b[9]);  
        if (g == 0) {
            if (d == 0) {
                upp_out = "00000" + upp_out;
            }
            else {
                upp_out = "10000" + upp_out;
            }
        }
        else {
            if (d == 0 || d == 1 || d == 2 || d == 4 || d == 8) {
                upp_out = "01000" + upp_out;
            }
            else if (d == 3) {
                upp_out = "01000" + upp_out;
                low_out = String.valueOf(b[8]) + String.valueOf(b[7]) + String.valueOf(b[6]) + String.valueOf(b[5]) + String.valueOf(b[4]) + String.valueOf(b[3]) + String.valueOf(b[2]) + String.valueOf(Math.abs(b[1] - 1));
            }
            else if (d == 5) {
                upp_out = "01000" + upp_out;
                low_out = String.valueOf(b[8]) + String.valueOf(b[7]) + String.valueOf(b[6]) + String.valueOf(b[5]) + String.valueOf(b[4]) + String.valueOf(b[3]) + String.valueOf(Math.abs(b[2] - 1)) + String.valueOf(b[1]);
            }
            else if (d == 6) {
                upp_out = "01000" + upp_out;
                low_out = String.valueOf(b[8]) + String.valueOf(b[7]) + String.valueOf(b[6]) + String.valueOf(b[5]) + String.valueOf(b[4]) + String.valueOf(Math.abs(b[3] - 1)) + String.valueOf(b[2]) + String.valueOf(b[1]);
            }
            else if (d == 7) {
                upp_out = "01000" + upp_out;
                low_out = String.valueOf(b[8]) + String.valueOf(b[7]) + String.valueOf(b[6]) + String.valueOf(b[5]) + String.valueOf(Math.abs(b[4] - 1)) + String.valueOf(b[3]) + String.valueOf(b[2]) + String.valueOf(b[1]);
            }
            else if (d == 9) {
                upp_out = "01000" + upp_out;
                low_out = String.valueOf(b[8]) + String.valueOf(b[7]) + String.valueOf(b[6]) + String.valueOf(Math.abs(b[5] - 1)) + String.valueOf(b[4]) + String.valueOf(b[3]) + String.valueOf(b[2]) + String.valueOf(b[1]);
            }
            else if (d == 10) {
                upp_out = "01000" + upp_out;
                low_out = String.valueOf(b[8]) + String.valueOf(b[7]) + String.valueOf(Math.abs(b[6] - 1)) + String.valueOf(b[5]) + String.valueOf(b[4]) + String.valueOf(b[3]) + String.valueOf(b[2]) + String.valueOf(b[1]);
            }
            else if (d == 11) {
                upp_out = "01000" + upp_out;
                low_out = String.valueOf(b[8]) + String.valueOf(Math.abs(b[7] - 1)) + String.valueOf(b[6]) + String.valueOf(b[5]) + String.valueOf(b[4]) + String.valueOf(b[3]) + String.valueOf(b[2]) + String.valueOf(b[1]);
            }
            else if (d == 12) {
                upp_out = "01000" + upp_out;
                low_out = String.valueOf(Math.abs(b[8] - 1)) + String.valueOf(b[7]) + String.valueOf(b[6]) + String.valueOf(b[5]) + String.valueOf(b[4]) + String.valueOf(b[3]) + String.valueOf(b[2]) + String.valueOf(b[1]);
            }
            else if (d == 13) {
                upp_out = "01000" + String.valueOf(b[11]) + String.valueOf(b[10]) + String.valueOf(Math.abs(b[9] - 1));
            }
            else if (d == 14) {
                upp_out = "01000" + String.valueOf(b[11]) + String.valueOf(Math.abs(b[10] - 1)) + String.valueOf(b[9]);
            }
            else if (d == 15) {
                upp_out = "01000" + String.valueOf(Math.abs(b[11] - 1)) + String.valueOf(b[10]) + String.valueOf(b[9]);
            }
        }
        
        System.out.println("if (DUT.DM1.Core[" + l + "] != 'b" + low_out + ") begin\n\t$display(\"ERROR, mem[" + l + "] should be %b, but is %b\", 8'b" + low_out + ", DUT.DM1.Core[" + l + "]);\nend");
        System.out.println("if (DUT.DM1.Core[" + h + "] != 'b" + upp_out + ") begin\n\t$display(\"ERROR, mem[" + h + "] should be %b, but is %b\", 8'b" + upp_out + ", DUT.DM1.Core[" + h + "]);\nend");
    }
}
