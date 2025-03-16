//variables
VAR leadchoice = ""

// conditions
VAR variable = true
VAR variablenum = 3



//start
-> main

=== main ===

//conditional logic
{variable: you are going to lose... | you are going to survive...}

// conditional logic 2 (basically a if statement)
{variablenum > 2: 
 you are going to be eaten... 
-else: 
 you are going to be squished...
}




yo whats good bro #speaker : evilguy

not much how about you? # speaker : you
    //choice wont come up after the pick
    * [tell him you are in severe pain] 
        yeah me too tbh
        ->LEADER
        
        // encased is shown when choosing then removed after choice
    * why do you care, [stupid idiot] get away from me
        no need for all the aggression pal!
        ->LEADER
        

=== LEADER ===
now, where is your leader?!?!?!?!?!

    // variables and choices
    * [at home]
        ~ leadchoice = "he went to your house"
        -> movingon
    * [at work]
        ~ leadchoice = "he went to your job"
        -> movingon
    * [you are the leader] i am the leader
        ~ leadchoice = "congrats"
        -> movingon

=== movingon ====
//variable
you chose {leadchoice}

// GATHERS AND NESTED CHOICES (WEAVE SYNTAX)
well, now im going to fight you and kill you then!!!!!

    * run
        YOU STUPID IDIOT, WHY DID YOU MAKE ME DO THIS?????!!!!!
            ** i hate your kind, you are disgusting.
            ** ill never fall to the likes of you
        -- WELL, NOW YOU DIE
    * punch him
    * kick him
    * beg for mercy

- you got ripped to shreds
    
        

        

-> END

 

