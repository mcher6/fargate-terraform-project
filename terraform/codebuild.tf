resource "aws_iam_role" "codebuild_role" {
  name = "codebuild-service-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "codebuild.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "codebuild_policy" {
  name = "codebuild-policy"
  role = aws_iam_role.codebuild_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ecr:*",
          "logs:*",
          "s3:*",
          "ecs:*",
          "cloudwatch:*"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_codebuild_project" "docker_build" {
  name          = "fargate-docker-builder"
  service_role  = aws_iam_role.codebuild_role.arn
  description   = "Builds and pushes Docker image to ECR"
  build_timeout = 10

  source {
    type            = "GITHUB"
    location        = "https://github.com/mcher6/fargate-terraform-project"
    git_clone_depth = 1
    buildspec       = "buildspec.yml"
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
  compute_type                = "BUILD_GENERAL1_SMALL"
  image                       = "aws/codebuild/standard:6.0"
  type                        = "LINUX_CONTAINER"
  privileged_mode             = true

  environment_variable {
    name  = "AWS_REGION"
    value = "us-east-1"
  }

  environment_variable {
    name  = "AWS_ACCOUNT_ID"
    value = "123456789012" # Replace with your real AWS Account ID
  }
}


  source_version = "main"
}

