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
alias cf='git add *.cpp *.h *.hpp *.ino && clang-format-9 -i -style=file $(comm -12 \
<(git diff origin/master --name-only | sort) \
<(find . -type f \( -name "*.cpp" -o -name "*.h" -o -name "*.hpp" -o -name "*.ino" \) | cut -c 3- | sort)) && \
git add *.cpp *.h *.hpp *.ino'

# env variables
export GREENZIE_PLATFORM=intrepid
export GREENZIE_MODEL=p4
export DECK_WIDTH_INCHES=61

# properly set up name and email when running dch, put this in your .bashrc
# from https://github.com/Greenzie/robotic-lawnmower/blob/noetic-devel/docs/Development.md#bumping-package-revisions
alias dch="DEBEMAIL=\"$(git config --get user.email)\" DEBFULLNAME=\"$(git config --get user.name)\" dch"
