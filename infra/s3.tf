resource "random_string" "suffix" {
    length = 6
    upper = false
    lower = true
    numeric = true
    special = false
}


resource "aws_s3_bucket" "bucket" {
    bucket = "${var.project_name}-${random_string.suffix.result}"
    force_destroy = true
    tags = merge(local.tags, { Name = "${var.project_name}-bucket" })
}


resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.bucket.id
    versioning_configuration {
        status = "Enabled"
    }
}