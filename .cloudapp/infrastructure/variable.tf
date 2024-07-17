
# 定义变量，用于接收 网络选择组件 的输入，变量名称需要与组件定义的名称（name）一致
variable "network" {
  type = object({
    region    = string
    region_id = string
    vpc = object({
      id         = string
      cidr_block = string
    })
    subnet = object({
      id   = string
      zone = string
    })
  })
}

# 接收开关组件输入
variable "switch" {
  type = bool
}

# 接收输入框的值
variable "text" {
  type = string
}

# 接收安全组选择的值
variable "securityGroup" {
  type = object({
    region    = string
    region_id = string
    security_group = object({
      id = string
    })
    security_groups = list(string)
  })
}
