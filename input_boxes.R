#' input boxes
#'
#' create ui for input boxes
#'
#'

discName_box <- function() {
  box(
    status = "success",
    title = "Disc Adder",
    width = 12,
    collapsible = TRUE,
    collapsed = TRUE,
    solidHeader = TRUE,
    sidebar = boxSidebar(
      id = "discNameSideBar",
      width = 60,
      icon = icon("info-circle", class = "fas fa-info-circle"),
      textAreaInput(inputId ="discNameSidebarText",
                    label = "Enter Info On Each Of Your Discs",
                    value = "For each disc you have or plan on using with this app you must input its information here. Name, Color, and Weight will be used to help you discern your different discs from each other later on in the apps data visualization and storytelling portions. Data disc flight numbers, age, type and weight will be used to compute statistics in order to provide insights for you on what your discs do and how that has changed over time and practice.",
                    width = "90%",
                    height = "250px"
      )
    ),
    fluidRow(
      column(
        width = 3,
        textInput(
          inputId = "discName",
          label = "Disc Name",
          placeholder = "Enter Disc Name"
        )
      ),
      column(
        width = 3,
        textInput(
          inputId = "discColor",
          label = "Disc Color",
          placeholder = "Enter Disc Color"
        )
      ),
      column(
        width = 3,
        dateInput(
          inputId = "discAge",
          label = "Purchase Date",
          format = "mm-yyyy"
        )
      ),
      column(
        width = 3,
        numericInput(
          inputId = "discWeight",
          label = "Weight (g)",
          value = 0
        )
      )
    ),
    fluidRow(
      column(
        width = 2,
        selectizeInput(
          inputId = "speed",
          label = "Speed",
          choices = c(1:15)
        )
      ),
      column(
        width = 2,
        selectizeInput(
          inputId = "glide",
          label = "Glide",
          choices = c(0:8)
        )
      ),
      column(
        width = 2,
        selectizeInput(
          inputId = "turn",
          label = "Turn",
          choices = c(0:-5)
        )
      ),
      column(
        width = 2,
        selectizeInput(
          inputId = "fade",
          label = "Fade",
          choices = c(0:4)
        )
      ),
      column(
        width = 4,
        selectizeInput(
          inputId = "condition",
          label = "Condition of Disc",
          choices = c("Mint", "Like New", "Good",
                      "Worn", "Destroyed")
        )
      )
    ),
    fluidRow(
      column(
        width = 4,
        selectizeInput(
          inputId = "discType",
          label = "Disc Type",
          choices = c(
            "Putter",
            "Approach",
            "Mid",
            "Fairway / Control Driver",
            "Distance Driver"
          )
        )
      ),
      column(
        width = 4,
        offset = 7,
        actionButton(inputId = "addDisc",
                     label = "Add Disc To Collection")
      )
    )
  )
}


