
public class Main {

    public static void main(String[] args) {

        double encodedValue = Encoder.encode("BILL GATES");
        FrequencyTable table = Encoder.frequencyTable;


        String decodedValue = Decoder.decode(table, encodedValue);
        System.out.println("Decoded Value: " + decodedValue);

    }
}
