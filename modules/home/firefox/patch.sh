#!/usr/bin/env bash

git clone https://github.com/soulhotel/FF-ULTIMA.git

mv FF-ULTIMA/theme ./theme

rm -rf FF-ULTIMA

cp all-global-theme-nord.css theme/

echo "@import url('all-global-theme-nord.css') (-moz-bool-pref: \"user.theme.dark.nord\");" >> theme/all-color-schemes.css

cp nord.png theme/pic/

sed -i "/@media (prefers-color-scheme: dark) {/a \@media (-moz-bool-pref: \"user.theme.dark.nord\"){body{background-image: url(\"pic/nord.png\") !important;}}" "theme/all-color-schemes-newtab.css"


echo "Customization complete!"

