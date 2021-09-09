#' ---
#' title: "Gopher Gene Set Enrichment Analysis"
#' author: "Nicolas Delhomme"
#' date: "`r Sys.Date()`"
#' output:
#'  html_document:
#'    toc: true
#'    number_sections: true
#' ---
#' # Setup
#' # Environment
#' Libraries
suppressPackageStartupMessages({
	library(here)
	library(wordcloud)
})

#' Source helpers
#' We silence warnings (not good practice, but we know what we're doing)
suppressWarnings(source(here("UPSCb-common/src/R/gopher.R")))

#' # GSEA
#' ## Data
#' dat = your list of genes of interest (a subset of a population)
dat <- scan(here("FIXME"),what="character")

#' bg = your population (think what defines it; do we need it here?)
bg <- scan("FIXME",what="character",skip=1)

#' ## Run
#' We override some defaults
httr::set_config(httr::config(ssl_verifypeer = 0L, ssl_verifyhost = 0L))

#' We keep an eye on the running time
system.time(enrichment <- gopher(dat,task = list("go","kegg"),
                                 background = bg,url="pabies",
                                 host="https://gofer-rest"))

#' ## Results
#' You can export the go results to a file to summarise and visualise them in
#' REVIGO
write.table(enrichment$go[,c("FIXME","FIXME")],file="FIXME",
            quote=FALSE,sep="\t",
            col.names = FALSE, row.names = FALSE)

#' You can also take a look if some IDs are enriched in go, kegg or pfam
#' Be creative, explore the data!
alpha=0.01
wordcloud(enrichment$kegg$id[enrichment$kegg$padj <= alpha])

#' # Session Info
#' ```{r session info, echo=FALSE}
#'  sessionInfo()
#' ```

