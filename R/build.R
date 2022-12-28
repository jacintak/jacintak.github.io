# Make CV PDF
# rmarkdown::render('content/cv/index.Rmd', output_format = rmarkdown::pdf_document(keep_tex = FALSE), output_dir = "static/files/", output_file = "Kong_JD_CV.pdf", clean=TRUE)

# make gitbook
# blogdown::build_dir("static") doesn't work because we want a gitbook that knits with render_book
# whereas build_dir uses rmakrdown::render() thus giving html files

old <- getwd()
setwd("static/teaching/GLM/")
# bookdown::clean_book(clean = TRUE)

# 1. self-contained gitbook without equations
# 2. PDF
# 3. actual site
# bookdown::render_book(input = "index.Rmd", quiet = TRUE, clean = TRUE, output_format = bookdown::gitbook(self_contained = TRUE, split_by = "none", css = "style.css"))
# bookdown::render_book(input = "index.Rmd", quiet = TRUE, clean = TRUE, output_format = "bookdown::pdf_book")
# bookdown::render_book(input = "index.Rmd", quiet = TRUE, clean = TRUE, output_format = "bookdown::gitbook")

setwd(old)

# An open issue for offering a download
# cannot render a self contained file using html_book
# cannot use latex with a self contained gitbook
