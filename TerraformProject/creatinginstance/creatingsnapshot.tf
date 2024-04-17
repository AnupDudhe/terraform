resource "aws_ebs_volume" "example" {
  availability_zone = var.aws_ebs_volume_region
  size              = var.aws_ebs_volume_size

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_ebs_snapshot" "example_snapshot" {
  volume_id = aws_ebs_volume.example.id

  tags = {
    Name = var.aws_instance_map.name
  }
}

