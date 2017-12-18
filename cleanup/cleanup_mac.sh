#cleanup_mac.sh
# Copyright (c) Microsoft. All rights reserved.

# kill python and dotnet processes
killall Python
killall dotnet

# close Vienna if running
killall AmlWorkbench

# remove folders
sudo rm -rf /Applications/Azure\ ML\ Workbench.app/
sudo rm -rf ~/Library/Caches/AmlWorkbench
sudo rm -rf ~/Library/Application\ Support/AmlWorkbench/
sudo rm -rf /tmp/Amlinstaller
sudo rm -rf ~/.amlinstaller
