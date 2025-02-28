#!/bin/bash

echo "::group::Build naabu"
rm integration-test naabu 2>/dev/null
cd ../cmd/naabu
go build
mv naabu ../../integration_tests/naabu
echo "::endgroup::"

echo "::group::Build naabu integration-test"
cd ../integration-test
go build
mv integration-test ../../integration_tests/integration-test 
cd ../../integration_tests
echo "::endgroup::"

sudo ./integration-test
if [ $? -eq 0 ]
then
  exit 0
else
  exit 1
fi
