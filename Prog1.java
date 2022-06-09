public class Prog1
{
    public static void main(String[] args) {
        String low = new StringBuilder(args[0]).reverse().toString();
        String upp = new StringBuilder(args[1]).reverse().toString();
        int l = Integer.parseInt(args[2]);
        int h = Integer.parseInt(args[3]);
        
        int[] b = new int[12];
        for (int i = 0; i < 8; i++) {
            b[i+1] = Integer.parseInt(String.valueOf(low.charAt(i)));
        }
        for (int i = 8; i < 11; i++) {
            b[i+1] = Integer.parseInt(String.valueOf(upp.charAt(i - 8)));
        }
        int[] p = new int[9];
        p[8] = b[11] ^ b[10] ^ b[9] ^ b[8] ^ b[7] ^ b[6] ^ b[5];    // p8
        p[4] = b[11] ^ b[10] ^ b[9] ^ b[8] ^ b[4] ^ b[3] ^ b[2];    // p4
        p[2] = b[11] ^ b[10] ^ b[7] ^ b[6] ^ b[4] ^ b[3] ^ b[1];    // p2
        p[1] = b[11] ^ b[9]  ^ b[7] ^ b[5] ^ b[4] ^ b[2] ^ b[1];    // p1
        p[0] = b[11] ^ b[10] ^ b[9] ^ b[8] ^ b[7] ^ b[6] ^ b[5] ^ b[4] ^ b[3] ^ b[2] ^ b[1] ^ p[8] ^ p[4] ^ p[2] ^ p[1];    // p0
        
        String low_out = String.valueOf(b[4]) + String.valueOf(b[3]) + String.valueOf(b[2]) + String.valueOf(p[4]) + String.valueOf(b[1]) + String.valueOf(p[2]) + String.valueOf(p[1]) + String.valueOf(p[0]);
        String upp_out = String.valueOf(b[11]) + String.valueOf(b[10]) + String.valueOf(b[9]) + String.valueOf(b[8]) + String.valueOf(b[7]) + String.valueOf(b[6]) + String.valueOf(b[5]) + String.valueOf(p[8]);  
        
        System.out.println("if (DUT.DM1.Core[" + l + "] != 'b" + low_out + ") begin\n\t$display(\"ERROR, mem[" + l + "] should be %b, but is %b\", 8'b" + low_out + ", DUT.DM1.Core[" + l + "]);\nend");
        System.out.println("if (DUT.DM1.Core[" + h + "] != 'b" + upp_out + ") begin\n\t$display(\"ERROR, mem[" + h + "] should be %b, but is %b\", 8'b" + upp_out + ", DUT.DM1.Core[" + h + "]);\nend");
    }
}