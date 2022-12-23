# Write a SAFE pdf

render_SAFE <- function(){
  rmarkdown::render(
    input = paste(dirname(getwd()), "/Rmarkdown_templates/SAFE_Document.Rmd", sep=""),
    output_dir = paste(dirname(getwd()), "/SAFE_documents/", sep=""),
    params = list())

}
