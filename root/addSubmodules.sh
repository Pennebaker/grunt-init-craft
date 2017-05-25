#!/usr/local/bin/bash

if ((BASH_VERSINFO[0] < 4))
then
  echo "Sorry, you need at least bash-4.x to run this script."
  exit 1
fi

declare -A plugins
plugins=(
    ["craft_plugins/ContactForm"]=https://github.com/pixelandtonic/ContactForm.git
    ["craft_plugins/cookies"]=https://github.com/nystudio107/cookies.git
    ["craft_plugins/CpFieldLinks-Craft"]=https://github.com/mmikkel/CpFieldLinks-Craft.git
    ["craft_plugins/craft-cpcss"]=https://github.com/lindseydiloreto/craft-cpcss
    ["craft_plugins/Craft-FocusPoint"]=https://github.com/smcyr/Craft-FocusPoint.git
    ["craft_plugins/craft-neo"]=https://github.com/benjamminf/craft-neo.git
    ["craft_plugins/craft-quick-field"]=https://github.com/benjamminf/craft-quick-field.git
    ["craft_plugins/craft-relabel"]=https://github.com/benjamminf/craft-relabel.git
    ["craft_plugins/craft-sitemap"]=https://github.com/Pennebaker/craft-sitemap.git
    ["craft_plugins/craft.cache-clear"]=https://github.com/themccallister/craft.cache-clear.git
    ["craft_plugins/craftcms-blueprint"]=https://github.com/bjerenec/craftcms-blueprint.git
    ["craft_plugins/craftcms-thearchitect"]=https://github.com/Pennebaker/craftcms-thearchitect.git
    ["craft_plugins/CraftFieldNotes"]=https://github.com/Pennebaker/craftfieldnotes.git
    ["craft_plugins/ExpandedSingles"]=https://github.com/engram-design/ExpandedSingles.git
    ["craft_plugins/Imager-Craft"]=https://github.com/aelvan/Imager-Craft.git
    ["craft_plugins/instantanalytics"]=https://github.com/nystudio107/instantanalytics
    ["craft_plugins/LinkIt"]=https://github.com/fruitstudios/LinkIt.git
    ["craft_plugins/minify"]=https://github.com/nystudio107/minify.git
    ["craft_plugins/navee"]=https://github.com/fromtheoutfit/navee.git
    ["craft_plugins/Reasons-Craft"]=https://github.com/mmikkel/Reasons-Craft.git
    ["craft_plugins/Redactor-Extras"]=https://github.com/elliotlewis/Redactor-Extras.git
    ["craft_plugins/seomatic"]=https://github.com/nystudio107/seomatic.git
    ["craft_plugins/SimpleMap"]=https://github.com/ethercreative/simplemap.git
    ["craft_plugins/SuperTable"]=https://github.com/engram-design/SuperTable.git
    ["craft_plugins/craft-typogrify"]=https://github.com/jamiepittock/craft-typogrify
    ["craft_plugins/craft-safedelete"]=https://github.com/christianruhstaller/craft-safedelete.git
)

for i in "${!plugins[@]}"
do
    if [[ $1 != "--force" ]]; then
        read -p " Add $i? Y/n " r
    fi
    if [[ ! $r =~ ^(n|no|N|No|NO)$ ]]; then
        git submodule add ${plugins[$i]} ${i}
        echo ""
    fi
done
