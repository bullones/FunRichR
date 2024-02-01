# library(shiny)
# shiny app user interface
ui <- fluidPage(
  # application title
  titlePanel("Total TFs (BP)"),
  # layout with a sidebar and a main panel
  sidebarLayout(
    # panel with parameters controls
    sidebarPanel(
      conditionalPanel('input.dataset === "tf_all_df"',
                       checkboxGroupInput("show_vars", "Columns to show:",
                                          names(tf_all_df),
                                          selected = names(tf_all_df))
      )),
    # panel showing the results
    mainPanel(tabsetPanel(id = 'dataset',
                          tabPanel("tf_all_df",
                                   plotOutput(outputId = "myplot", width = "100%", height = "600px"))
    ))))

# with table output
# mainPanel(tabsetPanel(id = 'dataset',
#                       tabPanel("tf_all_df",
#                                DT::dataTableOutput("mytable"))
#                       ),
#           plotOutput(outputId = "myplot", width = "100%", height = "500px"))))

# panel showing the results
#choose columns to display
disp <- length(rownames(tf_all_df)) # number of registers to display
# shiny app server logic
server <- function(input, output) {
  tf_all_df2 = tf_all_df[sample(nrow(tf_all_df), disp), ]
  output$mytable <- DT::renderDataTable({
    DT::datatable(tf_all_df2[, input$show_vars, drop = FALSE])
  })

  output$myplot <- renderPlot({
    # modify dataframe
    tf_all_df3 <- tf_all_df[, colnames(tf_all_df) %in% input$show_vars]
    tf_all_df3 <- subset(tf_all_df3, rowSums(tf_all_df3, na.rm = TRUE) > 0)
    tf_all_df3$family <- rownames(tf_all_df3)
    tf_all_df3 <- melt(tf_all_df3, id.vars = "family")
    max_breaks <- max(tf_all_df3$value, na.rm = TRUE)
    # num_breaks <- 0 # define number of breaks in next ifelse
    # ifelse(max_breaks <= 6, num_breaks <- 1, num_breaks <- 2)
    tf_all_df3[is.na(tf_all_df3)] <- 0
    # plot
    ggplot(data = tf_all_df3,
           # data = tf_all_df3[tf_all_df3$variable %in% input$show_vars,],
           aes(x = value, y = family)) +
      geom_bar(stat = "identity") +
      facet_grid(.~variable) + # split per condition
      scale_x_continuous(breaks = seq(0, max_breaks, 1)) +
      theme(panel.grid.major = element_blank(), # remove major grid
            panel.grid.minor = element_blank(), # remove minor grid
            panel.background = element_blank(), # remove background
            # axis.title = element_text(face = "bold"), # bold axis labs
            axis.title.x = element_text(face = "bold",
                                        margin = margin(t = 20,
                                                        r = 0,
                                                        b = 0,
                                                        l = 0)),
            axis.title.y = element_text(face = "bold",
                                        margin = margin(t = 0,
                                                        r = 20,
                                                        b = 0,
                                                        l = 0)),
            strip.text = element_text(face = "bold", # bold facet labs
                                      #size = "", # can also change size
                                      #color = "" # and color
                                      )#,
            # strip.background = element_rect(fill = "", # can also change facet background color
            #                                 size = "",
            #                                 linetype = "solid")
            ) +
      theme(text = element_text(size = 16)) +
      xlab("Amount of TFs") +
      ylab("Family")
  })
}

shinyApp(ui, server)
