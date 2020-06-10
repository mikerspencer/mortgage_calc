#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$costPlot <- renderPlot({

        # draw the plot of mortgage costs
        tibble(mort = c("Mortgage 1", "Mortgage 2", "Mortgage 3", "Mortgage 4"),
               cost = c(total_cost(input$borrow,
                                   input$fee_1,
                                   input$period,
                                   input$interest_rate_1,
                                   input$repayment_pcm_1),
                        total_cost(input$borrow,
                                   input$fee_2,
                                   input$period,
                                   input$interest_rate_2,
                                   input$repayment_pcm_2),
                        total_cost(input$borrow,
                                   input$fee_3,
                                   input$period,
                                   input$interest_rate_3,
                                   input$repayment_pcm_3),
                        total_cost(input$borrow,
                                   input$fee_4,
                                   input$period,
                                   input$interest_rate_4,
                                   input$repayment_pcm_4))) %>%
            ggplot(aes(mort, cost)) +
            geom_col() +
            labs(x = "",
                 y = "Cost (£)") +
            theme_bw() +
            theme(text = element_text(size = 20))

    })

    output$formattable = renderFormattable({

      tibble(Mortgage = c("Mortgage 1", "Mortgage 2", "Mortgage 3", "Mortgage 4"),
             Cost = c(total_cost(input$borrow,
                                 input$fee_1,
                                 input$period,
                                 input$interest_rate_1,
                                 input$repayment_pcm_1),
                      total_cost(input$borrow,
                                 input$fee_2,
                                 input$period,
                                 input$interest_rate_2,
                                 input$repayment_pcm_2),
                      total_cost(input$borrow,
                                 input$fee_3,
                                 input$period,
                                 input$interest_rate_3,
                                 input$repayment_pcm_3),
                      total_cost(input$borrow,
                                 input$fee_4,
                                 input$period,
                                 input$interest_rate_4,
                                 input$repayment_pcm_4))) %>%
        mutate(Cost = currency(Cost, "£")) %>%
        formattable(list(Cost = color_bar("pink")))

    })

})
