
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
