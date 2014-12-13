## Data Science Capstone project app
## Hassan Khalid
## Date: 3th dec 2014

## Server file

library(shiny)

load("app_data.RData")

shinyServer(function(input, output) {
  
  
  #print the filenames and provide link the the output directory
  output$compute <- renderText({
    if(input$runlocal == 0) return(NULL) # only works when the button is clicked - only works for the first time
    
    ## fetching the query and computing the query from the sorted databases happens here
    ## Building the query for the prediction
    x<- input$query
    x1<- strsplit(x, split = " ")
    x1<- as.character(x1[[1]])
    len<- length(x1)
    
    
    ## structuring the query below and also looking for instances of the query in the prepared dataframes
    if(len>3){
      
      query_ngram1 <- paste0("\\b",x1[len])
      query_ngram2 <- paste("\\b",x1[len-1]," ", x1[len], " ")
      
      
      # looking through databases
      val_1<- grep(query_ngram1, two$Word, fixed = TRUE)
      val_2<- grep(query_ngram2, tri$Word, fixed = TRUE)
      
      #for val_1
      val1DF<- two[val_1,]
      ans_1<- val1DF[1,1] # this is a factor 
      remove(val1DF) 
      ans_1<- as.character(ans_1)
      ans_1_1<- strsplit(ans_1[1], split = " ")
      
      #for val_2
      val2DF<- tri[val_2,]
      ans_2<- val2DF[1,1] # this is a factor 
      remove(val2DF)
      ans_2<- as.character(ans_2)
      ans_2_1<- strsplit(ans_2[1], split = " ")
      

      # displaying best answers
      output$ans1 <- renderText({ans_1_1[[1]][3]}) 
      output$ans2 <- renderText({ans_2_1[[1]][3]})
      
    }
    if(len==3){
      query_ngram1 <- paste0("\\b",x1[len])
      query_ngram2 <- paste0("\\b",x1[len-1]," ", x1[len]," ")
      
      
      # looking through databases
      val_1<- grep(query_ngram1, two$Word, fixed = TRUE)
      val_2<- grep(query_ngram2, tri$Word, fixed = TRUE)
      
      
      
      #for val_1
      val1DF<- two[val_1,]
      ans_1<- val1DF[1,1] # this is a factor 
      remove(val1DF) 
      ans_1<- as.character(ans_1)
      ans_1_1<- strsplit(ans_1[1], split = " ")
      
      #for val_2
      val2DF<- tri[val_2,]
      ans_2<- val2DF[1,1] # this is a factor 
      remove(val2DF)
      ans_2<- as.character(ans_2)
      ans_2_1<- strsplit(ans_2[1], split = " ")
      
      #displaying best results
      output$ans1 <- renderText({ans_1_1[[1]][3]}) 
      output$ans2 <- renderText({ans_2_1[[1]][3]})

      
    }
    if(len<3){
      query_ngram1 <- paste0("\\b",x1[len])
      query_ngram2 <- paste0("\\b",x1[len-1]," ", x1[len]," ")
      
      # looking through databases
      val_1<- grep(query_ngram1, two$Word, fixed = TRUE)
      val_2<- grep(query_ngram2, tri$Word, fixed = FALSE, perl = TRUE)
      
      
      #for val_1
      val1DF<- two[val_1,]
      ans_1<- val1DF[1,1] # this is a factor 
      remove(val1DF) 
      ans_1<- as.character(ans_1)
      ans_1_1<- strsplit(ans_1[1], split = " ")
      
      #for val_2
      val2DF<- tri[val_2,]
      ans_2<- val2DF[1,1] # this is a factor 
      remove(val2DF)
      ans_2<- as.character(ans_2)
      ans_2_1<- strsplit(ans_2[1], split = " ")
      
      #displaying best results
      output$ans1 <- renderText({ans_1_1[[1]][3]}) 
      output$ans2 <- renderText({ans_2_1[[1]][3]})
      
    }
    if(len<2){
      query_ngram1 <- paste0("\\b",x1[len])
      
      # looking through databases
      val_1<- grep(query_ngram1, two$Word, fixed = TRUE)
      
      #for val_1
      val1DF<- two[val_1,]
      ans_1<- val1DF[1,1] # this is a factor 
      remove(val1DF) 
      ans_1<- as.character(ans_1)
      ans_1_1<- strsplit(ans_1[1], split = " ")
      #displaying best results
      output$ans1 <- renderText({ans_1_1[[1]][3]}) 
      
    }
    
    return ("Your best matches are...")
  })
  
  
})