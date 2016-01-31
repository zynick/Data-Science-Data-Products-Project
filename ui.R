#ui.R
library(shiny)
library(ggplot2)

dataset <- read.csv("./data/train.csv")

shinyUI(fluidPage(
	navbarPage("Coursera Developing Data Products"),
	titlePanel("Course Project - Kaggle's Titanic Exploration"),

	sidebarLayout(

    sidebarPanel(

		  sliderInput('sampleSize', 'Choose Sample Size', min=1, max=nrow(dataset), value=min(500, nrow(dataset)), step=100, round=0),
		  selectInput('x', 'X', names(dataset), selected = "Age"),
  		selectInput('y', 'Y', names(dataset), selected = "Pclass"),
	  	selectInput('color', 'Color', selected = "Sex" , c('None', names(dataset))),
      selectInput('facet_row', 'Facet Row', selected = "Survived", c(None='.', names(dataset))),
      selectInput('facet_col', 'Facet Column', c(None='.', names(dataset))),
  		checkboxInput('jitter', 'Jitter'),
	  	checkboxInput('smooth', 'Smooth'),
      tags$br(),

      strong('VARIABLE DESCRIPTIONS:'),
      tags$ul(
      	tags$li('survival - Survival (0 = No; 1 = Yes)'),
      	tags$li('pclass - Passenger Class (1 = 1st; 2 = 2nd; 3 = 3rd)'),
      	tags$li('name - Name'),
          tags$li('sex - Sex'),
          tags$li('age - Age'),
          tags$li('sibsp - Number of Siblings/Spouses Aboard'),
          tags$li('parch - Number of Parents/Children Aboard'),
          tags$li('ticket - Ticket Number'),
          tags$li('fare - Passenger Fare'),
          tags$li('cabin - Cabin'),
          tags$li('embarked - Port of Embarkation (C - Cherbourg; Q - Queenstown; S - Southampton)'),
          tags$li('cabin - Cabin'),
          tags$li('cabin - Cabin')
        ),
	  	tags$br(),

	  	p(' Pclass is a proxy for socio-economic status (SES)'),
	  	tags$ul(
	  	  tags$li('1st - Upper'),
	  	  tags$li('2nd - Middle'),
	  	  tags$li('3rd - Lower')
	  	)

    ),

    mainPanel(
		  p("We are exploring Kaggle's Titanic training dataset that is available here:"),
		  a("https://www.kaggle.com/c/titanic/data"),
		  tags$br(),
		  tags$br(),

  		p('You can change the variables on the sidebar.'),
  		p('You can change which variable go the the X-axis, Y-axis, color by variable, and include jitter, smooth, and row/column facets.'),
  		p('From the default settings, the plot is intended to allow the comparison among some variables:'),
  		tags$ul(
  			tags$li('Compare the sex of the Survivors.'),
  			tags$li('Compare the classes of Passengers.'),
  			tags$li('Compare age of Passengers.')
  		),
	  	tags$br(),
	  	tags$br(),

		  plotOutput('plot')
	 )
	)
))
