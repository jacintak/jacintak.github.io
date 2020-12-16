# Make CV PDF
# rmarkdown::render('content/cv/index.Rmd', output_format = rmarkdown::pdf_document(keep_tex = FALSE), output_dir = "static/files/", output_file = "Kong_JD_CV.pdf")

# make gitbook
# blogdown::build_dir("static") doesn't work because we want a gitbook that knits with render_book
# whereas build_dir uses rmakrdown::render() thus giving html files
old <- getwd()
setwd("static/teaching/GLM/")
#bookdown::clean_book(clean =FALSE)
# bookdown::render_book(input = "index.Rmd")
setwd(old)
