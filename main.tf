resource "aws_eks_cluster" "this" {
  name     = var.name
  role_arn = aws_iam_role.this.arn
  vpc_config {
    subnet_ids = var.subnet_ids
  }
  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.this_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.this_AmazonEKSVPCResourceController,
  ]
  tags = merge(
    var.additional_tags,
    {
      created-by = "iac-tf"
    },
  )
}

resource "aws_iam_role" "this" {
  name               = "${var.name}-assumerole"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "this_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.this.name
}

# Optionally, enable Security Groups for Pods
# Reference: https://docs.aws.amazon.com/eks/latest/userguide/security-groups-for-pods.html
resource "aws_iam_role_policy_attachment" "this_AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.this.name
}
