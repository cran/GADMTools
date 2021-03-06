\name{choropleth}
\alias{choropleth}

\title{ Draw a choropleth on selected regions }

\description{
Drawing a choropleth (colored regions based on data values) with GADMTools is straightforward. You just have to select your shape(s) file(s) with \emph{gadm_loadcountries}, load your data from a
csv file for example, and call the choropleth function with the right arguments.
}
\usage{
choropleth (x, data, value=NULL, breaks = NULL, steps = 5, adm.join=NULL,
            legend = NULL, labels = NULL, palette=NULL,
            title="", subtitle = NULL, caption = NULL)

}
\arguments{
  \item{x}{ \bold{Object} gadm_sf or gadm_sp }
  
  \item{data}{
\bold{data.frame} - data to plot
}
  \item{value}{
  \bold{String} - the name of the column in the data.frame we want to plot (eg: an incidence in epidemiology studies)
}
  \item{breaks}{\bold{Vector} of breaks values or a \bold{Sring} name of a function from \emph{classIntervals} (one of "sd", "equal", "pretty", "quantile", "kmeans", "hclust", "bclust", "fisher", or "jenks")
}
  \item{steps}{ \bold{Integer} - number of breaks. Default = 5. If \emph{breaks} is \bold{NOT NULL} this value is used internally with cut().
}
  \item{adm.join}{ \bold{String} - the name in your dataset joined with the field NAME_X of the map, where X is the level of the administrative boundaries. For instance if the level is about 'Districts' of a country, and your dataset has a field named "Study_Location" containing a list of districts, just do adm.join = "Study_Location".
}
  \item{legend}{
  \bold{String} - legend title. Default \bold{NULL}. 
}
  \item{labels}{ \bold{String vector} labels for the legend. Default \bold{NULL}}
  
  \item{palette}{
  \bold{String} - An RColorBrewer palette name or a \bold{String vector} 
  vector of colors. Default \bold{NULL}.
}
  \item{title}{ \bold{String} - Title of the plot. Default is an empty string.}
  \item{subtitle}{ \bold{String} - subtitle of the plot. Default is NULL.}
  \item{caption}{ \bold{String} - caaption of the plot. Default is NULL.}
}
\details{
Since this relase, it's no longer necessary to rename the field of your dataset that is joined with the right field of the map. Just write \bold{adm.join="data_field_to_link"}.
}
\value{
    \bold{Object}  ggplot2
}
\references{
----
}
\author{
Jean Pierre Decorps <jp.decorps@epiconcept.fr>
}
\note{
----
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\link{classIntervals}
}
\examples{
library(GADMTools)
data("Corsica")
Cantons <- listNames(Corsica, 4)
pop <- floor(runif(length(Cantons), min=15200, max=23500))
DAT <- data.frame(Cantons, pop)

choropleth(Corsica, DAT,
           adm.join = "Cantons",
           value = "pop",
           breaks = "sd",
           palette="Oranges",
           legend = "Population",
           title="Population Cantons de Corse")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~documentation }

