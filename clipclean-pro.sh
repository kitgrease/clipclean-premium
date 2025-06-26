#!/bin/bash

text=$(pbpaste)
text=$(echo "$text" | tr '‘’‚‛“”„‟“”' "\'\'\'\'\"\"\"\"\"\"")
text=$(echo "$text" | LC_CTYPE=C tr -cd '\11\12\15\40-\176')

if [[ "$1" != "--preserve" ]]; then
  text=$(echo "$text" | sed 's/  */ /g')
  text=$(echo "$text" | sed '/^[[:space:]]*$/d')
fi

echo "$text" | pbcopy
echo "Clipboard cleaned — pro mode."