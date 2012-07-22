#!/bin/bash
export IPM_DIR=$(cd $(dirname ${BASH_SOURCE[0]:-$0}) && pwd)
PLUGIN_DIR=$IPM_DIR/plugins
BUILTIN_DIR=$IPM_DIR/.builtin

function ipm() {
  if [ $# -lt 1 ]; then
    nvm_help
  elif [ "$1" == "help" ]; then
    nvm_help
  else

    COMMAND=$1
  
    shift
 
    if [ -f "$BUILTIN_DIR/$COMMAND" ]; then
      $BUILTIN_DIR/$COMMAND "do" $@
    fi

    if [ -d "$IVM_DIR/plugins" ]; then
      for i in $PLUGIN_DIR/*; do
        if [ -f "$PLUGIN_DIR/$i/$COMMAND" ] || [ -l "$PLUGIN_DIR/$i/$COMMAND" ]; then
          $PLUGIN_DIR/$i/$COMMAND "do" $@
        fi
      done
    fi
  fi
}


function nvm_help() {
  show_function_descriptions $IPM_DIR/.builtin
  if [ -d "$PLUGIN_DIR" ]; then
    for i in $PLUGIN_DIR/*; do
      show_function_descriptions $PLUGIN_DIR/$i
    done
  fi
}

function show_function_descriptions() {
  DIR=$1
  for i in $DIR/*; do
    $i description
  done
}
