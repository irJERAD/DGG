library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(shinyTime)

sidebar = dashboardSidebar(sidebarMenu(
    id = "disc-add",
    menuItem(
        "Add Disc",
        menuSubItem(
            textInput("disc-name",
                      label = "Disc Names",
                      placeholder = "Enter Disc Name"),
            icon = NULL
        ),
        fluidRow(
            column(width = 1,
                   selectInput(
                       "speed", label = "Speed",
                       choices = c(1:15)
                   )),
            column(width = 1),
            column(width = 1,
                   selectInput(
                       "glide", label = "Glide",
                       choices = c(0:8)
                   )),
            column(width = 1),
            column(width = 1,
                   selectInput(
                       "turn", label = "Turn",
                       choices = c(0:-5)
                   )),
            column(width = 1),
            column(width = 1,
                   selectInput(
                       "fade", label = "Fade",
                       choices = c(0:4)
                   ))
        ),
        actionButton(inputId = "add-disc-sb", label = "Add Disc")
    )
))

disc_adder_box = box(
    status = "success",
    title = "Disc Adder",
    width = 12,
    collapsible = TRUE,
    collapsed = TRUE,
    solidHeader = TRUE,
    fluidRow(
        column(
            width = 4,
            textInput("disc-name", label = "Disc Name",
                      placeholder = "Enter Disc Name")
        ),
        column(
            width = 4,
            textInput("disc-color", label = "Disc Color",
                      placeholder = "Enter Disc Color")
        ),
        column(
            width = 4,
            dateInput(
                inputId = "disc-age",
                label = "Apx Purchase Date",
                format = "mm-yyyy"
            )
        )
    ),
    fluidRow(
        column(width = 2,
               selectInput(
                   "speed", label = "Speed",
                   choices = c(1:15)
               )),
        column(width = 2,
               selectInput(
                   "glide", label = "Glide",
                   choices = c(0:8)
               )),
        column(width = 2,
               selectInput(
                   "turn", label = "Turn",
                   choices = c(0:-5)
               )),
        column(width = 2,
               selectInput(
                   "fade", label = "Fade",
                   choices = c(0:4)
               )),
        column(width = 4,
               selectInput(
                   "wear",
                   label = "Wear on Disc",
                   choices = c("Mint", "Like New", "Good",
                               "Worn", "Destroyed")
               ))
    ),
    fluidRow(column(width = 8),
             column(
                 width = 4,
                 actionButton(inputId = "add-disc",
                              label = "Add Disc To Collection")
             ))
)

instructional_media_adder_box = box(
    status = "info",
    title = "Instructional Media",
    width = 12,
    collapsible = TRUE,
    collapsed = TRUE,
    solidHeader = TRUE,
    fluidRow(
        column(
            width = 4,
            selectInput(
                inputId = "media-type",
                label = "Media Type",
                choices = c("Video",
                            "Article",
                            "Workshop",
                            "FirstHand Account")
            )
        ),
        column(
            width = 4,
            numericInput(
                inputId = "replays-rereads",
                label = "Replays / Rereads",
                value = 1
            )
        ),
        column(
            width = 4,
            numericInput(
                inputId = "time-invested",
                label = "Time Invested (min)",
                value = 10
            )
        )
    ),
    fluidRow(column(width = 8),
             column(
                 width = 4,
                 actionButton(inputId = "add-instructional",
                              label = "Add Instructional To Data")
             ))
)

propullPage <- fluidPage(
    fluidRow(column(
        width = 6,
        selectInput(
            inputId = "hand",
            label = "Backhand / Forehand",
            choices = c("Backhand", "Forehand")
        )
    ),
    column(
        width = 6,
        selectInput(
            inputId = "resistanceBand",
            label = "Resistance Band",
            choices = c("Yellow", "Green", "Yellow & Green")
        )
    )),
    fluidRow(
        column(
            width = 3,
            numericInput(
                inputId = "pullThrough",
                label = "Pull Through",
                value = 0
            )
        ),
        column(
            width = 3,
            numericInput(
                inputId = "backHold",
                label = "Rear Hold",
                value = 0
            )
        ),
        column(
            width = 3,
            numericInput(
                inputId = "midFreeze",
                label = "Mid Hold",
                value = 0
            )
        ),
        column(
            width = 3,
            numericInput(
                inputId = "frontFreeze",
                label = "Front Hold",
                value = 0
            )
        )
    ),
    fluidRow(column(
        width = 4,
        offset = 7,
        actionButton(inputId = "submitProPull",
                     label = "Submit Pro-Pull Workout")
    ))
)

