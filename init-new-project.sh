#!/bin/zsh

PROJECT=$(basename "$(PWD)")
PACKAGE=$(basename "$(PWD)" | tr '-' '_')

NEW_PROJECT="$1"

cd ..
cp -R $PROJECT ${NEW_PROJECT}
cd ${NEW_PROJECT} || echo "Error: Could not find ${NEW_PROJECT}"
echo $PWD
./init-template.sh ${PROJECT} ${PACKAGE}
poetry install
echo "☑️ Nearly done."
echo "cd $PWD/$NEW_PROJECT && poetry shell && idea ."
echo "🧠 Remember to update the following:"
echo "  - version and description in pyproject.toml"
echo "  - title and description in README.md"
echo "  - site_name in mkdocs.yml"
echo "  - name in requirements.txt"
echo "🧠 Add secrets for Github repo"
echo "  - PYPI_TOKEN"
echo "  - PERSONAL_GH_TOKEN" # Required to kickoff another workflow
