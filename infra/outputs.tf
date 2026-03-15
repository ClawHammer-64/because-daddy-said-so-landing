output "nameservers" {
  description = "Route53 hosted zone name servers for delegation at your registrar."
  value       = aws_route53_zone.primary.name_servers
}

output "cloudfront_domain" {
  description = "CloudFront distribution domain name."
  value       = aws_cloudfront_distribution.cdn.domain_name
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID."
  value       = aws_cloudfront_distribution.cdn.id
}

output "s3_bucket_name" {
  description = "S3 bucket name for the site."
  value       = aws_s3_bucket.site.bucket
}
