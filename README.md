
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sedapRmd

<!-- badges: start -->

<!-- badges: end -->

A package with an RMarkdown template to create an abnTeX2 research
project for the SEDAP protected data access room…

## Installation

You can install the development version of sedapRmd from
[Github](https://github.com/fcsest/sedapRmd) with:

``` r
# Install LaTeX Engine to compile the template
install.packages("tinytex")

# Installing template from package
#devtools::install_github("sedapRmd")
remotes::install_github("sedapRmd")
```

## Example

After installing we can select the Rmd template in RStudio:

<img src="https://raw.githubusercontent.com/fcsest/sedapRmd/master/inst/img/my_proj.png" width="50%" />

A example of yaml will be defined, change the variables for your
project:

<img src="https://raw.githubusercontent.com/fcsest/sedapRmd/master/inst/img/yaml.png" width="50%" />

Which chapter will be inside a chunk as RMarkdown file…

<img src="https://raw.githubusercontent.com/fcsest/sedapRmd/master/inst/img/using_template.png" width="50%" />

So you can edit chapters on RMarkdown files inside the folder
`capitulos`…

<img src="https://raw.githubusercontent.com/fcsest/sedapRmd/master/inst/img/chapters.png" width="50%" />

**NOTE:** Inside the chapter files, use **\#** for **section**, **\#\#**
for **subsection** and **\#\#\#** for **subsubsection**.

And edit references on `references.bib` inside the folder called
`arquivos_tex`…

<img src="https://raw.githubusercontent.com/fcsest/sedapRmd/master/inst/img/references.png" width="50%" />

And if you want to edit the template in LaTeX, open the
`abnTeX2_template.tex` inside `arquivos_tex` folder…

<img src="https://raw.githubusercontent.com/fcsest/sedapRmd/master/inst/img/tex_file.png" width="50%" />

To create the pdf file of project in book format and/or online format,
you can call the `create_pdf_proj()` function like:

``` r
create_pdf_proj("My_proj", format = "both", output_dir = "./pdf_files")
```
