% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_variable_names.R
\name{get_variable_names}
\alias{get_variable_names}
\title{get_variable_names}
\usage{
get_variable_names(
  dataset = NULL,
  category = NULL,
  vintage = 2020,
  vars = NULL,
  group = NULL,
  filter_group_est = FALSE,
  filter_name_str = NULL,
  filter_label_str = NULL,
  filter_concept_str = NULL,
  ignore_case = TRUE,
  fixed = FALSE
)
}
\arguments{
\item{dataset}{An optional string that sets the name of a dataset category of interest.}

\item{category}{An optional string that sets the category of datasets. The available
categories are one of the following:
\tabular{ll}{
\strong{\code{acs1}} \tab American Community Survey 1-Year Data\cr
\strong{\code{acs/acsse}} \tab American Community Survey Supplemental Data\cr
\strong{\code{acs5}} \tab American Community Survey 5-Year Data\cr
\strong{\code{dec}} \tab Decennial Census\cr
\strong{\code{ecnbasic}} \tab Economy-Wide Key Statistics\cr
\strong{\code{timeseries/idb}} \tab Time Series International Database\cr
\strong{\code{abs}} \tab Annual Business Survey\cr
}}

\item{vintage}{An required numeric that sets the year of interest. The default is 2020.}

\item{vars}{An optional vector of variable names whose descriptions are of interest.
This parameter requires that either 'dataset' or 'category' had been defined.}

\item{group}{An optional string that sets the group name associated with a set of variables.
This parameter requires that either 'dataset' or 'category' had been defined.
See \code{Rcensus::get_groups()} for available group names under a specific dataset and vintage.}

\item{filter_group_est}{A logical which if \code{TRUE} will filter the variable names from 'group' and return
only estimate related variable names. The default is \code{FALSE}.}

\item{filter_name_str}{A character string by which to filter the resultant \code{data.table}'s "name" column.}

\item{filter_label_str}{A character string by which to filter the resultant \code{data.table}'s "label" column.}

\item{filter_concept_str}{A character string by which to filter the resultant \code{data.table}'s "concept" column.}

\item{ignore_case}{A logical which if \code{FALSE} will not ignore case in filtering the "name", "label", "concept" column.}

\item{fixed}{A logical which if \code{TRUE}, then the above filter strings are used 'as is' in matching.}
}
\value{
A \code{data.table}
}
\description{
Get Census Bureau variable acronym names and their label descriptions.

Function produces a \code{data.table} of variable acronym names and their
descriptions. The function returns 4 columns:
\tabular{ll}{
\strong{name} \tab the name of the parameter\cr
\strong{label} \tab the Bureau's description of the parameter\cr
\strong{required} \tab a boolean indicating if the parameter is required\cr
\strong{predicateType} \tab a string indicating the variable primitive type\cr
}

Note that a variable with a \strong{required} character value "true" must be included
in your data requests (i.e. \code{RcensusPkg::get_vintage_data()}) or
the API will return an error.
}
\details{
The function's search for variable names depends on either specifying the parameters 'dataset'
name or a dataset 'category'. Entering an available 'vintage' also influences obtaining a
full dataframe of variable names and descriptions. To assist in using the function the user
should consult the Census Bureau's publicly available \href{https://www.census.gov/data/developers/data-sets.html}{datasets descriptions}.
Also of help is \code{Rcensus::get_dataset_names()} for available dataset acronym names and
their available years.
}
\examples{
# Get available variables that have the phrase "educational attainment"
# in "label" column of the resultant data.table.

library(data.table)
library(httr2)
library(RcensusPkg)

educational_attainment_2019_dt <- RcensusPkg::get_variable_names(
  dataset = "acs/acs1/profile",
  vintage = 2019,
  filter_label_str = "educational attainment"
)

}
