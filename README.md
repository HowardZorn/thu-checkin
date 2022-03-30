# 清华大学每日健康打卡 systemd 版

感谢原作者iBug，这是本人的改进版本。

环境要求：

- 一个 24 小时开机的 Linux 操作系统（需要使用 systemd，如 Ubuntu 18.04, Debian Stretch, CentOS 7, Fedora 等，树莓派也行）
- Tesseract
  - Ubuntu 和 Debian 可以直接使用 `apt install tesseract-ocr` 安装，其他发行版请自行解决安装问题
- Python 3，并且安装了一些库：
  - requests（可以直接安装系统软件源提供的 `python3-requests` 包，也可以从 PyPI 安装，没有区别）
  - pillow（`apt install python3-pil` 或 `pip3 install pillow`）
  - pytesseract

## 使用方法

- 用特权用户运行 `install.sh`
- 执行 `systemctl enable --now thu-checkin@你的用户名.timer`
- 在 `~/.config` 目录下创建 [`thu-checkin.txt` 文件](thu-checkin.example.txt)（联系人部分请不要直接使用，会社死的），填入以下内容：

    ```ini
    USERNAME=清华大学用户电子身份服务系统学号
    PASSWORD=清华大学用户电子身份服务系统密码
    JUZHUDI=居住地
    REASON=出校原因
    RETURN_COLLEGE=进出校区
    DORM_BUILDING=宿舍楼
    DORM=宿舍
    EMERGENCY_NAME=紧急联系人姓名
    EMERGENCY_RELATION=紧急联系人关系
    EMERGENCY_NUM=紧急联系人电话
    ```

    其中居住地 `JUZHUDI` 直接填写文字，可选的取值为：

    - 东校区
    - 西校区
    - 南校区
    - 北校区
    - 中校区
    - 高新校区
    - 先研院
    - 国金院
    - 合肥市内校外
    - 合肥市外校区

    出校原因 `REASON` 的取值为：

    | 值 | 含义                   |
    | -- | ---------------------- |
    | 1  | 特殊原因前往合肥市外   |
    | 2  | 合肥市内就医等紧急情况 |
    | 3  | 跨校区上课、实验等     |
    | 4  | 前往先研院、高新园区   |
    | 5  | 前往国金院             |

    进出校区 `RETURN_COLLEGE` 为一个或多个校区名称，用空格分隔。

    出校原因 `REASON` 和进出校区 `RETURN_COLLEGE` 用于填报出校申请。推荐使用 `REASON=3`。

本套件默认在系统本地时间每天 8:00 至 11:00 之间随机选择一个时间打卡一次，请确保你的系统时钟和时区设置是正确的，或者自行编辑 `thu-checkin.timer` 文件设置打卡时间。

你可以使用 `systemctl status thu-checkin@你的用户名.timer` 查看打卡记录和下次打卡时间。

## 许可

本项目以 MIT 协议开源，详情请见 [LICENSE](LICENSE) 文件。
