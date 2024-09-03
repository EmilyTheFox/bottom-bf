// To start we want to set the second cell to our allowed input length for now: 100
++++++++++[>++++++++++<-]>
// This line here sets up (0){100} leaving the first cell empty and the 2nd with our desired amount of inputs

// Now we collect our input string
[
    [>] // Move forward by a cell until the next empty cell
    ,------------- // Get our input minus 13 into the cell

    // Shit gets complicated and annoying
    // If we give an enter we get (0)(5){0}(0)(0)
    // If we give a character we get (0)(5){84}(0)(0)
    // Now we move right 1 and set it to 1 and move back for (0)(5){input}(1)(0)
    >+<
    // If our input isn't 0 we move and set that next cell back to 0 for (0)(5)(84){0}(0)
    // However if our input IS 0 aka an enter we dont so we just get (0)(5){0}(1)(0)
    [>-]
    // Now we move right once more and if that value is 1 we execute code 
    // if the scenario we gave a character we are at (0)(5)(84)(0){0}
    // in the scenario we didnt we are at (0)(5)(0){1}(0)
    >
    [- // Our first order of business is to set this value back to 0 to create (0)(5)(0){0}(0)
    
        // CODE ONLY EXECUTES IF THE VALUE WAS 0
        
        << // Go back twice to get to our previous input
        [<]> // Now go all the way back to the 2nd input
        [-]+ // Set our 2nd input to 1 the final one will be subtracted later
        [>]>

      > // Lastly we move once more right again and exit the loop with our pointer in the same place
      // as if we didnt enter the loop (0)(5)(0)(0){0}
    ]

    << // Move back to our latest input at (0)(5){84}(0)(0)
    [ // And if it isnt a zero aka enter
        +++++++++++++ // Add 13 again 
        . // Print our input
        >++++++++++.[-] // Print a line feed
    ]
    <
    [<]>- // Move back to our 2nd cell with our allowed inputs and subtract 1
]
//?
> // move to cell 2 our first input like (0)(0){66}(111)(116)(116)(111)(109)
[
    .> // print it and move right
]