#' import libraries
#'
library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(shinyTime)
library(googlesheets4)
library(shinyjs)
library(gargle)

#' load functions
source('reset_boxes.R')
source('input_boxes.R')

## --- connect to google sheets
options(
  gargle_oauth_cache = ".secrets",
  gargle_oauth_email = TRUE
)
gs4_auth(email = "jsacosta1103@gmail.com")

## --- search for existing DGG sheets
## --- else create appropriate DGG sheets
### --- Search for or create DGG Discs sheet
## --- Disc Name sheet
discs <- gs4_find("DGG Discs")[1, ]$id

if (is.na(discs)) {
  df <- as.data.frame(matrix(ncol = 10, nrow = 0))
  names(df) <- c(
    "Disc Name",
    "Speed",
    "Glide",
    "Turn",
    "Fade",
    "Disc Type",
    "Disc Color",
    "Disc Weight",
    "Purchase Date",
    "Disc Condition"
  )
  
  discsSheet <- gs4_create(name = "DGG Discs", sheets = df)
  discs <- discsSheet[1]
}

## --- Wellness Sheet
wellness <- gs4_find("DGG Wellness")[1, ]$id

if (is.na(wellness)) {
  df <- as.data.frame(matrix(ncol = 11, nrow = 0))
  names(df) <- c(
    "Date",
    "Time",
    "Wholeness",
    "Hydration",
    "Sleep",
    "Energy",
    "Emotion",
    "Focus",
    "Last Meal",
    "Muscles",
    "Body"
  )
  
  wellnessSheet <- gs4_create(name = "DGG Wellness", sheets = df)
  wellness <- wellnessSheet[1]
}


## --- build ui
## --- header
header <- dashboardHeader(title = "Disc Golf Growth App",
                          disable = FALSE,
                          dropdownMenuOutput("Add Disc"))

## --- sidebar
sidebar = dashboardSidebar(minified = TRUE,
                           collapsed = TRUE,
                           sidebarMenu(id = "sidebar"))

## --- data entry boxes
disc_adder_box <- discName_box()

instructional_media_adder_box <- instructional_media_box()

exercise_adder_box <- exercise_box()

throw_adder_box <- throw_box()

wellbeing_adder_box <- wellbeing_box()

## --- dashboard body
body = dashboardBody(
  useShinyjs(),
  disc_adder_box,
  instructional_media_adder_box,
  exercise_adder_box,
  throw_adder_box,
  wellbeing_adder_box
)

## --- assemble shiny app
shinyApp(
  ui = dashboardPage(skin = "midnight",
                     header,
                     sidebar,
                     body),
  
  
  server = function(input, output) {
    
    observeEvent(input$update, {
      updateBoxSidebar("mycardsidebar")
    })
    
    observeEvent(input$addDisc, {
      ## --- create data frame of single observation from Disc Name inputs
      data <-
        c(
          input$discName,
          input$speed,
          input$glide,
          input$turn,
          input$fade,
          input$discType,
          input$discColor,
          input$discWeight,
          input$discAge,
          input$condition
        )
      data <- rbind(data.frame(), data)
      ## --- append data frame to google sheets
      sheet_append(discs, data)
      ## --- reset input values
      reset_discName_box()
    })
    
    observeEvent(input$wellnessSubmit, {
      ## --- create data frame of single observation from input data
      data <-
        c(
          input$wellnessDate,
          input$wellnessTime,
          input$wellnessWholeness,
          input$wellnessHydration,
          input$wellnessSleep,
          input$wellnessEnergy,
          input$wellnessEmotion,
          input$wellnessFocus,
          input$wellnessMeal,
          input$wellnessMuscles,
          input$wellnessBody
        )
      data <- rbind(data.frame(), data)
      ## --- append data frame to google sheet
      sheet_append(wellness, data)
      ## --- Reset input values for wellness box
      reset_wellness_box()
    })
  }
)