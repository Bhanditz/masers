http://www.astro.virginia.edu/class/oconnell/astr511/IDLguide.html

== I. INTRODUCTION ==
1. Key Features of IDL
+Interactive Data Language
+Designed specifically for 1D, 2D, 3D data set representations for use by scientists
+Dedicated computer language with the power of high level programming languages incorporating three major qualities
   Interactivity
   Graphical Display
   Array-oriented operation
      Permits array referencing without the use of subscripts or do-loops
+Large number of features:
   rapid response and iteration,
   immediate access to all variables (stored in RAM),
   immediate access to all source code (except Exelis-written proprietary routines),
   optimized array operations,
   dynamic variable typing and memory allocation,
   on-demand compilation and linking of routines,
   versatile built-in plotting and graphics routines,
   interactive session journal-keeping,
   command recall/edit,
   command scripts,
   data structures, 
   flexible parameter specification in subroutine calls,
   structured syntax, 
   full integration with windows systems, 
   support for all common scientific I/O protocols, 
   widgit (GUI) and object-oriented programming, and 
   a large suite of mathematical, data analysis, & special interactive utility routines.

2. IDL in Context
+IDL supplies standard interactive environment and graphics device drivers, edge over others
+MATLAB etc have more equation solving math analysis, IDL has more data analysis image display and processing

3. IDL Applications Packages
+Over 10k different user-written programs
+IDL has become universal astronomical data analysis system
+App Source code available
+No pre-compilation required
+For examples run idldemo from cli

4. The IDL Environment
+As typed, each line is immediately interpreted and executed
+Each line must stand alone, they do not reference each other
+Do not have to declare variables in advance, memory expands as necessary
+Array command operations do not require subscripts, automatically vectorized
+Execute previously written files as "main programs" or "procedures" (subroutines)
   Utilize loops, blocks, etc
+One command can also execute scripts
+Scripts and procedures copied in using journal
+Save results of computations, save formate free data and programs
+Everything is stored in RAM, file transfer not required
+Journal maintains exact record of each command and response
+Create subroutinw using .run command

5. IDL Limitations
+Interpreted rather than compiled can hinder execution speed but improve efficiency


II. GUIDE TO IMAGE PROCESSING WITH IDL
1. Starting & Stopping IDL
+Current display properties assumed by IDL: help,/dev
+IDL executes "startup" file defined in $IDL_STARTUP environment table
+Execute personal file by typine @[filename]
+Linux commands w/in IDL: $ as first character
+Interrupt and resume IDL: ^z and fg
+Interrupt IDL routine: type ^c, to continue type .con
   To exit after interrupt and return to main level, type retall
+Repeat or edit and execute earlier command
   CLI entries stored in command recall buffer (tcsh)
   Up and down arrows to move through commands
   Increase history beyond 20 commands: !EDIT_INPUT=100 in startup file
   ^d on an empty line will terminate session
+Continue long statement on following line: End with $
+Multiple commands same line: one &
+Exit: exit or ^d, save before exiting because all memory will be flushed

2. Help
+Bunch of links
   http://www.astro.virginia.edu/class/oconnell/astr511/IDLguide.html#help
+View public routines during IDL session type .run -t [routine name]
+idlhelp or idlman in linux prompt
+? opens help in IDL
+?[command] shows help info for command
+[command without arguments] displays list of expected arguments
