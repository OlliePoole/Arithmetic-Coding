import sun.jvm.hotspot.debugger.cdbg.Sym;

import java.util.Arrays;

/**
 * Created by Oliver Poole(12022846) on 25/11/15.
 */
public class Encoder {

    static FrequencyTable frequencyTable = new FrequencyTable();

    public static double encode(String inputString) {

        int numberOfElements = inputString.length();

        // Sort the characters in the inputString
        char[] splitString = inputString.toCharArray();
        Arrays.sort(splitString);

        String sortedInputString = new String(splitString);

        double previousLower = 0.0;
        double probability;

        /**
         * Add the values to the frequency table
         */

        for (char character : sortedInputString.toCharArray()) {
            frequencyTable.addValue(character);
        }


        /**
         *  Generate the frequency table
         */

        for (Symbol symbol : frequencyTable.table) {

            probability = (double) symbol.frequency / numberOfElements;

            symbol.lowerRange = previousLower;
            symbol.upperRange = probability + previousLower;

            previousLower = probability + previousLower;
        }



        /**
         *  Encoding the input string
         */

        double lower = 0.0;
        double upper = 1.0;

        for (char inputCharacter: inputString.toCharArray()) {
            double range = upper - lower;

            Symbol symbol = frequencyTable.symbolForElement(inputCharacter);

            upper = lower + symbol.upperRange * range;
            lower = lower + symbol.lowerRange * range;
        }

        return lower;

    }
}
