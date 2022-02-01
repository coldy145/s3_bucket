module "s3_bnucket" {
    source                  = "./modules/binary_bucket"
    bucket_name             = "test-bucket-for-s3-tf-module"
}
