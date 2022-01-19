CXX=g++
CXXFLAGS=-lrt -ldl -lsnappy -lgflags -lz -lzstd -lbz2 -ldl -lpthread -Bstatic -std=c++11

test:
	$(CXX) test.cpp -o test /rocksdb/librocksdb.a -I/rocksdb/include $(CXXFLAGS)
test2:
	$(CXX) test2.cpp -o test2 /rocksdb/librocksdb.a -I/rocksdb/include $(CXXFLAGS)

clean:
	rm -f test test2
