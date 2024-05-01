function jo --wraps=joshuto --description 'alias jo=joshuto'
  mkdir -p /tmp/$USER
  set OUTPUT_FILE "/tmp/$USER/joshuto-cwd-$fish_pid"
  env joshuto --output-file "$OUTPUT_FILE" $argv
  set exit_code $status

  switch $exit_code
    # regular exit
    case 0
      ;;
    # output contains current directory
    case 101
      cd $(cat "$OUTPUT_FILE")
      ;;
    # output selected files
    case 102
      ;;
    case '*'
      echo "Exit code: $exit_code"
      ;;
  end
        
end
