variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "key_name" {
    default = "rundeck"
}
variable "aws_region" {
    default = "us-west-2"
}


# Ubuntu Precise 14.04 LTS (x64)
variable "aws_amis" {
    default = {
        "us-west-2": "ami-eb81f9db"
    }
}

# Specify the provider and access details
provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}

# Our default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "default" {
    name = "tf_gum_sg"
    description = "Used in the terraform"

    # SSH access from anywhere
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # HTTPS access from anywhere
    ingress {
        from_port = 5050
        to_port = 5050
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_launch_configuration" "lc" {
    name = "lc_tf_gum"
    image_id = "${lookup(var.aws_amis, var.aws_region)}"
    instance_type = "m1.small"
    security_groups = ["${aws_security_group.default.name}"]
    key_name = "${var.key_name}"

    # Tags don't appear to be supported
    # User data does not seem to work even though it is documented
    # user_data = "${file('bootstrap.sh')}"
}

# ELBs don't have configurations to attach to ELBs
# Missing quite a bit still https://github.com/hashicorp/terraform/issues/28

resource "aws_autoscaling_group" "asg" {
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  name = "tf_gum_asg"
  max_size = 3
  min_size = 2
  desired_capicity = 3
  force_delete = true
  launch_configuration = "${aws_launch_configuration.lc.name}"
}
