#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application
shinyUI(fluidPage(

    # Application title
    titlePanel("Fixed rate mortgage calculator"),

    # Sidebar for mortgage details
    sidebarLayout(
        sidebarPanel(
            fluidRow(
                h3("General"),
                numericInput("borrow",
                             "Borrowing (£)",
                             value = 100000),
                numericInput("period",
                             "Fixed period (years)",
                             value = 2),
                hr(),
                h3("Mortgage 1"),
                numericInput("fee_1",
                             "Fee (£)",
                             value = 0),
                numericInput("interest_rate_1",
                             "Interest rate (%)",
                             value = 2.2),
                numericInput("repayment_pcm_1",
                             "Monthly repayment (£)",
                             value = 500),
                hr(),
                h3("Mortgage 2"),
                numericInput("fee_2",
                             "Fee (£)",
                             value = 0),
                numericInput("interest_rate_2",
                             "Interest rate (%)",
                             value = 3),
                numericInput("repayment_pcm_2",
                             "Monthly repayment (£)",
                             value = 500),
                hr(),
                h3("Mortgage 3"),
                numericInput("fee_3",
                             "Fee (£)",
                             value = 0),
                numericInput("interest_rate_3",
                             "Interest rate (%)",
                             value = 2.5),
                numericInput("repayment_pcm_3",
                             "Monthly repayment (£)",
                             value = 500),
                hr(),
                h3("Mortgage 4"),
                numericInput("fee_4",
                             "Fee (£)",
                             value = 0),
                numericInput("interest_rate_4",
                             "Interest rate (%)",
                             value = 3.1),
                numericInput("repayment_pcm_4",
                             "Monthly repayment (£)",
                             value = 500)
            )),


        # Show a plot of the costs
        mainPanel(
            fluidRow(
                plotOutput("costPlot"),
                h3("About"),
                p("test")
        ))
    )
))
