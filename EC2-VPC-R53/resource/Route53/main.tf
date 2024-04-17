#creating Route53

resource "aws_route53_zone" "exampleDomain" {
  name = var.domainName
}


resource "aws_route53_record" "exampleDomain-a" {
  zone_id = aws_route53_zone.exampleDomain.zone_id
  name    = var.domainName
  type    = "A"
  ttl     = 300
  records = [var.route53_name]
#   alias {
#    name = var.route53_name
#    zone_id = aws_route53_zone.exampleDomain.zone_id
#    evaluate_target_health = true
#  }


#   alias {
#     name                   = aws_s3_bucket.example.website_endpoint
#     zone_id                = aws_s3_bucket.example.hosted_zone_id
#     evaluate_target_health = true
#   }
}