# Set alias commands for ROS
if [[ -d /opt/ros/noetic ]]; then
  alias cw='cd ${ROS_WORKSPACE}'
  alias cs='cd ${ROS_WORKSPACE}/src'

  function create_simple_compile_flags() {
    echo "-I/opt/ros/noetic/include" > compile_flags.txt
    echo "-I${PWD}/include" >> compile_flags.txt
  }

  function cmk_export_compile_commands() {
    catkin build $@ --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

    # Find compile_commands.json in build directory and create symlink to the top of the package directories.
    local package_xmls=$(find ${ROS_WORKSPACE}/src -name package.xml)
    for package_xml in $(echo ${package_xmls}); do
      local package_name=$(cat ${package_xml} | grep '<name>' | awk -F '[>]' '{print $2}' | awk -F '[<]' '{print $1}')
      if [[ -e ${ROS_WORKSPACE}/build/${package_name}/compile_commands.json ]]; then
        ln -sf ${ROS_WORKSPACE}/build/${package_name}/compile_commands.json $(rospack find ${package_name})/compile_commands.json
      fi
    done
  }
fi
