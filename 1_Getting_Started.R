#Introduction to R and RStudio by Matt Steele WVU
  # R download and documentation - https://cran.r-project.org/
  # RStudio download and documentation - https://rstudio.com/
  # RStudio Cloud - http://rstudio.cloud/

# This workshop was developed using the O'Reilly Platform Lesson video - R Programming for Statistics and Data Science - which can accessed at 
      # http://www.libproxy.wvu.edu/login?url=https://learning.oreilly.com/videos/r-programming-for/9781789950298
      # For more in-depth information and practical exercises on using R for Data science, I highly suggest using this resource

#Getting to know R - Basic Functions

#Console Pane - this is the pane on the left hand side of the monitor. When the Source pane is open it will drop to the bottom of the screen. You use it to run commands and see the results of your commands. It also has a tab to run a bash shell. Let's try a basic command that you should run every time you open a R project and that is the command to see what directory you are currently working in.

  getwd() #using the keyboard shortcut Ctrl + Enter (Windows) or  CMD + Enter (Mac), while automatically run the associated lines of code for the line you are on.
  setwd("~/R/Lesson_Files") - #The directory has to exist or you will get an error message
    
#Now lets import the files for this lesson using the Github clone option. To do this, open up the Terminal tab in your Console pane. It should be set your working directory
    # Copy and Paste in the following (You cannot use Ctrl + Enter in the Bash shell. You also cannot use Ctrl + V to paste so you will need to right-click with your mouse or CMD + Click)
    
          git clone "https://github.com/mattwvu/researchcommonsR.git"
          setwd("~/R/researchcommonsR")
            
    
#Now the files should be available. Let's open up our first script. In the menu click on File > Open File and choose 1_Getting_Started. You can alternatively choose it from the Files pane on the bottom right.
  
  
#Source Pane - this is the pane that you are viewing this script in. In the Source pane you create and edit scripts which you can then run in the console. While you can run commands in the console, it is important that you can use to using the source pane for writing your commands.
  #	savable
  # commenting
  # adjustable
  # editor marks error
    # x  for syntax errors
    # ! for potential problem later
  
#Lets try running some basic math from the Source Pane. Remember to use you keyboard shortcuts
  
  ## Basic Commands ##
  
  # Addition:
  129 + 3483
  
  # Subtraction:
  23693 - 4536
  
  # Multiplication:
  23 * 45
  
  # Division:
  51/3
  
  # Exponents:
  2^4
  
  # Logarithms (base e):
  log(100)
  
  # Range
  1:12

  # Sample
  sample(1:50, 10)
  
  # 
  
# Objects  
# One of the most important things to learn about in R is to learn how to create objects. In R you create objects and assign values to them through functions. Objects are named data structures that store data which you can call over and over. An object can be a single digit, a character, a sentence, a Boolean, a data frame, a list of data frames.
  
  #The convention to create an object is 
    #object name <- value 
  
  #When you name an object there are conventions to follow
    #1 Start with lowercase
    #2 Use letters, numbers, punctuation, and underscores
      # Example 1 -  longer.name
      # Example 2 - longer_name
      # Example 3 - longerName
  #All three example are as equally valued to use, but an important thing to remember is to be consistent
  
#Let's create a function called resultCool
  
  resultCool <- 2 + 3
    print(c("The result of 2 + 3 is ", resultCool, "cool"))
  
#There are a couple of things to notice here. 

#First if you look up in our environments pane you can see that our object is now being listed in it. In R, an environment is a workspace and you can store objects and data. You can also save your workspace so you can call it up when you load RStudio again.
    
#Second, did you see how we combined multiple functions in this example. We did things using c and the comma. This tell R to combine the three elements and the comma tells it how to seperate them.
    
#Third, whenever you are using characters that you do not want to use for calculations (strings), you need to put them in quotations. This tells R that it is a string. 
    
    sampleRange <- sample(1:50, 10)/10
    sampleRange
    sampleRange * 100
    

#Help
    
#R is a code-based command program that has an abundance of commands and functions at you disposal. So, it is important to know that it is okay to not be sure what something does. Luckily R is very helpful. In the Help tab in the Files Panel you can find tutorials, cheat sheets (for available functions and commands), and explanations and examples of using commands and functions. 
    #Additionally, while you are working, you can easily find out information on something you are trying execute by using the ?, or help()
    
    ?vector - #for example, we will soon learn about vectors. Run this line of code to get a sneak peak at what they are.
    help(print)
    help(sum)
    
#Packages 

#	R is open source – after it’s initial development people began adding to it with packages. An R Package is something that you can plug into RStudio to extend the basic functionality that is built in with R. One of the reasons that R has become so popular is because it has this rich ecosystem of packages that really make R a comprehensive platform for data science.
  #For this workshop we are going to use a package called Tidyverse that was created for people working with data. Let's load it up and install it now.
      
      install.packages("tidyverse") #You only have to install a package once on you computer
      
      library(tidyverse) #however you do need to call a package, every session you plan on using it

# Okay on to the Vecotrs, Matrices, and Data Frames. Open 2_Vectors_Matrices_Data_Frames using the File Menu of Files pane. 
    
    
    

    
