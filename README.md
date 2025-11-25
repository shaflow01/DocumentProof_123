# 📄 DocumentProof

**开源文化运动课程作业-基于区块链的去中心化文档签名与验证系统**

---

## 🚀 项目简介

DocumentProof 是一个基于 Solidity 开发的应用型智能合约项目，旨在通过区块链实现文档签名、存证与验证功能。
用户可以将文件的哈希值记录在链上，作为不可篡改的证据，证明文档的签署人及签署时间。

🧾 应用场景包括：

| 场景        | 描述              |
| --------- | --------------- |
| 学术论文/证书验证 | 验证学术成果是否由特定作者提交 |
| 合同签署存证    | 记录签署时间与当事人，防止抵赖 |
| 数字版权登记    | 对作品哈希存证防止抄袭盗用   |
| 公文审批记录    | 保留审批流程中每一步的签名记录 |

---

## ✨ 功能特性

* 📝 文档签名存证（记录签名者 & 时间戳）
* 🔍 文档真实性验证
* 🔄 防止重复签名
* ⛓ 数据永久存储在区块链上，无法篡改

---

## 📦 技术栈

| 技术               | 用途       |
| ---------------- | -------- |
| Solidity ^0.8.18 | 合约开发     |
| Foundry          | 测试、部署、调试 |
| Forge Std        | 工具库      |
| Ethereum / EVM   | 合约运行环境   |

---

## 📂 项目结构

```
DocumentProof/
├── src/
│   └── DocumentProof.sol           # 智能合约核心代码
├── script/
│   └── DeployDocumentProof.s.sol   # 部署脚本
├── test/
│   └── DocumentProof.t.sol         # Foundry 测试文件
├── foundry.toml
└── README.md
```

---

## ⚙️ 安装与运行

### 🔧 环境准备

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

### ⬇️ 克隆仓库

```bash
git clone https://github.com/yourname/DocumentProof.git
cd DocumentProof
```

### 🛠️ 编译合约

```bash
forge build
```

---

## 🧪 测试说明

运行所有测试：

```bash
forge test -vvvv
```

测试覆盖内容：
✔ 文档签名成功
✔ 重复签名拒绝
✔ 查询未存证文档时 revert
✔ 签名时间和地址记录正确

---

## 🚀 部署使用

### 🧪 本地开发环境（Anvil）

```bash
anvil
forge script script/DeployDocumentProof.s.sol --rpc-url http://127.0.0.1:8545 --broadcast
```

### 🌐 测试网部署（Sepolia 示例）

```bash
forge script script/DeployDocumentProof.s.sol \
--rpc-url $SEPOLIA_RPC \
--private-key $PRIVATE_KEY \
--broadcast --verify
```

---

## 📝 合约交互示例

### ▶ 签名文档

```solidity
signDocument("Qm2c3c29b4548c39878fabc...");
```

### ▶ 验证签名

```solidity
(address signer, uint timestamp) = verifyDocument("Qm2c3c29b4548c39878fabc...");
```

### 返回示例

```
Signer: 0xAbC1...dEf3
Timestamp: 1732454891
```

---

## 📸 功能展示逻辑图

```
用户上传文件 → 生成文档哈希 → 提交至合约 signDocument() →
区块链记录签名者 & 时间戳 → verifyDocument() 查询签名状态
```

---

## 🔒 安全性设计

| 风险点     | 说明            | 改进建议                 |
| ------- | ------------- | -------------------- |
| hash 伪造 | 用户可能上传错误 hash | 使用前端 SHA-256 标准计算    |
| 重复注册    | 防止重复签名        | require 检查 timestamp |
| 权限设计    | 任意人可签名        | 可扩展 onlyOwner、ACL    |
| 数据隐私    | 文档不直接上链       | 仅记录 hash，保护内容        |

---

## 📄 许可协议

📄 许可协议：本项目遵循 Time-Limited Non-Commercial License (TLNCL-1.0)，
在发布之日起 1 年内禁止用于商业用途，1 年后自动转为 MIT 开源协议。


---

## 🤝 如何参与贡献

欢迎通过以下方式参与项目：

* 提交 Pull Request
* 提交功能建议或 Issue
* 添加前端交互界面（React/Web3）

---

## ⭐ 如果对你有帮助，欢迎点亮 Star！
