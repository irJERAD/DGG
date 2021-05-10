#' reset_boxes.R
#' 
#' to organize all functions that reset inputs of survey boxes
#' these are the organize location for collecting data from the user
#' 
#'  

reset_discName_box <- function(){
  updateTextInput(inputId = "discName", value = "", 
                  placeholder = "Next Disc Name")
  updateTextInput(inputId = "discColor", value = "",
                  placeholder = "Enter Disc Color")
  updateNumericInput(inputId = "discWeight", value = 0)
  updateSelectizeInput(inputId = "speed", selected = "1")
  updateSelectizeInput(inputId = "glide", selected = "0")
  updateSelectizeInput(inputId = "turn", selected = "0")
  updateSelectizeInput(inputId = "fade", selected = "0")
  updateSelectizeInput(inputId = "condition", selected = "Good")
  updateSelectizeInput(inputId = "discType", selected = "Putter")
}


reset_wellness_box <- function(){
  updateSelectizeInput(inputId = "wellnessWholeness", selected = "Normal")
  updateSelectizeInput(inputId = "wellnessHydration", selected = "Normal")
  updateNumericInput(inputId = "wellnessSleep", value = 0)
  updateSelectizeInput(inputId = "wellnessEnergy", selected = "Normal")
  updateSelectizeInput(inputId = "wellnessEmotion", selected = "Normal")
  updateSelectizeInput(inputId = "wellnessFocus", selected = "Normal")
  updateNumericInput(inputId = "wellnessMeal", value = 0)
  updateSelectizeInput(inputId = "wellnessMuscles", selected = "Normal")
  updateSelectizeInput(inputId = "wellnessBody", selected = "Normal")
}