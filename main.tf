terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.44.0"
    }
  }
}

provider "aws" {
  # Configuration options
}



# Storage Account con nombre único global (máx 24 chars)
resource "azurerm_storage_account" "sa_utec" {
  # Ejemplo: sautecjose01
  name                     = "sautec${var.student_name}${var.student_id}"
  resource_group_name      = data.azurerm_resource_group.utec_rg.name
  location                 = data.azurerm_resource_group.utec_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  blob_properties {
    versioning_enabled = true
  }

  tags = {
    Entorno = "Laboratorio"
    Curso   = "Arquitectura Multinube"
    Alumno  = var.student_name
  }
}

#Role IAM + policy

resource "aws_iam_role_policy" "test_policy" {
  name = "policyutec${var.student_name}"
  role = aws_iam_role.roleutec${var.student_name}.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "test_role" {
  name = "roleutec${var.student_name}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}
