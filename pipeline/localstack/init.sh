#!/bin/bash

echo "rotating the bad rows file so enrich can boot up"
mv /snowplow/enrich-tmp/bad-rows "/snowplow/enrich-tmp/bad-rows-$(date +%s)"

echo "creating the raw kinesis stream"
awslocal kinesis create-stream --stream-name good

echo "creating the bad kinesis stream"
awslocal kinesis create-stream --stream-name bad

echo "creating the good kinesis stream"
awslocal kinesis create-stream --stream-name enriched

exit 0