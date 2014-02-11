# shell hub

This is a assortment of scripts to make life easier when
working from the shell with github.

*Right now we use `open` so there is only Mac OS X support.*

## Usage

Source the scripts (or only one of them) in your shell-dependent
rc-file (zshrc, bashrc, ...).

You should also set these environment variables:

- `$GITHUB_KEYWORD` is the prefix by which we try to identify
  your github repositories (remote location).
- `$GITHUB_REQUEST_TO` is the base-branch to which you want
  to merge a pull-request. It is only necessary for the
  pull-request script.

After doing this you can use the scripts like this:

### Ticket

- `ticket` opens the ticket for the current branch in the browser
  if the branchname conforms to this layout: `issue_id-other_text`,
  e.g. `34-fix_some_problems`.
- `ticket issue_id` directly opens the specified issue in the browser.

This script is dependent on the `$GITHUB_KEYWORD` environment variable.

### Pull-Request

- `pull-request` opens the compare view (initiating a pull-request)
  in the browser for the current branch. This is dependent
  on the `$GITHUB_REQUEST_TO` environment variables which sets
  the base location (which branch you want to merge into).
- `pull-request branchname` opens pull-request for the current branch.
  The Pull-Request tries to merge the current branch into
  the specified branchname.
