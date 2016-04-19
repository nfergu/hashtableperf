from timeit import default_timer as timer
import gc

warmUpIterations = 100000000
mainIterations = 1000000000
maxInt = 10000

map = {}

sum = 0

# Warm-up
for i in xrange(warmUpIterations):
    num1 = i % maxInt
    num2 = num1 * 2
    num3 = num1 + 1
    map[num1] = num2
    value = map.get(num3, None)
    if value:
        # Make sure we do something with the result so that it is not optimized away
        sum += value

print("Map size is " + str(len(map)))

# Main execution
start = timer()
for i in xrange(mainIterations):
    num1 = i % maxInt
    num2 = num1 * 2
    num3 = num1 + 1
    map[num1] = num2
    value = map.get(num3, None)
    if value:
        # Make sure we do something with the result so that it is not optimized away
        sum += value
gc.collect()
stop = timer()
testTime = stop - start

# Just to be extra sure nothing can be optimized away at compilation or run-time
# we print the sum here.
print("Sum (ignore this): " + str(sum))

print("Test time: " + str(testTime) + " seconds")