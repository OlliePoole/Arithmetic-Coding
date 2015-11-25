/**
 * Created by Oliver Poole(12022846) on 25/11/15.
 */
public class Decoder {

    public static String decode(FrequencyTable frequencyTable, double encodedValue) {

        /**
         *  Decoding the output string
         */

        String outputString = "";

        for (int x = 0; x < frequencyTable.numberOfElements; x++) {

            for (Symbol symbol : frequencyTable.table) {
                if ((encodedValue > symbol.lowerRange || (int)encodedValue == (int)symbol.lowerRange)
                        && (encodedValue < symbol.upperRange)) {

                    outputString += symbol.character;

                    encodedValue = (encodedValue - symbol.lowerRange) / (symbol.upperRange - symbol.lowerRange);

                    break;
                }
            }
        }

        return outputString;
    }
}
