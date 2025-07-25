#' Student Survey Codebook
#'
#' The codebook to the 2024-2025 Student Health Survey
#'
#' @format
#' A dataframe with 159 rows and 6 columns.
#' \describe{
#' \item{Variable}{Names of the columns in the student data.}
#' \item{Question}{The survey question.}
#' \item{response_options}{A semi-colon separated character vector
#' of all possible response options for given Variable/Question.}
#' \item{section}{Section of the survey}
#' \item{subset}{Whether question was for all, Elementary, or Middle/High students.
#' One of all, MH, or E.}
#' \item{type}{Variable type, one of character or double.}
#' }
"student_codebook"

#' @rdname student_codebook
