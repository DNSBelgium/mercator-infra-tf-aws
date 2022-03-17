locals {
  service_name = "mercator"
}

resource "aws_sqs_queue" "muppets_input" {
  name                       = "${local.service_name}-muppets-input"
  visibility_timeout_seconds = 900

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.muppets_input_dlq.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "muppets_input_dlq" {
  name                      = "${local.service_name}-muppets-input-dlq"
  message_retention_seconds = 1209600 # 14 days
}

resource "aws_sqs_queue" "muppets_output" {
  name              = "${local.service_name}-muppets-output"

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.muppets_output_dlq.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "muppets_output_dlq" {
  name                      = "${local.service_name}-muppets-output-dlq"
  message_retention_seconds = 1209600 # 14 days
}

resource "aws_sqs_queue" "dns-crawler_input" {
  name                       = "${local.service_name}-dns-crawler-input"
  visibility_timeout_seconds = 300

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dns-crawler_input_dlq.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "dns-crawler_input_dlq" {
  name                      = "${local.service_name}-dns-crawler-input-dlq"
  message_retention_seconds = 1209600 # 14 days
}

resource "aws_sqs_queue" "dispatcher_input" {
  name = "${local.service_name}-dispatcher-input"

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dispatcher_input_dlq.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "dispatcher_input_dlq" {
  name                      = "${local.service_name}-dispatcher-input-dlq"
  message_retention_seconds = 1209600 # 14 days
}

resource "aws_sqs_queue" "dispatcher_ack" {
  name              = "${local.service_name}-dispatcher-ack"

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dispatcher_ack_dlq.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "dispatcher_ack_dlq" {
  name                      = "${local.service_name}-dispatcher-ack-dlq"
  message_retention_seconds = 1209600 # 14 days
}

resource "aws_sqs_queue" "dispatcher_output" {
  name                       = "${local.service_name}-dispatcher-output"
  visibility_timeout_seconds = 300

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dispatcher_output_dlq.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "dispatcher_output_dlq" {
  name                      = "${local.service_name}-dispatcher-output-dlq"
  message_retention_seconds = 1209600 # 14 days
}

// Content Crawler

resource "aws_sqs_queue" "content-crawler_input" {
  name                       = "${local.service_name}-content-crawler-input"
  visibility_timeout_seconds = 300

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.content-crawler_input_dlq.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "content-crawler_input_dlq" {
  name                      = "${local.service_name}-content-crawler-input-dlq"
  message_retention_seconds = 1209600 # 14 days
}

// SMTP Crawler

resource "aws_sqs_queue" "smtp-crawler_input" {
  name                       = "${local.service_name}-smtp-crawler-input"
  visibility_timeout_seconds = 900

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.smtp-crawler_input_dlq.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "smtp-crawler_input_dlq" {
  name                      = "${local.service_name}-smtp-crawler-input-dlq"
  message_retention_seconds = 1209600 # 14 days
}

// VAT Crawler

resource "aws_sqs_queue" "vat-crawler_input" {
  name                       = "${local.service_name}-vat-crawler-input"
  visibility_timeout_seconds = 900

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.vat-crawler_input_dlq.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "vat-crawler_input_dlq" {
  name                      = "${local.service_name}-vat-crawler-input-dlq"
  message_retention_seconds = 1209600 # 14 days
}

resource "aws_sqs_queue" "wappalyzer_input" {
  name                       = "${local.service_name}-wappalyzer-input"
  visibility_timeout_seconds = 900

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.wappalyzer_input_dlq.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "wappalyzer_input_dlq" {
  name                      = "${local.service_name}-wappalyzer-input-dlq"
  message_retention_seconds = 1209600 # 14 days
}

resource "aws_sqs_queue" "wappalyzer_output" {
  name              = "${local.service_name}-wappalyzer-output"

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.wappalyzer_output_dlq.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "wappalyzer_output_dlq" {
  name                      = "${local.service_name}-wappalyzer-output-dlq"
  message_retention_seconds = 1209600 # 14 days
}

resource "aws_sqs_queue" "ssl-crawler_input" {
  name                       = "${local.service_name}-ssl-crawler-input"
  visibility_timeout_seconds = 900

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.ssl-crawler_input_dlq.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "ssl-crawler_input_dlq" {
  name                      = "${local.service_name}-ssl-crawler-input-dlq"
  message_retention_seconds = 1209600 # 14 days
}

resource "aws_sqs_queue" "ssl-crawler_output" {
  name              = "${local.service_name}-ssl-crawler-output"

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.ssl-crawler_output_dlq.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "ssl-crawler_output_dlq" {
  name                      = "${local.service_name}-ssl-crawler-output-dlq"
  message_retention_seconds = 1209600 # 14 days
}
