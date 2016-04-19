#!/bin/bash

set -x

/usr/local/clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04/bin/clang++ -otesttableperf -std=c++11 -O0 src/test_table_perf.cpp
for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    ./testtableperf
done

/usr/local/clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04/bin/clang++ -otesttableperf -std=c++11 -O1 src/test_table_perf.cpp
for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    ./testtableperf
done

/usr/local/clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04/bin/clang++ -otesttableperf -std=c++11 -O2 src/test_table_perf.cpp
for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    ./testtableperf
done

/usr/local/clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04/bin/clang++ -otesttableperf -std=c++11 -O3 src/test_table_perf.cpp
for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    ./testtableperf
done

/usr/bin/g++-4.9 -otesttableperf -std=c++11 -O0 src/test_table_perf.cpp
for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    ./testtableperf
done

/usr/bin/g++-4.9 -otesttableperf -std=c++11 -O1 src/test_table_perf.cpp
for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    ./testtableperf
done

/usr/bin/g++-4.9 -otesttableperf -std=c++11 -O2 src/test_table_perf.cpp
for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    ./testtableperf
done

/usr/bin/g++-4.9 -otesttableperf -std=c++11 -O3 src/test_table_perf.cpp
for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    ./testtableperf
done

/usr/bin/g++-5 -otesttableperf -std=c++11 -O0 src/test_table_perf.cpp
for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    ./testtableperf
done

/usr/bin/g++-5 -otesttableperf -std=c++11 -O1 src/test_table_perf.cpp
for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    ./testtableperf
done

/usr/bin/g++-5 -otesttableperf -std=c++11 -O2 src/test_table_perf.cpp
for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    ./testtableperf
done

/usr/bin/g++-5 -otesttableperf -std=c++11 -O3 src/test_table_perf.cpp
for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    ./testtableperf
done

/usr/lib/jdk1.6.0_45/bin/javac -d . src/TestTablePerf.java
for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    /usr/lib/jdk1.6.0_45/bin/java -mx512m -XX:NewSize=128m -XX:MaxNewSize=128m -XX:-UseParallelOldGC -XX:ParallelGCThreads=1 TestTablePerf
done

for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    /usr/lib/jdk1.6.0_45/bin/java -mx512m -XX:NewSize=128m -XX:MaxNewSize=128m -XX:-UseParallelOldGC -XX:ParallelGCThreads=1 -XX:+AggressiveOpts TestTablePerf
done


/usr/lib/jdk1.7.0_79/bin/javac -d . src/TestTablePerf.java
for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    /usr/lib/jdk1.7.0_79/bin/java -mx512m -XX:NewSize=128m -XX:MaxNewSize=128m -XX:-UseParallelOldGC -XX:ParallelGCThreads=1 TestTablePerf
done

for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    /usr/lib/jdk1.7.0_79/bin/java -mx512m -XX:NewSize=128m -XX:MaxNewSize=128m -XX:-UseParallelOldGC -XX:ParallelGCThreads=1 -XX:+AggressiveOpts TestTablePerf
done

/usr/lib/jdk1.8.0_74/bin/javac -d . src/TestTablePerf.java
for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    /usr/lib/jdk1.8.0_74/bin/java -mx512m -XX:NewSize=128m -XX:MaxNewSize=128m -XX:-UseParallelOldGC -XX:ParallelGCThreads=1 TestTablePerf
done

for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    /usr/lib/jdk1.8.0_74/bin/java -mx512m -XX:NewSize=128m -XX:MaxNewSize=128m -XX:-UseParallelOldGC -XX:ParallelGCThreads=1 -XX:+AggressiveOpts TestTablePerf
done

for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    python2.7 src/test_table_perf.py
done

for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    python3.5 src/test_table_perf-python3.py
done

cython --embed -o src/test_table_perf_pyx.c  src/test_table_perf_pyx.pyx

gcc -O1 -I /usr/include/python2.7 -o src/test_table_perf_pyx src/test_table_perf_pyx.c -lpython2.7 -lpthread -lm -lutil -ldl
for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    src/test_table_perf_pyx
done

gcc -O2 -I /usr/include/python2.7 -o src/test_table_perf_pyx src/test_table_perf_pyx.c -lpython2.7 -lpthread -lm -lutil -ldl
for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    src/test_table_perf_pyx
done

gcc -O3 -I /usr/include/python2.7 -o src/test_table_perf_pyx src/test_table_perf_pyx.c -lpython2.7 -lpthread -lm -lutil -ldl
for i in `seq 1 3`;
do
    echo Iteration $i ------------------------------------------------------------------
    src/test_table_perf_pyx
done