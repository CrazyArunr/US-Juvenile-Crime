

function(input, output, session){
  
  
  


  output$structure <- renderPrint({
    my_data %>% 
      str()
  })
  
  
  
  output$summary <- renderPrint({
    my_data %>% 
      summary()
  })
  

  output$histplot <- renderPlotly({
    p1 = my_data %>% 
      plot_ly() %>% 
      add_histogram(x=~get(input$var1)) %>% 
      layout(xaxis = list(title = paste(input$var1)))
    
    
    p2 = my_data %>%
      plot_ly() %>%
      add_boxplot(x=~get(input$var1)) %>% 
      layout(yaxis = list(showticklabels = F))
    
    # stacking the plots on top of each other
    subplot(p2, p1, nrows = 2, shareX = TRUE) %>%
      hide_legend() %>% 
      layout(title = "Distribution chart - Histogram and Boxplot",
             yaxis = list(title="Frequency"))
  })
  
  
  ### Bar Charts - State wise trend
  output$bar <- renderPlotly({
    my_data %>% 
      plot_ly() %>% 
      add_bars(x=~State, y=~get(input$var2)) %>% 
      layout(title = paste("Statewise ", input$var2),
             xaxis = list(title = "State"),
             yaxis = list(title = paste(input$var2, " ") ))
  })
  
  
  ### Scatter Charts 
  output$scatter <- renderPlotly({
    p = my_data %>% 
      ggplot(aes(x=get(input$var3), y=get(input$var4))) +
      geom_point() +
      geom_smooth(method=get(input$fit)) +
      labs(title = paste("Relation b/w", input$var3 , "and" , input$var4),
           x = input$var3,
           y = input$var4) +
      theme(  plot.title = element_textbox_simple(size=10,
                                                  halign=0.5))
      
    
   
    
  })
  
  
  
  
  
    
 
  }
  
  
  


