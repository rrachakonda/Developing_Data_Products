#ui.R
library(shiny)
library(ggplot2)

trainData <- read.csv("./MH_370.csv")

dataset <- trainData


shinyUI(fluidPage(
	navbarPage("Developing Data products Course Project"
			),
	titlePanel("Flight MH 370 data analysis"),
	sidebarLayout(
	 sidebarPanel(
		
		h3('Change Plot Variables'),

		sliderInput('sampleSize', 'Modify  Sample Data Size', min=1, max=nrow(dataset),
				value=min(500, nrow(dataset)), step=100, round=0),
		selectInput('x', 'X', names(dataset), selected = "Age of Passenger"),
		selectInput('y', 'Y', names(dataset), selected = "Passenger class"),
		selectInput('color', 'Color', selected = "Sex" , c('None', names(dataset))),

		checkboxInput('jitter', 'Jitter'),
		checkboxInput('smooth', 'Smooth'),

    	selectInput('facet_row', 'Row View', selected = "Survived", c(None='.', names(dataset))),
    	selectInput('facet_col', 'Column View', c(None='.', names(dataset))),
    	
    	tags$br(),
    	tags$br(),
    	strong('DESCRIPTION OF DATA:'),
    	tags$ul(
    		tags$li('survived - Survival (0 = No; 1 = Yes)'),
    		tags$li('pclass - Passenger Class (1 = 1st; 2 = 2nd; 3 = 3rd)'),
    		tags$li('name - Name'),
            tags$li('sex - Sex'),
            tags$li('age - Age'),
            tags$li('sibsp - Number of Siblings'),
            tags$li('parch - Number of Parents'),
            tags$li('ticket - Ticket Number'),
            tags$li('fare - Passenger Fare'),
            tags$li('cabin - Cabin'),    
            tags$li('embarked - Departure city (C = Amsterdam; Q = Frankfurt; S = Paris)')
            
            
            ),  
			
		
		
		p('')
			 
			 ),	 
					 
	
	 mainPanel(
		h2('Commercial Airliner accident passenger data analysis'),
				
		
		plotOutput('plot'),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tabPanel('trainData', dataTableOutput('mytable1'))
				
	 )
	)
))