#!/bin/bash
export IPM_DIR=$(cd $(dirname ${BASH_SOURCE[0]:-$0}) && pwd)
PLUGIN_DIR=$IPM_DIR/plugins
BUILTIN_DIR=$IPM_DIR/.builtin

function ipm() {
  if [ $# -lt 1 ]; then
    ipm_help
  elif [ "$1" == "help" ]; then
    ipm_help
  else

    COMMAND=$1
  
    shift
 
    if [ -f "$BUILTIN_DIR/$COMMAND" ]; then
      $BUILTIN_DIR/$COMMAND $@
    fi

    if [ -d "$IVM_DIR/plugins" ]; then
      for i in $PLUGIN_DIR/*; do
        if [ -f "$PLUGIN_DIR/$i/$COMMAND" ] || [ -l "$PLUGIN_DIR/$i/$COMMAND" ]; then
          $PLUGIN_DIR/$i/$COMMAND $@
        fi
      done
    fi
  fi
}


function ipm_help() {
  echo "ipm:	Ivy Project Manager"
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
    echo "$(basename $i)	$($i description)"
  done
}

function checkDependencies() {
  PYTHON=$(which python)
  if [ -z "$PYTHON" ]; then
    echo "Python not found! Some modules will not function properly"
  else
    $PYTHON -c "import elementtree"
    if [ $? != 0 ]; then
      echo "Pease install elementtree python module"
    fi    
  fi
}

checkDependencies
