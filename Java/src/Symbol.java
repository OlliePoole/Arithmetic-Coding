/**
 * Created by Oliver Poole(12022846) on 23/11/15.
 */
public class Symbol {

    char character;
    int frequency = 1;

    double upperRange = 1.0;
    double lowerRange = 0.0;

    public Symbol(char character) {
        this.character = character;
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof Symbol)) {
            return false;
        }

        Symbol rhs = (Symbol)obj;
        return this.character == rhs.character;
    }
}


