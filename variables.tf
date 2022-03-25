variable "aws_region" {
  default = "eu-west-1"
  type    = string
}

variable "ecrs" {
  default = [
    "dnsbelgium/mercator/content-crawler",
    "dnsbelgium/mercator/dispatcher",
    "dnsbelgium/mercator/dns-crawler",
    "dnsbelgium/mercator/feature-extraction",
    "dnsbelgium/mercator/ground-truth",
    "dnsbelgium/mercator/mercator-api",
    "dnsbelgium/mercator/mercator-ui",
    "dnsbelgium/mercator/mercator-wappalyzer",
    "dnsbelgium/mercator/muppets",
    "dnsbelgium/mercator/smtp-crawler",
    "dnsbelgium/mercator/ssl-crawler",
    "dnsbelgium/mercator/vat-crawler",
  ]
}