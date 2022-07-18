
nextWords <- function(rawStr,n,nGramAll){
    # 1. Remove numbers and punctuations
    filt_list <- gsub('[[:punct:]]|[[:digit:]]',"", tolower(rawStr))
    filt_list <- unlist(strsplit(filt_list, "\\s+"))

    # 2. Extract last 6 words for query
    if (length(filt_list) > 6){
        filt_list <- filt_list[(length(filt_list)-5):length(filt_list)]
        filtStr = paste(filt_list, collapse = " ")
    }else{
        filtStr <- paste(filt_list, collapse = " ")
    }

    # 3. Return all the matched words
    pred_text <- nGramAll[filtStr==nGramAll$query,]$predict
    if (length(pred_text) > 0){
        final_text <- pred_text
    }else{
        final_str <- paste(filt_list[2:length(filt_list)], collapse=" ")
        pred_text <- nGramAll[filtStr==nGramAll$query,]$predict
        if (length(pred_text) > 0){
            final_text <- pred_text
        }else{
            final_str <- paste(filt_list[3:length(filt_list)], collapse=" ")
            pred_text <- nGramAll[filtStr==nGramAll$query,]$predict
            if (length(pred_text) > 0){
                final_text <- pred_text
            }else{
                final_str <- paste(filt_list[4:length(filt_list)], collapse=" ")
                pred_text <- nGramAll[filtStr==nGramAll$query,]$predict
                if (length(pred_text) > 0){
                    final_text <- pred_text
                }else{
                    final_str <- paste(filt_list[5:length(filt_list)], collapse=" ")
                    pred_text <- nGramAll[filtStr==nGramAll$query,]$predict
                    if (length(pred_text) > 0){
                        final_text <- pred_text
                    }else{
                        final_str <- paste(filt_list[2:length(filt_list)], collapse=" ")
                        pred_text <- nGramAll[filtStr==nGramAll$query,]$predict
                        if (length(pred_text) > 0){
                            final_text <- pred_text
                        }else{
                            final_text <- 'the'
                        }
                    }
                }
            }
        }
    }
    return(final_text[1:n])
}
