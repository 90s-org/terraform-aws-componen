locals {
    ami_id =  data.aws_ami.joindevops.id
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }
    # public subnet in 1a AZ
    private_subnet_id = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
    component_sg_id = data.aws_ssm_parameter.sg_id.value
    backend_alb_listener_arn = data.aws_ssm_parameter.backend_alb_listener_arn.value
    frontend_alb_listener_arn = data.aws_ssm_parameter.frontend_alb_listener_arn.value
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    host_header = var.component == "frontend" ? "${var.project}-${var.environment}.${var.domain_name}" : "${var.component}.backend-alb-${var.environment}.${var.domain_name}"
}