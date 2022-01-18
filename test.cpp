#include <cassert>
#include "rocksdb/db.h"

using ROCKSDB_NAMESPACE::WriteOptions;
using ROCKSDB_NAMESPACE::ReadOptions;

int main(){
  rocksdb::DB* db;
  rocksdb::Options options;
  options.create_if_missing = true;
  rocksdb::Status status = rocksdb::DB::Open(options, "/tmp/testdb", &db);

  assert(status.ok());//Database opened

  status = db->Put(WriteOptions(), "key1", "value");
  assert(status.ok());//Put succeeds

  std::string value;
  status = db->Get(ReadOptions(), "key1", &value);
  assert(status.ok());
  assert(value == "value");//Get succeeds and returns expected value

  status = db->Close();
  assert(status.ok());// Database closed successfully

  delete db;
}
