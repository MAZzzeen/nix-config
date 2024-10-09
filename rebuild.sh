#!/usr/bin/env bash
set -e

# Change to the NixOS configuration directory

if [[ ! -d ~/.config/nixos/ ]]; then
    echo "NixOS configuration directory not found."
    exit 1
else
    pushd ~/.config/nixos/
fi

if ! command -v alejandra &> /dev/null; then
    echo "Alejandra is not installed."
    exit 1
fi


# Define the file to store the last used option
LAST_OPTION_FILE="last-nixos-option.txt"

# Read the last used option if it exists
if [[ -f "$LAST_OPTION_FILE" ]]; then
    LAST_OPTION=$(cat "$LAST_OPTION_FILE")
else
    LAST_OPTION=""
fi

# Prompt the user for the option, using the last option as default
read -p "Enter NixOS configuration (default: $LAST_OPTION): " OPTION
OPTION=${OPTION:-$LAST_OPTION}  # Use last option if no input

# Save the last used option
echo "$OPTION" > "$LAST_OPTION_FILE"

# Run Alejandra
alejandra .

# Inform the user about the rebuild
echo "NixOS Rebuilding with option: $OPTION..."

# Add changes to git
git add .

# Execute the rebuild command
sudo nixos-rebuild switch --flake ".#$OPTION" &> >(tee -a nixos-switch.log) || (
    cat nixos-switch.log | grep --color error && false
)

# Get the current generation
gen=$(nixos-rebuild list-generations | grep current)

# Commit the changes
git commit -am "$gen"

# Return to the previous directory
popd
