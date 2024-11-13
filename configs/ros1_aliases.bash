# Set alias commands for ROS
if [[ -d /opt/ros ]]; then
  alias cw='cd $ROS_WORKSPACE'
  alias cs='cd $ROS_WORKSPACE/src'

  if [[ $ROS_VERSION -eq 1 ]]; then
    function cmk_export_compile_commands_this() {
      catkin build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON --this
      if [[ -e package.xml ]]; then
        local package_name=$(cat package.xml | grep '<name>' | awk -F '[>]' '{print $2}' | awk -F '[<]' '{print $1}')
        if [[ -e $ROS_WORKSPACE/build/$package_name/compile_commands.json ]]; then
          ln -sfv $ROS_WORKSPACE/build/$package_name/compile_commands.json ./compile_commands.json
        else
          echo "Error: compile_commands.json not found in build directory"
        fi
      else
        echo "Error: package.xml not found in current directory, so can't create symlink to compile_commands.json"
      fi
    }
  fi
fi
