// To start we want to set the second cell to our allowed input length for now: 100
>>>>> // Skip the first 5 memory blocks as we want to use these later
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
        >
    ]
    <
    [<]>- // Move back to our 7th cell with our allowed inputs and subtract 1
]
> // move to cell 8 aka our first input like (0)(0){66}(111)(116)(116)(111)(109)

// Now its time to bottom encode these characters! oh boi
// This loop will go until our input string hits a 0 which should be the end
// of our input as even spaces are denoted as 32
[
    [<<<+>+>>-]<<[->>+<<] // Copy our number to 3 cells left of here
    >[-]++++++++++++++[<++++++++++++++>-]<++++ //Set up 200 next to our copied number
    <<<+>> // Set up for our comparison
    // our cells now look like this
    // (0)(0)(1)(0){66}(200)(0)(66)

    +>+<
    [->-[>]<<] // subtract 1 from both and only if our number is bigger or equal to 200 do we exit to index 3 else we keep going on index 4 till it hits 0
    < // so if we were bigger or equal this left movement moves us to index 2 which has our 1
    [ // TLDR if our input is bigger than 200 this activates
        - // Subtract 1 so this only activates once

        [-]
        >>[-] // Clean up any remainder

        // TODO: Print our 200 value here aka hug emoji
        <+++++++++++[>+++++++++++<-]>++++++.[-] // For now this is a house lol
        
        // Subtract 200 from our input
        >++++++++++++++[>++++++++++++++<-]>++++
        [->-<]

        // if value is zero do ending
        ><+>[<-]<[- <<<<<+>>>>> <]>

        // Go back to the cell we entered this loop from to leave as thats now 0
        <<<<
    ]
    
    <[ // And else this activates
        -<

        [-]
        >>>>[-]<<<< // Just cleaning up our remainder

        // Nested do it again but for 50
        >>>>>>

        [<<<+>+>>-]<<[->>+<<] // Copy our number to 3 cells left of here
        >[-]++++++++++[<+++++>-] //Set up 50 next to our copied number
        <<<<+>> // Set up for our comparison
        // our cells now look like this
        // (0)(0)(1)(0){66}(50)(0)(66)

        +>+<
        [->-[>]<<] // subtract 1 from both and only if our number is bigger or equal to 50 do we exit to index 3 else we keep going on index 4 till it hits 0
        < // so if we were bigger or equal this left movement moves us to index 2 which has our 1
        [ // TLDR if our input is bigger than 50 this activates
            - // Subtract 1 so this only activates once

            [-]
            >>[-] // Clean up any remainder

            // TODO: Print our 50 value here aka heart emoji
            +++.[-] // For now this is an ascii heart
            
            // Subtract 50 from our input
            >++++++++++[>+++++<-]>
            [->-<]

            // if value is zero do ending
            ><+>[<-]<[- <<<<<+>>>>> <]>

            // Go back to the cell we entered this loop from to leave as thats now 0
            <<<<
        ]

        <[ // And else this activates
            -<

            [-]
            >>>>[-]<<<< // Just cleaning up our remainder
            
            // TODO: Now do this entire setup again but for 10 and 5

            // Nested do it again but for 10
            >>>>>>

            [<<<+>+>>-]<<[->>+<<] // Copy our number to 3 cells left of here
            ++++++++++ //Set up 10 next to our copied number
            <<<+>> // Set up for our comparison
            // our cells now look like this
            // (0)(0)(1)(0){16}(10)(0)(66)

            +>+<
            [->-[>]<<] // subtract 1 from both and only if our number is bigger or equal to 50 do we exit to index 3 else we keep going on index 4 till it hits 0
            < // so if we were bigger or equal this left movement moves us to index 2 which has our 1
            [ // TLDR if our input is bigger than 50 this activates
                - // Subtract 1 so this only activates once

                [-]
                >>[-] // Clean up any remainder

                // TODO: Print our 10 value here aka twinkle emoji
                ++++.[-]
                
                // Subtract 10 from our input
                >>++++++++++
                [->-<]

                // if value is zero do ending
                ><+>[<-]<[- <<<<<+>>>>> <]>

                // Go back to the cell we entered this loop from to leave as thats now 0
                <<<<
            ]

            <[ // And else this activates
                -<

                [-]
                >>>>[-]<<<< // Just cleaning up our remainder
                
                // TODO: Now do this entire setup again but for 5

                // Nested do it again but for 5
                >>>>>>

                [<<<+>+>>-]<<[->>+<<] // Copy our number to 3 cells left of here
                +++++ //Set up 10 next to our copied number
                <<<+>> // Set up for our comparison
                // our cells now look like this
                // (0)(0)(1)(0){6}(5)(0)(66)

                +>+<
                [->-[>]<<] // subtract 1 from both and only if our number is bigger or equal to 50 do we exit to index 3 else we keep going on index 4 till it hits 0
                < // so if we were bigger or equal this left movement moves us to index 2 which has our 1
                [ // TLDR if our input is bigger than 50 this activates
                    - // Subtract 1 so this only activates once

                    [-]
                    >>[-] // Clean up any remainder

                    // TODO: Print our 5 value here aka smile emoji
                    ++.[-]
                    
                    // Subtract 5 from our input
                    >>+++++
                    [->-<]

                    // if value is zero do ending
                    ><+>[<-]<[- <<<<<+>>>>> <]>

                    // Go back to the cell we entered this loop from to leave as thats now 0
                    <<<<
                ]

                <[ // And else this activates
                    -<

                    [-]
                    >>>>[-]<<<< // Just cleaning up our remainder
                    
                    // Finally loop over the left over bits which we can just print as commas
                    >>>>>>
                    [
                        // print a comma
                        <++++++++++++++++++++++++++++++++++++++++++++.[-]>
                        -
                    ]

                    <<<<<<<+> // set a cell to 1 to indicate we are done with this input and can move to the next one
                ]
            ]
        ]
    ]
    < // move just 1 more left for the cell we set to 1 in case we are done with this input
    [-
    ++++++++++++++++.+.[-]
    >] // so if we are done with this input move back 1 more right
    >>>>>>> // now move 7 steps right to get back to the input we were checking
    // if our input is still over 0 we will do another loop
    // if our input was done then this actually moves us to the next input in line and we start working on that one
    
    <+>[<-]<[-]>> // if we are with 0 remaining move to the next value
]

// Finish with a linebreak
[-]++++++++++.[-]