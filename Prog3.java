class Prog3 {
    public static void main(String[] args) {
      String str = args[0];
      String pattern = args[1];
  
      StringBuilder sb = new StringBuilder();
      for (int i = 0; i < str.length() / 8; i++) {
        sb.append("DUT.DM1.Core[" + i + "] = 'b" + str.substring(i * 8, i * 8 + 8) + ";\n");
      }
  
      sb.append("DUT.DM1.Core[32] = 'b" + pattern + "000;");
      System.out.println(sb);
    }
  }