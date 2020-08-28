#Instance Profile for APP server
resource "aws_iam_instance_profile" "P1-APP-Instance-Profile" {
  name = "P1-APP-Instance-Profile"
  role = aws_iam_role.P1-APP-IAM-Role.name
}

#IAM Role for APP Server
resource "aws_iam_role" "P1-APP-IAM-Role" {
  name               = "P1-APP-IAM-Role"
  assume_role_policy = file(var.app-iam-role-path)
}

#IAM Role Policy for APP server
resource "aws_iam_role_policy" "P1-APP-IAM-Role-Policy" {
  name   = "P1-APP-IAM-Role-Policy"
  role   = aws_iam_role.P1-APP-IAM-Role.id
  policy = file(var.app-iam-role-policy-path)
}
