#!/bin/bash

# Get clipboard content
text=$(pbpaste)

# Convert smart quotes to straight
text=$(echo "$text" | tr '‘’‚‛“”„‟“”' "\'\'\'\'\"\"\"\"\"\"")

# Remove control/non-printing characters (keep tabs/space/newlines)
text=$(echo "$text" | LC_CTYPE=C tr -cd '\11\12\15\40-\176')

# If not --preserve, collapse space and remove empty lines
if [[ "$1" != "--preserve" ]]; then
  # Collapse multiple spaces
  text=$(echo "$text" | sed 's/  */ /g')
  # Remove empty lines
  text=$(echo "$text" | sed '/^[[:space:]]*$/d')
fi

# Copy cleaned text back to clipboard
echo "$text" | pbcopy

echo "Clipboard cleaned — premium mode."
