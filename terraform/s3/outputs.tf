output "all" {
  value = {
    aws_s3_bucket_static : aws_s3_bucket.static,
    aws_s3_bucket_public_access_block_static : aws_s3_bucket_public_access_block.static,
  }
}
