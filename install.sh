#!/bin/bash

echo "Installing Mac OS X key bindings"
mv -n ~/Library/KeyBindings/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict.BACKUP
rm ~/Library/KeyBindings/DefaultKeyBinding.dict
mkdir ~/Library/KeyBindings
ln -s ~/scripts/workflow-config/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict 

echo "Installing shell customisations"
mv -n ~/.bash_profile ~/.bash_profile.BACKUP
rm ~/.bash_profile
ln -s ~/scripts/workflow-config/bash_profile ~/.bash_profile
source ~/.bash_profile

echo "Enable opening sublime from the command line"
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

echo "Installing Karibiner bindings"
mv -n ~/Library/Application\ Support/Karabiner/private.xml ~/Library/Application\ Support/Karabiner/private.xml.BACKUP
rm ~/Library/Application\ Support/Karabiner/private.xml
ln -s ~/scripts/workflow-config/karabiner/private.xml ~/Library/Application\ Support/Karabiner/private.xml

