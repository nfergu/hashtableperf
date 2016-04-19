import java.util.HashMap;
import java.util.Map;

public class TestTablePerf {

    public static void main(String[] args) {

        long warmUpIterations = 100000000;
        long mainIterations = 1000000000;
        int maxInt = 10000;

        Map<Integer, Integer> map = new HashMap<Integer, Integer>();

        long sum = 0;

        // Warm-up
        for (long i = 0; i < warmUpIterations; i++) {
            int num1 = (int)i % maxInt;
            int num2 = num1 * 2;
            int num3 = num1 + 1;
            map.put(num1, num2);
            Integer value = map.get(num3);
            if (value != null) {
                // Make sure we do something with the result so that it is not optimized away
                sum += value;
            }
        }

        System.out.println("Map size is " + map.size());

        // Main execution
        long start = System.nanoTime();
        for (long i = 0; i < mainIterations; i++) {
            int num1 = (int)i % maxInt;
            int num2 = num1 * 2;
            int num3 = num1 + 1;
            map.put(num1, num2);
            Integer value = map.get(num3);
            if (value != null) {
                // Make sure we do something with the result so that it is not optimized away
                sum += value;
            }
        }
        System.gc();
        long stop = System.nanoTime();
        long testTime = stop - start;

        // Just to be extra sure nothing can be optimized away at compilation or run-time
        // we print the sum here.
        System.out.println("Sum (ignore this): " + sum);

        System.out.println("Test time: " + ((double) testTime / 1e9d) + " seconds");

    }

}