elevensPage <- fluidPage(
    fluidRow(
        column(width = 2,
               selectInput(
                   inputId = "11ft",
                   label = "11ft",
                   choices = c(0:5)
               )),
        column(width = 2,
               selectInput(
                   inputId = "22ft",
                   label = "22ft",
                   choices = c(0:5)
               )),
        column(width = 2,
               selectInput(
                   inputId = "33ft",
                   label = "33ft",
                   choices = c(0:5)
               )),
        column(width = 2,
               selectInput(
                   inputId = "44ft",
                   label = "44ft",
                   choices = c(0:5)
               )),
        column(width = 2,
               selectInput(
                   inputId = "55ft",
                   label = "55ft",
                   choices = c(0:5)
               )),
        column(width = 2,
               selectInput(
                   inputId = "66ft",
                   label = "66ft",
                   choices = c(0:5)
               ))
    ),
    fluidRow(
        column(
            width = 2,
            numericInput(
                inputId = "time-played",
                label = "Amount of Time (min)",
                value = 0
            )
        ),
        column(
            width = 3,
            offset = 9,
            actionButton(inputId = "submit-score",
                         label = "Submit Score")
        )
    )
)

towelDrillPage <- fluidPage(
    fluidRow(
    column(
        width = 4,
        numericInput(
            inputId = "towelReps",
            label = "Reps",
            value = 0
        )
    ),
    column(
        width = 4,
        numericInput(
            inputId = "towelTime",
            label = "Time (min)",
            value = 0
        )
    )
    ),
    fluidRow(
    column(
        width = 4,
        offset = 7,
        actionButton(inputId = "towelDrillSubmit",
                     label = "Submit Towel Drill Data")
    )
    )
)

exercise_adder_box = box(
    status = "danger",
    title = "Exercise / Training",
    width = 12,
    collapsible = TRUE,
    collapsed = TRUE,
    solidHeader = TRUE,
    fluidPage(fluidRow(
        column(
            width = 4,
            selectInput(
                inputId = "activityType",
                label = "Type Of Activity",
                choices = c(
                    "Pro-Pull",
                    "11s",
                    "10 and Go",
                    "Towel Drill",
                    "Driving Net",
                    "Free Putt"
                )
            )
        ),
        column(
            width = 3,
            dateInput(
                inputId = "activity-date",
                label = "Date of Activity",
                format = "dd-mm-yyyy"
            )
        ),
        column(
            width = 5,
            timeInput(
                inputId = "activity-time",
                label = "Time of Activity",
                value = Sys.time()
            )
        )
    ),),
    
    conditionalPanel(condition = "input.activityType == 'Pro-Pull'",
                     propullPage),
    conditionalPanel(condition = "input.activityType == '11s'",
                     elevensPage),
    conditionalPanel(condition = "input.activityType == 'Towel Drill'",
                     towelDrillPage)
)

throw_adder_box <- box(
    status = "warning",
    title = "Add Throw",
    width = 12,
    collapsible = TRUE,
    collapsed = TRUE,
    solidHeader = TRUE,
    fluidRow(
        column(
            width = 4,
            selectInput(
                inputId = "select-disc",
                label = "Select Disc",
                choices = c(
                    "Create Variable",
                    "Pull Data From gDocs",
                    "Iterative Display Here"
                )
            )
        ),
        column(
            width = 2,
            numericInput(
                inputId = "distance",
                label = "Distance",
                value = 0
            )
        ),
        column(
            width = 3,
            selectInput(
                inputId = "power",
                label = "Power",
                choices = c("Highest",
                            "High",
                            "Average",
                            "Low",
                            "Lowest"),
                selected = "Average"
            )
        ),
        column(
            width = 3,
            selectInput(
                inputId = "quality",
                label = "Quality",
                choices = c("Best",
                            "Average",
                            "Poor"),
                selected = "Average"
            )
        )
    )
)

body = dashboardBody(
    disc_adder_box,
    instructional_media_adder_box,
    exercise_adder_box,
    throw_adder_box
)

shinyApp(
    ui = dashboardPage(
        skin = "midnight",
        dashboardHeader(
            title = "Disc Golf Growth App",
            disable = FALSE,
            dropdownMenuOutput("Add Disc")
        ),
        sidebar,
        body
    ),
    server = function(input, output) {
        
    }
)