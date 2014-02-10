# Please set the GITHUB prefix by setting the environment
# variable GITHUB_KEYWORD.
# EXAMPLES:
# - GITHUB_KEYWORD="https://github.com/"
# - GITHUB_KEYWORD="github:"
# Then use one of the following commands to open a pull-request
# in your browser.
# - pull-request
#   - will open a pull-request from this branch into staging
rr_github_pull_request() {

  if [[ ! -d .git ]]; then
    echo "This is not a git repository..."
    return 0
  else
    target_branch="staging"
    the_remote=$(git ls-remote --get-url origin)
    repository=$(echo $the_remote | grep -oP --color=never "${GITHUB_KEYWORD}\w+/\w+")
    repository=$(echo $repository | grep -oP --color=never "\w+/\w+")
    if [[ ! -n $repository ]]; then
      echo "This is not a known github repository. Try setting GITHUB_KEYWORD."
      return 0
    else
      prefix="refs/heads/"
      fq_branch=$(git rev-parse --symbolic-full-name HEAD)
      local_branch_name=$(echo $fq_branch |  sed 's/refs\/heads\///g')
      remote_branch_name=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} | sed 's/.*\///g')
      request_branch=$remote_branch_name
      echo "remote branch for $local_branch_name is $remote_branch_name"
      echo "Creating pull-request to $target_branch for $request_branch"
      `open https://github.com/ontohub/ontohub/compare/$target_branch...$request_branch?expand=1`
    fi
  fi

}

alias pull-request='rr_github_pull_request'
