# First load pre-settings from $DIR/pre, then normal settings from $DIR,
# then post-settings from $DIR/post .
_load_settings() {
  dir="$1"
  if [ -d "$dir" ]; then
    if [ -d "$dir/pre" ]; then
      for config in $dir/pre/*; do
        . $config
      done
    fi

    for config in $dir/*; do
      if ! [ -d $config ]; then
        . $config
      fi
    done

    if [ -d "$dir/post" ]; then
      for config in $dir/post/*; do
        . $config
      done
    fi
  fi
}

_load_settings "$HOME/.profile.d"
