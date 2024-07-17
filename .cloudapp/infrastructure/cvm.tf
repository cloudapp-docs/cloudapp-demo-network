# 声明随机密码（通过站内信发送密码内容）
resource "random_password" "common_random" {
  length           = 16
  override_special = "_+-&=!@#$%^*()"
}

# CVM 实例
resource "tencentcloud_instance" "demo_cvm" {
  # 可用区（例：广州六区）
  availability_zone = "ap-guangzhou-6"

  # 有效的 CVM 镜像ID，格式形如：img-xxx，公共镜像、自定义镜像、共享镜像的镜像ID可通过登录控制台查询
  image_id = "img-eb30mz89"

  # 购买实例数量，包年包月实例取值范围：[1，500]，按量计费实例取值范围：[1，500]
  count = 1

  # 付费类型（例：按小时后付费）
  instance_charge_type = "POSTPAID_BY_HOUR"

  # CVM机型（例：SA5.MEDIUM2）
  instance_type = "SA5.MEDIUM2"

  # VPC ID（替换成自己的 VPC ID）
  vpc_id = tencentcloud_vpc.demo_vpc.id

  # 子网 ID（替换成自己的 子网ID）
  subnet_id = tencentcloud_subnet.demo_subnet.id

  # 实例密码（例：随机密码）
  password = random_password.common_random.result
}
