

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.auto_scaling_group_green](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_eip.nat_eip1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.nat_eip2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_launch_configuration.asg_lauch_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration) | resource |
| [aws_nat_gateway.nat_gateway1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.nat_gateway2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.private_subnet1_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.private_subnet2_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_subnet1_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_subnet2_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private_subnet1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_subnet2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_subnet1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_subnet2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.allow_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.private_subnet1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.group2_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_ami.packer_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_internet_gateway_name"></a> [internet\_gateway\_name](#input\_internet\_gateway\_name) | Name of internet gateway | `string` | `"group2_vpc_igw"` | no |
| <a name="input_nat_gateway1_name"></a> [nat\_gateway1\_name](#input\_nat\_gateway1\_name) | Name of nat gateway1 | `string` | `"vpc_nat_gateway1"` | no |
| <a name="input_nat_gateway2_name"></a> [nat\_gateway2\_name](#input\_nat\_gateway2\_name) | Name of nat gateway2 | `string` | `"vpc_nat_gateway2"` | no |
| <a name="input_private_subnet1_cidr"></a> [private\_subnet1\_cidr](#input\_private\_subnet1\_cidr) | This is the CIDR range for private subnet1 | `string` | `"10.0.3.0/24"` | no |
| <a name="input_private_subnet1_name"></a> [private\_subnet1\_name](#input\_private\_subnet1\_name) | Name of private subnet1 | `string` | `"private_subnet1"` | no |
| <a name="input_private_subnet1_route_table"></a> [private\_subnet1\_route\_table](#input\_private\_subnet1\_route\_table) | (optional) describe your variable | `string` | `"private_subnet1_route_table"` | no |
| <a name="input_private_subnet2_cidr"></a> [private\_subnet2\_cidr](#input\_private\_subnet2\_cidr) | This is the CIDR range for private subnet2 | `string` | `"10.0.4.0/24"` | no |
| <a name="input_private_subnet2_name"></a> [private\_subnet2\_name](#input\_private\_subnet2\_name) | Name of private subnet2 | `string` | `"private_subnet2"` | no |
| <a name="input_private_subnet2_route_table"></a> [private\_subnet2\_route\_table](#input\_private\_subnet2\_route\_table) | (optional) describe your variable | `string` | `"private_subnet2_route_table"` | no |
| <a name="input_public_subnet1_cidr"></a> [public\_subnet1\_cidr](#input\_public\_subnet1\_cidr) | This is the CIDR range for Data subnet | `string` | `"10.0.1.0/24"` | no |
| <a name="input_public_subnet1_name"></a> [public\_subnet1\_name](#input\_public\_subnet1\_name) | Name of public subnet1 | `string` | `"public_subnet1"` | no |
| <a name="input_public_subnet2_cidr"></a> [public\_subnet2\_cidr](#input\_public\_subnet2\_cidr) | This is the CIDR range for Data subnet | `string` | `"10.0.2.0/24"` | no |
| <a name="input_public_subnet2_name"></a> [public\_subnet2\_name](#input\_public\_subnet2\_name) | Name of public subnet2 | `string` | `"public_subnet2"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | Variable to declare VPC CIDR range | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of VPC | `string` | `"Group2_VPC"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_packer_ami"></a> [packer\_ami](#output\_packer\_ami) | n/a |
<!-- END_TF_DOCS -->