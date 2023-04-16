
dashboardPage(
  
  dashboardHeader(title="Global Super Store Analysis", titleWidth = 375
  ),
  
  
  dashboardSidebar(
    sidebarMenu(id = "sidebar",
                menuItem("Dataset", tabName = "data", icon = icon("database")),
                menuItem("Visualization", tabName = "viz", icon=icon("chart-line")),
                
                
                conditionalPanel("input.sidebar == 'viz' && input.t2 == 'distro'", selectInput(inputId = "var1" , label ="Select the Variable" , choices = c1)),
                conditionalPanel("input.sidebar == 'viz' && input.t2 == 'trends' ", selectInput(inputId = "var2" , label ="Select the Sales type" , choices = c2)),
                conditionalPanel("input.sidebar == 'viz' && input.t2 == 'relation' ", selectInput(inputId = "var3" , label ="Select the X variable" , choices = c1, selected = "Rape")),
                conditionalPanel("input.sidebar == 'viz' && input.t2 == 'relation' ", selectInput(inputId = "var4" , label ="Select the Y variable" , choices = c1, selected = "Assault"))
                
                
    )
  ),
  
  
  dashboardBody(
    
    tabItems(
    
      tabItem(tabName = "data", 
              tabBox(id="t1", width = 12, 
                     tabPanel("About", icon=icon("address-card"),
                              fluidRow(
                                column(width = 8, tags$img(src="crime.jpg", width =600 , height = 300),
                                       tags$p("Global super store analysis is a that involves exploring and understanding a dataset from a global retail store.Rshiny a web application framework for R programming language, can be used to develop interactive dashboards that allow users to explore and visualize the data.")
                                )
                              )
                              
                              
                     ), 
                     
                     tabPanel("Structure", verbatimTextOutput("structure"), icon=icon("uncharted")),
                     tabPanel("Summary Stats", verbatimTextOutput("summary"), icon=icon("chart-pie"))
              )
              
      ),  
      
      
      tabItem(tabName = "viz", 
              tabBox(id="t2",  width=12, 
                     tabPanel("State wise sales tend", value="trends",
                              fluidRow(tags$div(align="center", box(tableOutput(""), solidHeader = TRUE)),
                                       tags$div(align="center", box(tableOutput(""), solidHeader = TRUE))
                                       
                              ),
                              withSpinner(plotlyOutput("bar"))
                     ),
                     tabPanel("Distribution",
                              # selectInput("var", "Select the variable", choices=c("Rape", "Assault")),
                              withSpinner(plotlyOutput("histplot", height = "350px"))),
                     tabPanel("relationship between sales and profit", 
                              radioButtons(inputId ="fit" , label = "Select smooth method" , choices = c("lm"), selected = "lm" , inline = TRUE), 
                              withSpinner(plotlyOutput("scatter")), value="relation"),
                     side = "left"
              ),
              
      )
      
      
      
      
      
      
    )
    
  )
)