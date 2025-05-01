resource "ovh_cloud_project_user" "s3_admin_user" {
  service_name = var.ovh_service_name
  description  = "User created by S3 Terraform script"
  role_name    = "objectstore_operator"
}

resource "ovh_cloud_project_user_s3_credential" "s3_admin_cred" {
  service_name = var.ovh_service_name
  user_id      = ovh_cloud_project_user.s3_admin_user.id
}

resource "aws_s3_bucket" "b" {
  bucket = "${var.ovh_service_name}-${var.bucket_name}"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.b.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

