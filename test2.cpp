#include <cassert>
#include "rocksdb/db.h"

using ROCKSDB_NAMESPACE::ReadOptions;
using ROCKSDB_NAMESPACE::WriteOptions;

int main()
{
	rocksdb::DB *db;
	rocksdb::Options options;
	std::string value;

	options.create_if_missing = false;
	rocksdb::Status status = rocksdb::DB::Open(options, "/tmp/testdb", &db);
	assert(status.ok());

	status = db->Get(ReadOptions(), "key1", &value);
	assert(status.ok());
	assert(value == "value"); //Get succeeds and returns expected value

	status = db->Close();
	assert(status.ok()); // Database closed successfully

	delete db;
}
