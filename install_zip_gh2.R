if (!require("yulab.utils", character.only = TRUE)) {
  install.packages(x, dependencies = TRUE)
  library(x, character.only = TRUE)
}

install_zip_gh2 <- function(repo, ref = "master", proxy_url='https://ghproxy.com/https://github.com/',  args = "--no-build-vignettes") {
  url <- paste0(proxy_url, repo, '/archive/refs/heads/', ref, '.zip')
  f <- tempfile(fileext=".zip")
  method <- "auto"
  if (.Platform$OS.type == "windows") method <- "curl"
  utils::download.file(url, destfile=f, method = method)
  install_zip(f, args=args)
}

# Demo code
# Not run
# install_zip_gh2("BioinformaticsFMRP/TCGAbiolinks")