instructional_media_box <- function() {
  box(
    status = "info",
    title = "Instructional Media",
    width = 12,
    collapsible = TRUE,
    collapsed = TRUE,
    solidHeader = TRUE,
    sidebar = boxSidebar(
      id = "instructionalMediaSidebar",
      width = 60,
      icon = icon("info-circle", class = "fas fa-info-circle"),
      textAreaInput(inputId ="instructionalMediaSidebarText",
                    label = "Do You Learn Better From YouTube or Blogs? Lets See..",
                    value = "Here we collect information like movies and articles you have watched and read in order to help you disc golf game. Media such as How To Putt Better In 5 Steps along with how many times you have consumed the media and when you did so. This information will be compiled along with your performance and practice data in search of any insights or perceived perfomance edges you may have received.",
                    width = "90%",
                    height = "250px"
      )
    ),
    fluidRow(
      column(
        width = 4,
        selectizeInput(
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
}


exercise_box <- function() {
  box(
    status = "danger",
    title = "Exercise / Training",
    width = 12,
    collapsible = TRUE,
    collapsed = TRUE,
    solidHeader = TRUE,
    sidebar = boxSidebar(
      id = "exerciseSideBar",
      width = 60,
      icon = icon("info-circle", class = "fas fa-info-circle"),
      textAreaInput(inputId ="exerciseSidebarText",
                    label = "Are All Exercises Routines Created Equally? Of Course Not! What Works Best For You?",
                    value = "This should be pretty straight forward. Enter information on your exercise and training routines. The data will be accumulated along with performance data in search of insights and correlations between how well you are doing and how many times or which practices you have been doing.",
                    width = "90%",
                    height = "250px"
      )
    ),
    fluidPage(fluidRow(
      column(
        width = 4,
        selectizeInput(
          inputId = "activityType",
          label = "Type Of Activity",
          choices = c(
            "Pro-Pull",
            "11s",
            "5-Up",
            "10-Up",
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
    ), ),
    
    conditionalPanel(condition = "input.activityType == 'Pro-Pull'",
                     propullPage),
    conditionalPanel(condition = "input.activityType == '11s'",
                     elevensPage),
    conditionalPanel(condition = "input.activityType == 'Towel Drill'",
                     towelDrillPage)
  )
}

propullPage <- fluidPage(
  fluidRow(column(
    width = 6,
    selectizeInput(
      inputId = "hand",
      label = "Backhand / Forehand",
      choices = c("Backhand", "Forehand")
    )
  ),
  column(
    width = 6,
    selectizeInput(
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
    offset = 8,
    actionButton(inputId = "submitProPull",
                 label = "Submit Pro-Pull Workout")
  ))
)

elevensPage <- fluidPage(
  fluidRow(
    column(width = 2,
           selectizeInput(
             inputId = "11ft",
             label = "11ft",
             choices = c(0:5)
           )),
    column(width = 2,
           selectizeInput(
             inputId = "22ft",
             label = "22ft",
             choices = c(0:5)
           )),
    column(width = 2,
           selectizeInput(
             inputId = "33ft",
             label = "33ft",
             choices = c(0:5)
           )),
    column(width = 2,
           selectizeInput(
             inputId = "44ft",
             label = "44ft",
             choices = c(0:5)
           )),
    column(width = 2,
           selectizeInput(
             inputId = "55ft",
             label = "55ft",
             choices = c(0:5)
           )),
    column(width = 2,
           selectizeInput(
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
    column(width = 4,
           numericInput(
             inputId = "towelSnaps",
             label = "Snaps Per Rep",
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
      offset = 8,
      actionButton(inputId = "towelDrillSubmit",
                   label = "Submit Towel Drill Data")
    )
  )
)

throw_box <- function(){
  box(
    status = "warning",
    title = "Add Throw",
    width = 12,
    collapsible = TRUE,
    collapsed = TRUE,
    solidHeader = TRUE,
    sidebar = boxSidebar(
      id = "throwSidebar",
      width = 60,
      icon = icon("info-circle", class = "fas fa-info-circle"),
      textAreaInput(inputId ="throwSidebarText",
                    label = "How Is That Bomber Coming Along?",
                    value = "Enter data on individual throws, side-arm or backhand, for us to collect and organize your performance data. This information will help us find out how you have been improving and what key variables such as a specific exercise routine or instructional media type help you the most.",
                    width = "90%",
                    height = "250px"
      )
    ),
    fluidRow(
      column(
        width = 4,
        selectizeInput(
          inputId = "selectDisc",
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
        selectizeInput(
          inputId = "power",
          label = "Power",
          choices = c("Highest",
                      "High",
                      "Normal",
                      "Low",
                      "Lowest"),
          selected = "Normal"
        )
      ),
      column(
        width = 3,
        selectizeInput(
          inputId = "quality",
          label = "Quality / Accuracy",
          choices = c("Best",
                      "Normal",
                      "Poor"),
          selected = "Normal"
        )
      )
    )
  )
}

wellbeing_box <- function(){
  box(
    status = "info",
    title = "Wellbeing",
    width = 12,
    collapsible = TRUE,
    collapsed = TRUE,
    solidHeader = FALSE,
    sidebar = boxSidebar(
      id = "wellbeingSidebar",
      width = 60,
      icon = icon("info-square", class = "fas fa-info-circle"),
      textAreaInput(inputId ="wellnessSidebarText",
                label = "For Best Results Answer Twice Daily",
        value = "Once when you wake up and once before bed. The Wellbeing Survey consists of a set of subjective question focused around your current emotional and physical wellbeing. You should not think too hard to spend much time on any single question. There are no right answers, only how you feel. Do not hesitate when you feel between two optional states. The wonders of statistics will take care of any fuss between exactly pinning down the best possible answer for any one question. It is far more important that you answer the questions as consistently as possible. That requires quick, no fuss responses.",
        width = "90%",
        height = "250px"
      )
    ),
    fluidRow(
      column(width = 2,
             dateInput(inputId = "wellbeingDate", 
                       label = "Select Date",
                       format = "dd-mm-yy")
      ),
      column(width = 4,
             timeInput(inputId = "wellbeingTime",
                       label = "Enter Time",
                       value = Sys.time())
      ),
      column(width = 3,
             selectizeInput(inputId = "wellnessWholeness",
                            label = "How Do You Feel?",
                            choices = c("At One",
                                        "Calm",
                                        "Normal",
                                        "Irritable",
                                        "Pissed Off"),
                            selected = "Normal"
             )
      ),
      column(width = 3,
             selectizeInput(inputId = "wellnessHydration",
                            label = "Level of Hydration",
                            choices = c("Hydrated",
                                        "Normal",
                                        "Dehydrated"),
                            selected = "Normal"
             )
      )
    ),
    fluidRow(
      column(width = 3,
             numericInput(inputId = "wellnessSleep",
                          label = "Hour of Sleep Last Night",
                          value = 0)
      ),
      column(width = 3,
             selectizeInput(inputId = "wellnessEnergy",
                            label = "Amount of Energy",
                            choices = c("Buzzed",
                                        "Alert",
                                        "Normal",
                                        "Low",
                                        "Dead"),
                            selected = "Normal"
             )
      ),
      column(width = 3,
             selectizeInput(inputId = "wellnessEmotion",
                            label = "Current Emotion",
                            choices = c("High",
                                        "Normal",
                                        "Depressed"),
                            selected = "Normal"
             )
      ),
      column(width = 3,
             selectizeInput(inputId = "wellnessFocus",
                            label = "Level of Focus",
                            choices = c("Laser Focus",
                                        "Focused",
                                        "Normal",
                                        "Destracted",
                                        "Spaced Out"),
                            selected = "Normal")
      )
    ),
    fluidRow(
      column(width = 3,
             numericInput(inputId = "wellnessMeal",
                          label = "Hours Since Last Meal",
                          value = 0)
      ),
      column(width = 3,
             selectizeInput(inputId = "wellnessMuscles",
                            label = "Are Your Muscles",
                            choices = c("Warmed-Up",
                                        "Normal",
                                        "Cold"),
                            selected = "Normal"
             )
      ),
      column(width = 3,
             selectizeInput(inputId = "wellnessBody",
                            label = "Is Your Body",
                            choices = c("Limber",
                                        "Normal",
                                        "Stiff / Sore"),
                            selected = "Normal"
             )
      )
    ),
    fluidRow(
      column(width = 3,
             offset = 8,
             actionButton(inputId = "wellnessSubmit",
                          label = "Submit Wellness Data"))
    )
  )
}