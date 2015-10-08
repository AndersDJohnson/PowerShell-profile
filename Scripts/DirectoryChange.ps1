
# Change directory into the parent directory of given path
Function cdd {
  cd (get-item $args).directory
}

Function pushdd {
  pushd (get-item $args).directory
}
