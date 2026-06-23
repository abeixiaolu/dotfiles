### 基础设置，酌情选择

```bash
# 自动隐藏 Dock
defaults write com.apple.dock autohide -bool true
# Dock 图标大小
defaults write com.apple.dock tilesize -int 30
# 开启放大效果
defaults write com.apple.dock magnification -bool true
# 放大后的最大尺寸
defaults write com.apple.dock largesize -int 80
# 自动隐藏动画速度（仅在开启 autohide 时有效）
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.2
# 显示运行指示灯
defaults write com.apple.dock show-process-indicators -bool true
# 关闭“最近使用的应用”
defaults write com.apple.dock show-recents -bool false

########################################
# 键盘速度
########################################
# 按住开始重复的延迟（越小越快）
defaults write -g InitialKeyRepeat -int 15
# 重复速度（1 = 极快）
defaults write -g KeyRepeat -int 1

########################################
# 触控板
########################################
# 指针移动速度
defaults write -g com.apple.trackpad.scaling -float 2.5
# 滚动速度
defaults write -g com.apple.trackpad.scrolling -float 0.3125
# 轻点点击
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# 三指拖移
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
```
