library(plotly)

y <- c('The course was effectively<br>organized',
       'The course developed my<br>abilities and skills for<br>the subject',
       'The course developed my<br>ability to think critically about<br>the subject',
       'I would recommend this<br>course to a friend')
x1 <- c(21, 24, 27, 29)
x2 <-c(30, 31, 26, 24)
x3 <- c(21, 19, 23, 15)
x4 <- c(16, 15, 11, 18)
x5 <- c(12, 11, 13, 14)

data <- data.frame(y, x1, x2, x3, x4, x5)

top_labels <- c('Strongly<br>agree', 'Agree', 'Neutral', 'Disagree', 'Strongly<br>disagree')

p <- plot_ly(data, x = ~x1, y = ~y, type = 'bar', orientation = 'h',
             marker = list(color = 'rgba(128, 177, 211, 1)',
                           line = list(color = 'rgba(128, 177, 211, 1)', width = 1))) %>%
    add_trace(x = ~x2, marker = list(color = 'rgba(253, 180, 98, 0.8)',
                            line = list(color = 'rgba(253, 180, 98, 0.8)', width = 1))) %>%
    layout(xaxis = list(title = "",
                        showgrid = FALSE,
                        showline = TRUE,
                        showticklabels = TRUE,
                        zeroline = TRUE,
                        domain = c(0.3,1)
                        ),
           yaxis = list(title = "",
                        showgrid = FALSE,
                        showline = TRUE,
                        showticklabels = TRUE,
                        zeroline = TRUE
                        ),
           barmode = 'group',
           margin = list(l = 50, r = 20, t = 80, b = 80),
           showlegend = TRUE) %>%
    # labeling the y-axis
    add_annotations(xref = 'paper', yref = 'y', x = 0.14, y = y,
                    xanchor = 'right',
                    text = y,
                    font = list(family = 'Arial', size = 12,
                                color = 'rgb(67, 67, 67)'),
                    showarrow = FALSE, align = 'right') %>%
    # labeling the percentages of each bar (x_axis)
    add_annotations(xref = 'x', yref = 'y',
                    x = x1 / 2, y = y,
                    text = paste(data[,"x1"], '%'),
                    font = list(family = 'Arial', size = 12,
                                color = 'rgb(248, 248, 255)'),
                    showarrow = FALSE) %>%
    add_annotations(xref = 'x', yref = 'y',
                    x = x1 + x2 / 2, y = y,
                    text = paste(data[,"x2"], '%'),
                    font = list(family = 'Arial', size = 12,
                                color = 'rgb(248, 248, 255)'),
                    showarrow = FALSE) %>%
    add_annotations(xref = 'x', yref = 'y',
                    x = x1 + x2 + x3 / 2, y = y,
                    text = paste(data[,"x3"], '%'),
                    font = list(family = 'Arial', size = 12,
                                color = 'rgb(248, 248, 255)'),
                    showarrow = FALSE) %>%
    add_annotations(xref = 'x', yref = 'y',
                    x = x1 + x2 + x3 + x4 / 2, y = y,
                    text = paste(data[,"x4"], '%'),
                    font = list(family = 'Arial', size = 12,
                                color = 'rgb(248, 248, 255)'),
                    showarrow = FALSE) %>%
    add_annotations(xref = 'x', yref = 'y',
                    x = x1 + x2 + x3 + x4 + x5 / 2, y = y,
                    text = paste(data[,"x5"], '%'),
                    font = list(family = 'Arial', size = 12,
                                color = 'rgb(248, 248, 255)'),
                    showarrow = FALSE) %>%
    # labeling the first Likert scale (on the top)
    add_annotations(xref = 'x', yref = 'paper',
                    x = c(21 / 2, 21 + 30 / 2, 21 + 30 + 21 / 2, 21 + 30 + 21 + 16 / 2,
                          21 + 30 + 21 + 16 + 12 / 2),
                    y = 1.15,
                    text = top_labels,
                    font = list(family = 'Arial', size = 12,
                                color = 'rgb(67, 67, 67)'),
                    showarrow = FALSE)

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = plotly_POST(p, filename="horizontalbar/palette")
chart_link
