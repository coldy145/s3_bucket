resource "aws_s3_bucket" "s3_bucket" {
  bucket         = var.bucket_name
  force_destroy  = "false"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:GetObjectAcl",
        "s3:ListBucket",
        "s3:GetObjectVersion",
        "s3:GetBucketLocation"
      ],
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam::217685855605:root",
          "arn:aws:iam::918958805876:root",
          "arn:aws:iam::017188508786:root",
          "arn:aws:iam::867289402855:root",
          "arn:aws:iam::303600032410:root"
        ]
      },
      "Resource": [
        "arn:aws:s3:::${var.bucket_name}",
        "arn:aws:s3:::${var.bucket_name}/*"
      ]
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }
}