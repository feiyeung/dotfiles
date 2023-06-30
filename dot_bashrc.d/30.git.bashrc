#!/bin/bash


# git submoduel update in parallel for immediate one
gsu() 
{
    git submodule status --cached  | grep -v '^-' | tr '+' ' ' | awk '{print "git -C \"" $2 "\" fetch -p --no-recurse-submodules origin " $1 " && git -C \"" $2 "\" checkout " $1}' | tr '\n' '\0' | xargs -0 -t -L1 -P$(nproc) sh -c
}

# git clean -xdf for current and its immediate submodules
gsc() 
{
    printf "placeholder . \n`git submodule status --cached`"  | grep -v '^-' | tr '+' ' ' | awk '{print "git -C \"" $2 "\" clean -xdf"}' | tr '\n' '\0' | xargs -0 -t -L1 -P$(nproc) sh -c
}

# git reset --hard for current and its immediate submodules
gsr()
{
    printf "placeholder . \n`git submodule status --cached`"  | grep -v '^-' | tr '+' ' ' | awk '{print "git -C \"" $2 "\" reset --hard"}' | tr '\n' '\0' | xargs -0 -t -L1 -P$(nproc) sh -c
}

# git gc for current and its immediate submodules
gsgc()
{
    printf "placeholder . \n`git submodule status --cached`"  | grep -v '^-' | tr '+' ' ' | awk '{print "git -C \"" $2 "\" gc"}' | tr '\n' '\0' | xargs -0 -t -L1 -P$(nproc) sh -c
}

# git remote prune origin for current and its immediate submodules
gsrpo()
{
    printf "placeholder . \n`git submodule status --cached`"  | grep -v '^-' | tr '+' ' ' | awk '{print "git -C \"" $2 "\" remote prune origin"}' | tr '\n' '\0' | xargs -0 -t -L1 -P$(nproc) sh -c
}