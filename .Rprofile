if(interactive() || nzchar(Sys.getenv("R_FORCE_INTERACTIVE"))){
    .mw_env <- new.env()

    options(help_type = "text")
    options(menu.graphics = FALSE)
    options(max.print=150)

    .mw_env$cd <- setwd
    .mw_env$pwd <- getwd

    .mw_env$cdi <- function(...){
        if(!interactive()) return()

        while(TRUE){
            m <- menu(d <- c("..", list.dirs(recursive = FALSE, full.names = FALSE)),
                      title = paste("Choose directory to cd into; 0 to stay here.",
                          "\n Current directory is",
                          pwd()))
            if(m == 0L) break

            cd(d[m])

        }
    }

    .mw_env$corner <- function(x, n = 6L) x[seq_len(min(NROW(x), n)), seq_len(min(NCOL(x), n))]
    .mw_env$ht <- function(x, n=6L) rbind(head(x, n), tail(x, n))

    lockGlobal <- function(x, value){
        assign(x, value, .mw_env)
        lockBinding(x, .mw_env)
    }

    lockGlobal("e", exp(1))
    lockGlobal("pi", pi)
    lockGlobal("F", FALSE)
    lockGlobal("T", TRUE)

    rm(lockGlobal)

    attach(.mw_env, name="MWFunctions")
    rm(.mw_env)

    makeActiveBinding("ans", function().Last.value, .GlobalEnv)
}
