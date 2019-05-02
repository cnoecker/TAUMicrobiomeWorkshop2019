cran_packages = c("devtools", "data.table", "Rcpp", "BiocManager")
for (package in cran_packages){
  install.packages(package)
}

bioc_packages = c("qvalue", "KEGGREST")
for (package in bioc_packages){
  BiocManager::install(package)
}

