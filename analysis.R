
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

pak::pak(c("usethis", "gitcreds", "renv", "tidyverse", "broom", "gtsummary"))
# new suite of packages necessary for proper workfow
# usethis: Git
# gitcreds: git Credentials
# renv: Reproducibility
# tidyverse: we know what this is
# broom: we know
# gtsummary: better tables

file.path(Sys.getenv("USERPROFILE"), "Documents/Kathrin/07-PhD/14- Second Paper/Code")
