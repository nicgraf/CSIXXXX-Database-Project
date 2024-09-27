package Project_web_app;

/*
 * A simple Pair class for the login service.
 * I know you can import Pairs from the java.util, but I did not realize
 * this in the stress of when I was originally making this project
 *
 * Nic Graf 2024 for CSI2132
 */

public class Pair<F, S> {
    private F first;
    private S second;

    public Pair(F first, S second) {
        this.first = first;
        this.second = second;
    }

    public F getFirst() {
        return first;
    }

    public S getSecond() {
        return second;
    }

    public void setFirst(F F){
        this.first = F;
    }

    public void setSecond(S S){
        this.second = S;
    }
}
