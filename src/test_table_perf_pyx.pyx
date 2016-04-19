from timeit import default_timer as timer
import gc

cdef long warmUpIterations = 100000000
cdef long mainIterations = 1000000000
cdef int maxInt = 10000

cdef dict map = {}

cdef long sum = 0

cdef int num1 = 0
cdef int num2 = 0
cdef int num3 = 0
cdef int value = 0

cdef int i = 0

# Warm-up
for i in xrange(warmUpIterations):
    num1 = i % maxInt
    num2 = num1 * 2
    num3 = num1 + 1
    map[num1] = num2
    value = map.get(num3, -1)
    if value >= 0:
        # Make sure we do something with the result so that it is not optimized away
        sum += value

print("Map size is " + str(len(map)))

# Main execution
cdef double start = timer()
for i in xrange(mainIterations):
    num1 = i % maxInt
    num2 = num1 * 2
    num3 = num1 + 1
    map[num1] = num2
    value = map.get(num3, -1)
    if value >= 0:
        # Make sure we do something with the result so that it is not optimized away
        sum += value
gc.collect()
cdef double stop = timer()
cdef double testTime = stop - start

# Just to be extra sure nothing can be optimized away at compilation or run-time
# we print the sum here.
print("Sum (ignore this): " + str(sum))

print("Test time: " + str(testTime) + " seconds")