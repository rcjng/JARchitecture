public class Prog3Result
{
    public static void main(String[] args) {
        String str = args[0];
        String pattern = args[1];
        
        System.out.println("Input: " + str);
        System.out.println("Pattern: " + pattern);
        
        int count = 0;
        int byte_count = 0;
        int total = 0;
        
        for (int i = 0; i < str.length(); i += 8) {
            boolean counted = false;
            String str_byte = str.substring(i, i + 8);
            for (int j = 0; j < str_byte.length() - 4; j++) {
                if (str_byte.substring(j, j + 5).equals(pattern)) {
                    count++;
                    if (!counted) {
                        byte_count++;
                        counted = true;
                    }
                }
            }
        }
        
        for (int i = 0; i < str.length() - 4; i++) {
            if (str.substring(i, i + 5).equals(pattern)) {
                total++;           
            }
        }
        String count_str = Integer.toBinaryString(count);
        while (count_str.length() < 8) {
            count_str = "0" + count_str;
        }
        String byte_count_str = Integer.toBinaryString(byte_count);
        while (byte_count_str.length() < 8) {
            byte_count_str = "0" + byte_count_str;
        }
        String total_str = Integer.toBinaryString(total);
        while (total_str.length() < 8) {
            total_str = "0" + total_str;
        }
        System.out.println("if (DUT.DM1.Core[33] != 'b" + count_str + ") begin\n\t$display(\"ERROR, mem[33] should be %b, but is %b\", 8'b" + count_str + ", DUT.DM1.Core[33]);\nend");
        System.out.println("if (DUT.DM1.Core[34] != 'b" + byte_count_str + ") begin\n\t$display(\"ERROR, mem[34] should be %b, but is %b\", 8'b" + byte_count_str + ", DUT.DM1.Core[34]);\nend");
        System.out.println("if (DUT.DM1.Core[35] != 'b" + total_str + ") begin\n\t$display(\"ERROR, mem[35] should be %b, but is %b\", 8'b" + total_str + ", DUT.DM1.Core[35]);\nend");
    }
}