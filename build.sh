#!/bin/bash

VERSION=1
MINOR=0
PATCH=0
EXTRAVERSION=""

NOTES="Feito mudanças em nomes que estavam errados nos perfiz de rede social e alterado data de inicio da empresa, site inicial no ar."
BRANCH="main"

set -e

if [[ -z $PATCH ]]; then
    PATCH=""
else
    PATCH=".$PATCH"
fi

if [[ $EXTRAVERSION == *"-rc"* ]]; then
    FULL_VERSION="$VERSION.$MINOR$PATCH$EXTRAVERSION"
else

    if [[ -z $EXTRAVERSION ]]; then
        FULL_VERSION="$VERSION.$MINOR$PATCH"
    else
        FULL_VERSION="$VERSION.$MINOR$PATCH.$EXTRAVERSION"
    fi
fi

git add .
git commit -m "$FULL_VERSION $NOTES"
git push -u origin $BRANCH
git tag v$FULL_VERSION
git push --tags

echo "Build $FULL_VERSION completed successfully!"
