import java.util.ArrayList;

/**
 * Created by Oliver Poole(12022846) on 23/11/15.
 */
public class FrequencyTable {

    ArrayList<Symbol> table = new ArrayList<>();
    int numberOfElements = 0;

    public void addValue(Character element) {
        Symbol symbol = new Symbol(element);

        int index = table.indexOf(symbol);

        if (index != -1) {
            table.get(index).frequency++;
        }
        else {
            table.add(symbol);
        }

        numberOfElements++;
    }

    public Symbol symbolForElement(Character element) {
        Symbol symbol = new Symbol(element);

        int index = table.indexOf(symbol);

        if (index != -1) {
            return table.get(index);
        }
        else {
            return null;
        }
    }
}
