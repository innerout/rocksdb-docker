CXX=g++
CXXFLAGS=-O2 -lrt -ldl -lsnappy -lgflags -lz -lzstd -lbz2 -ldl -lpthread -Bstatic -std=c++11

test:
	$(CXX) test.cpp -o test /rocksdb/librocksdb.a -I/rocksdb/include $(CXXFLAGS)
clean:
	rm -f test
