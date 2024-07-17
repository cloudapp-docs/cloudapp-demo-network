网络编排 示例应用包
=================
本应用包的主要功能包含：如何使用安装参数、如何获取VPC ID、如何获取子网ID


安装参数
=================
通过在 ```package.yaml``` 中声明 ```args``` 来定义安装参数表单

支持的组件清单：[云应用 - 安装参数组件列表](https://cloud.tencent.com/document/product/1689/90578)

网络选择组件：[云应用 - 安装参数 - 网络选择组件](https://cloud.tencent.com/document/product/1689/90578#bffa2e7f-556b-4dc9-aa38-670b938bb816)

## package.yaml 定义示例
```yaml
# 应用 ID，需修改成自己的应用 ID（在开发者中心获取）
id: ${packageId}

# 安装参数，通过 widget 来声明安装表单
args:
  - name: network
    label: 网络选择
    widget: subnet-select
```

定义变量，接收 [网络选择组件] 的输入
```sh
# 定义变量，用于接收 [网络选择组件] 的输入，变量名称需要与组件定义的名称（name）一致
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

```
使用变量：参考 ```/infrastructure/cvm.tf``` 文件


VPC ID
=================
获取 VPC 信息有两种方式：

- 用户自己选择已有的 VPC

- 帮用户创建 VPC 



子网 ID
=================
获取 子网 信息有两种方式

- 用户自己选择已有的 子网

- 通过资源定义帮用户创建新的 子网


