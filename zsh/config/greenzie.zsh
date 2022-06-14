################################################################################
#
# greenzie.zsh
#
# Aliases + config options for Greenzie machine.
#
################################################################################

# source noetic on every new shell
source /opt/ros/noetic/setup.zsh

# source catkin's build setup on every new shell
source ~/catkin_ws/devel/setup.zsh

# clang format current file
# doesn't work :(
alias cf='git add *.cpp *.h *.hpp *.ino && clang-format-9 -i -style=file $(comm -12 \
<(git diff origin/master --name-only | sort) \
<(find . -type f \( -name "*.cpp" -o -name "*.h" -o -name "*.hpp" -o -name "*.ino" \) | cut -c 3- | sort)) && \
git add *.cpp *.h *.hpp *.ino'

# build from any dir
alias build="(cd ~/catkin_ws/ && catkin_make)"

# properly set up name and email when running dch, put this in your .bashrc
alias dch="DEBEMAIL=\"$(git config --get user.email)\" DEBFULLNAME=\"$(git config --get user.name)\" dch"
