# CAN 协议栈开发前置准备

## NJLike 文件放置约定

请将 NJLike 相关文件放置到以下路径：

- 头文件：`third_party/njlike/include/ICANCmd.h`
- 静态库：`third_party/njlike/lib/CanCmd.lib`
- 动态库：`third_party/njlike/bin/CanCmd.dll`

仓库不提交二进制文件，请在本地补齐后再构建。

## qmake 构建后 DLL 部署

qmake 构建时会在 Windows 平台通过 `QMAKE_POST_LINK` 自动将
`third_party/njlike/bin/CanCmd.dll` 拷贝到输出目录（`$$OUT_PWD`，
如为 `debug/` 或 `release/` 子目录则拷贝到最终可执行文件同级目录）。

## USB 2 通道卡通道号约定

- `ch0`：总线 A
- `ch1`：总线 B

后续协议栈实现将遵循该通道号约定。
