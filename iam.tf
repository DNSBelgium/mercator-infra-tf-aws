resource "aws_iam_role" "main" {
  name = "${local.service_name}-common"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "${module.eks.oidc_provider_arn}"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "${module.eks.oidc_provider}:sub": "system:serviceaccount:*:*"
        }
      }
    }
  ]
}
EOF
}

resource "aws_iam_policy" "sqs_policy" {
  name = "${local.service_name}-common-sqs"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "sqs:DeleteMessage",
          "sqs:ReceiveMessage",
          "sqs:SendMessage",
          "sqs:GetQueueUrl",
          "sqs:GetQueueAttributes",
          "sqs:ChangeMessageVisibility",
          "sqs:ChangeMessageVisibilityBatch"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "sqs-attach" {
  role       = aws_iam_role.main.name
  policy_arn = aws_iam_policy.sqs_policy.arn
}

resource "aws_iam_policy" "s3_policy" {
  name = "${local.service_name}-common-s3"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "s3:*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "s3-attach" {
  role       = aws_iam_role.main.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

output "iam_role_arn" {
  value = aws_iam_role.main.arn
}