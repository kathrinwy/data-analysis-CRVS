
# Update R and all packages
old_lib <- file.path(dirname(.libPaths()[1]), "4.3")
dir.exists(old_lib)

old_packages <- installed.packages(lib.loc = old_lib)[, "Package"]
new_packages <- installed.packages()[, "Package"]
to_install <- setdiff(old_packages, new_packages)

# Install the missing packages
if(length(to_install) > 0) {
  install.packages(to_install)
}

# Set up package manager
if (!requireNamespace("pak", quietly = TRUE)) install.packages("pak") # download pak if missing
install.packages("usethis")
install.packages("gert") # github commits etc. from code

pak::pak(c("usethis", "gitcreds", "renv", "tidyverse", "broom", "gtsummary"))
# new suite of packages necessary for proper workfow
# usethis: Git
# gitcreds: git Credentials
# renv: Reproducibility
# tidyverse: we know what this is
# broom: we know
# gtsummary: better tables

# connect to github
usethis::create_github_token()
gitcreds::gitcreds_set()
usethis::use_git()
usethis::use_github()

# first commit:
# Stage all modified and untracked files
gert::git_add(gert::git_status()$file)

# Commit with a descriptive message
gert::git_commit("Add initial analysis script and project files")

# Push to your GitHub repository
gert::git_push()

# Clean up aboslute paths
gert::git_commit_all("Replace absolute paths with relative paths")
gert::git_push()
