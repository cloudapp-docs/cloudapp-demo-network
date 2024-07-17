
# VPC 定义
resource "tencentcloud_vpc" "demo_vpc" {
  # VPC 名称
  name = "demo_vpc"

  # 可用区（例：广州六区）
  availability_zone = "ap-guangzhou-6"

  # vpc 的 cidr，仅能在10.0.0.0/12，172.16.0.0/12，192.168.0.0/16这三个内网网段内。
  cidr_block = "172.16.0.0/12"

  # DNS 地址，最多支持4个。
  dns_servers = ["183.60.82.98", "183.60.83.19"]

  # 是否开启组播。true: 开启, false: 不开启。
  is_multicast = "false"
}

# 子网 定义
resource "tencentcloud_subnet" "demo_subnet" {
  # 子网名称
  name = "demo_subnet"

  # 可用区（例：广州六区）
  availability_zone = "ap-guangzhou-6"

  # 子网网段，子网网段必须在 VPC 网段内，相同 VPC 内子网网段不能重叠。
  cidr_block = "172.16.0.0/16"

  # 子网是否开启广播。"true"/"false"
  is_multicast = "false"

  # VPC ID（与上方创建的 VPC 关联）
  vpc_id = tencentcloud_vpc.demo_vpc.id
}
