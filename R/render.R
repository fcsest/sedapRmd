#' @title Create PDF formated
#'
#' @usage create_pdf_proj(file, format = "both", output_dir = "./pdfs")
#'
#' @description A function to make a pdf files by RMarkdown template of SEDAP research project.
#'
#' @param file A path of RMarkdown file with SEDAP Research Project Template;
#' @param format Format of research project pdf, can be "book", "online" or "both"; \strong{
#' ```
#' Default: "both"
#' ```
#' }
#' @param output_dir A output directory of pdfs files;
#'
#' @return PDF file in output_dir.
#'
#' @export
#'
#' @importFrom rmarkdown render
#' @importFrom purrr discard map prepend
#' @importFrom stringr str_detect
create_pdf_proj <- function(file, format = "both", output_dir = "./pdfs"){
  if (!file.exists(file)) {
    return("ERROR")
  }
  else {
    readLines(file) %>%
      discard(~str_detect(.x,
                          "book_format:")) %>%
      prepend("book_format: TRUE",
              2) %>%
      writeLines(file %>%
                   dirname() %>%
                   paste0("/true.Rmd"))

    readLines(file) %>%
      discard(~str_detect(.x,
                          "book_format:")) %>%
      prepend("book_format: FALSE",
              2) %>%
      writeLines(file %>%
                   dirname() %>%
                   paste0("/false.Rmd"))
  }

  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }

  if (format == "both") {

    c(file %>%
        dirname() %>%
        paste0("/false.Rmd"),
      file %>%
        dirname() %>%
        paste0("/true.Rmd")) %>%
      map(~render(input = .x,
                  output_file = paste0(output_dir,
                                       "/Projeto_de_Pesquisa_",
                                       ifelse(str_detect(.x,
                                                         "true.Rmd"),
                                              "Book",
                                              "Online"))))
  }
  else if (format == "book" | format == "online") {
    ifelse(str_detect(format,
                      "(?i)book"),
           file %>%
             dirname() %>%
             paste0("/true.Rmd"),
           file %>%
             dirname() %>%
             paste0("/false.Rmd")) %>%
      render(.,
             output_file = paste0(output_dir,
                                  "/Projeto_de_Pesquisa_",
                                  ifelse(str_detect(.,
                                                    "(?i)true"),
                                         "Book",
                                         "Online")))
  }

  c(file %>%
      dirname() %>%
      paste0("/true.Rmd"),
    file %>%
      dirname() %>%
      paste0("/false.Rmd")) %>%
    file.remove() %>%
    invisible()
}
