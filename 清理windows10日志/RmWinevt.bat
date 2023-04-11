del C:\Windows\System32\winevt\Logs\* /q /f /s 
pause

rem 将Logs内的文件全出删除（遇到不让删除，显示占用的选择跳过即可）

rem 然后设置系统环境：我的电脑（右击）——管理——事件查看器——windows日志——安全（右击）——属性——俺需要覆盖时间（旧事件优先）