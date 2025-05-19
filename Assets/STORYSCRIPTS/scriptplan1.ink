

->PROLOGUE


=== function reference()

LIST itemstate = on, off
LIST items = gun , fanblade, wire, axe

VAR gunstate = (off)
VAR fanstate = (off)
VAR wirestate = (off)
VAR axestate = (on)

LIST  interactionstates = unchecked, checked, opened, unopened, fixed, unfixed
LIST pointsofinteraction = axeusedonvent, axeusedoncloset
LIST axechoices = ventaxechoice, closetaxe

VAR ventstate = (unchecked, unopened)
VAR closetstate = (unchecked, unopened)
VAR radiostate = (unchecked, fixed)

VAR door = ()
VAR axepoint = ()
VAR axechoice = ()



=== function get()

VAR choicesseen = 0

VAR duvet = false

=== PROLOGUE ===

#image: black 

Ever since the bombs, this world has fallen into madness, survival is the common goal. #speaker: you #textstyle:italic
Nothing will ever be the same as before. i had a family, children and now everyone i love is gone, except this girl. #speaker: you #textstyle:italic
we must survive, i have to protect her. #speaker: you #textstyle:italic
this bunker is our only safehaven. #speaker: you #textstyle:italic
we leave this place, it is inevitable that we will die. #speaker: you #textstyle:italic
we have enough food and water to last 3 days, then our chances of survival run thin. #speaker: you #textstyle:italic
we will not die. #speaker: you #textstyle:italic


#image:day1

<br>





  

 ->DAY1

=== DAY1 ===

#image : background1

[the bunker is dimly lit by a buzzing light, the air filled with thick with dust. the girl lays there in silence, pale and malnourished.] #speaker:narrator

Three days, just three more days. then we find out whats going to happen to us next, but i worry that there wont be a next time. #speaker : you #textstyle:italic 
 
"Hey, how you doing? you dont look too good." #speaker: you  #emotion : man_neutral #layout : left

"really, you dont think i look good, OBVIOUSLY i dont look good." #speaker : her  #emotion : girl_annoyed #layout : right

"weve been in this prison for almost a week now, and i doubt we are making it out of here alive." #speaker : her  #emotion : girl_annoyed #layout : right

 "better a prison than a grave, we are going to make it out of here alive, we just need to believe." #speaker : you  #emotion: man_neutral #layout : left

"alive, huh. just a couple more days till we run out of food, then i doubt we are going to survive." #speaker : her  #emotion : girl_annoyed  #layout : right


[the girl scoffs, staring up at the ceiling as the silence between them stretches out into the obnoxious buzz of the light]  #speaker : narrator

[in the middle of the bunker lays a table with a chair and a small drawer , revealing what looks to be a broken radio sitting on top.]  #speaker : narrator

[a large shelf stands against the back wall,various cans of soup scattered across the shelves, and a cabinet which is locked.]  #speaker : narrator

[on the floor, 2 flimsy beds are laid out with ragged covers thrown over the top of them.]  #speaker : narrator

[a ragged axe is propped against shelf, above it a ventilation shaft spinning slowly.]  #speaker : narrator

->examinechoices 

=examinechoices 

* [examine the radio] this radio might be our only chance of survival, i need to fix it. #speaker : you #textstyle:italic #image : radio1
~choicesseen++ 
[as you look at the desk, you notice an old drawer]  #speaker : narrator
    **[open desk drawer] something seems off about the bottom of this drawer, if only i had a knife or something to pry it open with. #speaker : you #textstyle:italic #image: drawer1
        *** [walk away] better keep looking. #speaker : you #textstyle:italic #image: background1
->examinechoices 
                          
* [examine the locked cabinet]
~ choicesseen++
 this cabinet has been locked ever since we got here. i wonder where the key is? #speaker : you #textstyle:italic #image: closet1
 **[walk away] lets have a look somewhere else. #speaker : you #textstyle:italic #image: background1
->examinechoices 
          
*[examine the ventilation shaft]
~choicesseen++
 this vent hasnt worked since we got in here. it looks quite flimsy, might come in useful later. #speaker : you #textstyle:italic #image: vent1
 **[walk away] anything else around here? #speaker : you #textstyle:italic #image: background1
->examinechoices

* {choicesseen ==3} [lie down on bed] ->tiredpart
 =tiredpart
 #image : bedimage
 
"im getting tired, im gonna gonna go to sleep, make sure to get some rest." #speaker : you #emotion : man_neutral  #layout : left

"yeah, whatever." #speaker : her #emotion : girl_sad  #layout : right

as i walk over to the bed, i see something poking out of the bed, its too faint to make out what it is.  #speaker : you #textstyle:italic  #image : bednote

i put my hand on it and realise its inside of the mattress. what the hell is that? #speaker : you #textstyle:italic
                        ->bedandaxe
=bedandaxe
* [cut open the mattress] i might regret this... #speaker : you #textstyle:italic
    "hey what the hell are you doing?!" #speaker : her #emotion: girl_neutral #layout : right
    "shut up for a second." #speaker : you #emotion: man_annoyed #layout : left
    i carefully slice the mattress open, revealing what seems to be a small envolope containing a small letter. #speaker : you #textstyle:italic  #image : lightnote #audio :mattressrip
    on the letter is a drawing of a circled lamp. #speaker : you #textstyle:italic
    "what the hell does that mean?" #speaker : you #emotion: man_angry  #layout : left
    "what is it?" #speaker : her #emotion: girl_neutral #layout : right
    "here, have a look." #speaker : you  #emotion: man_neutral #layout : left # image :background1
    "hmm, surely this has to mean something important. but who even left this here?"  #speaker : her #emotion: girl_neutral  #layout : right
    [she passes you the note]  #speaker : narrator
    this has to mean something, but im too tired to even think right now. my mattress is ripped up now too. #speaker : you #emotion: man_neutral #textstyle:italic
    [you lie in the tattered bed, dozing off immediately]  #speaker : narrator
    ~ duvet = true
    #image:day2

    <br>
    -> DAY2
           
* [leave the mattress] i dont really want to slash up my mattress to get whatever is inside, i already sleep little enough, dont want even less #speaker : you #textstyle:italic #image : bedimage
	[you lie in bed, falling into a deep sleep]  #speaker : narrator
	    #image:day2

    <br>
    ->DAY2
 
 
=== DAY2 ===

#image : background1

"HEY! HEY! get up! can you not hear that!?" #speaker : her #emotion: girl_angry #layout : right

as i struggle to wake up, i hear it. loud obnoxious banging rings against the door to the bunker. #speaker : you #textstyle:italic 

[BANG, BANG, BANG] #audio : doorknocking

"what the hell is that?!" #speaker: you #emotion: man_annoyed  #layout : left

"i dont fucking know, it woke me up and obviusly i came straight to you!" #speaker : her #emotion: girl_annoyed  #layout : right

 "stay here." #speaker: you  #emotion: man_neutral #layout : left
 
 #image : door1

as i step towards the door, my heart pounds harder and harder. then, it stops. #speaker : you #textstyle:italic

i hear some shuffling, then a note slides under the door. #speaker : you #textstyle:italic #audio :paperslide

the writing is uneven, rushed. #image : themnote #speaker : you #textstyle:italic 

it says,"WE ARE HERE TO HELP, WE WILL BE BACK TOMMOROW. LET US IN OR WE COME IN OURSELVES." #speaker : you #textstyle:italic 

[silence fills the room, as steps get further and further away]  #speaker : narrator

"you dont really believe this crap right? they are clearly lying to us." #speaker : her  #emotion: girl_angry #layout : right #image: background1

"i have no clue, but our time is running out. this might be our only hope." #speaker: you #emotion: man_sad #layout : left
{duvet: ->lightbulb | ->afterlightbulb} 

=lightbulb
#image : lightnote
as i look at this note, my mind wanders. #speaker : you #textstyle:italic
then i remember the note with the lamp. #speaker : you #textstyle:italic
i go to look at the lightbulb, wondering what the note might be trying to say #speaker : you #textstyle:italic
                 
* [unscrew the lightbulb]
  #image :lightshot1
     [you unscrew the lightbulb]  #speaker : narrator
      "oh shit!" #speaker: you #emotion: man_happy #layout : left
     [the hot light burns your hand, dropping to the floor and smashing into many pieces]  #speaker: narrator #audio: lightsmash
	 [a key falls from the place where the lamp used to be] #image :keyfloor #speaker : narrator
     "you okay?" #speaker : her #emotion: girl_neutral  #layout : right
     "yeah, i guess that note really meant something huh, look at this key." #speaker: you #emotion: man_neutral #layout : left
      "oh, well there is a keyhole on the cupboard, come try it." #speaker : her #emotion: girl_neutral #layout : right
     [you walk to the cupboard, sliding the key into the keyhole, turning it.]  #speaker : narrator #audio : unlockdoor
	 [...]  #speaker : narrator
     [Click] #image : gunshot1 #audio : revolverfound
     [you pull open the cupboard. a gun with bullets lies inside]  #speaker : narrator 
      "oh god, theres a gun inside." #speaker: you #emotion: man_happy #layout : left 
     "thats great! we can defend ourselves now." #speaker : her #emotion: girl_happy #layout : right
     "lets hope it doesnt come to that." #speaker: you #emotion: man_neutral #layout : left
     ~closetstate+= opened
     ~closetstate-= unopened
     ~gunstate += on
     ~gunstate -= off
      -> afterlightbulb

=afterlightbulb
#image : background1
 we only have 1 more day of food left, i cant let mind wander. i need to look around the bunker. #speaker : you #textstyle:italic
 ->2nddaychoices



= 2nddaychoices

+ [examine the desk] ->desk_examine

  
+ [examine the cabinet] ->cabinet_examine
  

+ [examine the ventilation shaft] ->vent_examine



* {ventstate ? (checked) && closetstate ? (checked) && radiostate ? (checked) && axestate ? (off)} [i think im done here.] ->day3end

=alreadyopened
#image :background1
i dont think there is anything else i can do here.  #speaker : you #textstyle:italic
->2nddaychoices

=pry
#image : pry
i jam the bottom of the drawer with the fanblade, pulling down hard. #speaker : you #textstyle:italic #audio :deskprying

a small crack lifts up, revealing a hidden compartment, containing a small piece of coiled wire. #speaker : you #textstyle:italic

this might be useful later. #speaker : you #textstyle:italic

~wirestate += on
~wirestate -= off
->2nddaychoices

=cabinetaxe
#image :axecabinet
i have to find out whats in this closet, this is the only way. #speaker : you #textstyle:italic

i swing the axe, aiming for the hinges on the closet door. #speaker : you #textstyle:italic

the axe cracks and creaks, the handle forming a larger crack each time i swing. #speaker : you #textstyle:italic #audio :axesmash

wood clashes against metal, the door eventually loosening and falling to the ground. #speaker : you #textstyle:italic #image : cabinetdoorfloor

i drop the axe, the handle now completely snapped, no way i can use this again. #speaker : you #textstyle:italic

inside the closet sits a revolver, 3 bullets laying next to it. #speaker : you #textstyle:italic #image : gunshot1 #audio :revolverfound

~axestate -= on
~axestate += off
~gunstate -= off
~gunstate += on
~closetstate += opened
~closetstate -= unopened
#image : background1
->2nddaychoices

=ventaxe
#image : ventdestroyed
the axe crashes against the fans on the ventilation shaft #speaker : you #textstyle:italic #audio: venthit

i swing repeatedly, the fanblades eventually dropping to the floor. #speaker : you #textstyle:italic

the axehead flies off, hitting the opposite wall #speaker : you #textstyle:italic

"JESUS, watch out!" #speaker : her #emotion: girl_annoyed  #layout : right

"im sorry, but i think these could come in useful" #speaker : you  #layout : left

~axestate -= on
~axestate += off
~fanstate += on
~fanstate -= off
~ventstate += opened
~ventstate -= unopened

->2nddaychoices

=looksomewhereelse
let me have a look somewhere else. #speaker : you #textstyle:italic #image :background1
->2nddaychoices


= desk_examine 
lets have a look here. #image :drawer1 #speaker : you #textstyle:italic
  ~radiostate += checked

 
 {radiostate ? (opened): ->alreadyopened} 
  
 *{fanstate ? (on)} [pry the false bottom] -> pry 
   
 +[look elsewhere] -> looksomewhereelse
   
 ->2nddaychoices
 
 
=cabinet_examine
 ~closetstate += checked
{closetstate ?(opened): ->alreadyopened} {axestate ? (off): ->alreadyopened} maybe i could do something here. #image: closet1 #speaker : you #textstyle:italic

 
 * {axestate ? (on)} [use the axe on the cabinet] -> cabinetaxe
  
 +[look elsewhere] -> looksomewhereelse
   

 
=vent_examine
 ~ventstate += checked 
{ventstate ? (opened): ->alreadyopened} {axestate ?(off): ->alreadyopened}  anything here? #image: vent1 #speaker : you #textstyle:italic
 
* {axestate ? (on)} [use the axe on the vent] ->ventaxe
 
 +[look elsewhere] -> looksomewhereelse
   ->2nddaychoices
   
->END

=day3end
"just one more day left." #speaker: you #emotion : man_neutral  #layout : left #image :background1
 
"what are we going to do??? we cant just die here." #speaker : her #emotion : girl_sad #layout : right

 
{gunstate ? (on) && axestate ? (off) && wirestate ? (on) && ventstate ?(opened): ->goated} 
    
{gunstate ? (on) && axestate ? (off) && wirestate ?  (off) && ventstate ? (unopened): ->mid}  

{gunstate ? (on) && axestate ? (off) && wirestate ?  (off) && ventstate ? (opened): ->mid}

{gunstate ? (off) && axestate ? (off) && wirestate ? (on) && ventstate ? (opened): ->bad}

=goated
"im going to us out of here." #speaker : you #emotion: man_neutral #layout : left
->realday3ending

=mid
"i dont know, i really dont know, but all we can do is hope." #speaker : you #emotion: man_annoyed #layout : left
->realday3ending

=bad
"god, i really dont know." #speaker : you #emotion: man_sad #layout : left
->realday3ending

=realday3ending
"we need to get some rest, theyre going to come back tommorow and who knows whats going to happen then." #speaker: you #emotion: man_neutral #layout : left

"goodnight." #speaker : her #emotion: girl_neutral #layout : right

"night." #speaker: you  #emotion: man_neutral #layout : left

 #image:day3

 <br>

-> DAY3

=== DAY3 === 
#image :background1
they are going to be here soon, and i doubt they are going to be friendly. #speaker : you #textstyle:italic #layout : left

"hey are you good? those people are going to come back soon, we need to be ready." #speaker: you #emotion: man_neutral  #layout : left

"sorry, but i just cant believe this might be it for us. i really dont think we can trust them." #speaker : her #emotion: girl_sad #layout : right

"you need to stay calm, we can make it out of this i promise you." #speaker: you #emotion: man_neutral #layout : left

"i trust you, but i just dont see any way we survive after today." #speaker : her #emotion: girl_sad #layout : right

[silence fills the room as you wait for the inevitable]  #speaker : narrator

[steps suddenly start up outside the bunker. each step getting closer and closer until they come to a stop]  #speaker : narrator #audio :footstepsthem

theyre here. both of our eyes lock onto the door. #speaker : you #textstyle:italic #image :door1

"HEY, we are back, if you open this door we can help you." #speaker : ???

"we have a camp set up full of survivors. please just open the door, or we will have to let ourselves in." #speaker : ??? 

->doorchoices
 
 =doorchoices
	      * [open the door] i slowly open the door, then i notice it. a man and women in torn clothes stand in front of me, a gun pointed at my head. #speaker : you #textstyle:italic #image:gunpointed #audio: metaldooropen
	        ~ door += opened
                 {axestate ? (off) && gunstate ? (on) && wirestate ? (on):  ->opendoor1}
                {axestate ? (off) && gunstate ? (off) && wirestate ? (on):  ->opendoor2}
                {axestate ? (off) && gunstate ? (on) && wirestate ? (off):  ->opendoor3}
                {axestate ? (off) && gunstate ? (off) && wirestate ? (off):  ->opendoor4}
          *  [dont open the door]  "times up,  we are coming in!" #speaker : ??? #emotion: them_neutral #layout : right #image :doorshot2
            ~door += unopened
                {axestate ? (off) && gunstate ? (on) && wirestate ? (on): -> dontopendoor1}
                {axestate ? (off) && gunstate ? (off) && wirestate ? (on): ->dontopendoor2}
               {axestate ? (off) && gunstate ? (on) && wirestate ? (off): ->dontopendoor3}
               {axestate ? (off) && gunstate ? (off) && wirestate ? (off):  ->dontopendoor4}
                
        
  =opendoor1
 
"im sorry about this. but its everyone for themselves out here." #speaker : ??? #emotion: them_neutral #layout : right 
 
its over. how could i let this happen. #speaker : you #textstyle:italic
 #image:black
i close my eyes, ready for my inevitable death. #speaker : you #textstyle:italic 
 
[BANG!]  #audio: revolvergunshot
 
"WHAT THE F@~K! NO, WHAT DID YOU DO. THIS WASNT SUPPOSED TO GO LIKE THIS." #speaker : ??? #emotion: them_neutral #layout : right
 
my eyes open wide, wondering why i havent died today. how am i still alive. #speaker : you #textstyle:italic
 
then i look. the man lies dead, behind me the girl stands with hands cupped on a revolver #speaker : you #textstyle:italic #image:revolverpov
 
she had to do it. we cant die like this. #speaker : you #textstyle:italic
 
"YOU KILLED HIM! YOU KILLED HIM!" #speaker : ??? #emotion: them_neutral #layout : right
 
"you were going to kill us, she did what she had to do." #speaker : you #emotion: man_angry #layout : left
 
"just calm down, we dont want to kill you too." #speaker : you #emotion: annoyed #layout : left
 
"NO, YOU ARE GOING TO PAY FOR THIS." #speaker : ???  #emotion: them_neutral #layout : right
 
i wave to the girl to pass me the revolver. #speaker : you #textstyle:italic

she does. #speaker : you #textstyle:italic
 
"im sorry." #speaker : you #emotion: man_sad  #layout : left
 
[BANG!]  #audio: revolvergunshot
 
"oh god" #speaker : her  #emotion: girl_sad #layout : right
 
"there was nothing else we could do. you did well." #speaker : you #emotion: man_neutral  #layout : left
 
"what do we do now?" #speaker : her #emotion: girl_sad #layout : right
 
"i should be able to repair this radio with the wire we got from before, then we can call for help nearby." #speaker : you #emotion: man_neutral #layout : left

"lets get rid of these bodies and take what we can." #speaker : you #emotion: man_neutral #layout : left
 
she looks at me in silence, visibly in disgust from the 2 bodies lying on the floor #speaker : you #textstyle:italic
 
"just sit on the bed, ill take care of this. good people will come for us." #speaker : you #emotion: man_neutral #layout : left
 
->prologue1
  

  = opendoor2
"im sorry about this. but its everyone for themselves out here." #speaker : ??? #emotion: them_neutral #layout : right #image :
  
"please dont do this." #speaker : you  #emotion: man_sad #layout : left
  
its over. but i cant let this girl die. #speaker : you #textstyle:italic
  
"RUN! CLIMB THROUGH THE VENT AND GET OUT OF HERE!" #speaker : you #emotion: man_angry  #layout : left #image:ventremoved
  
i run towards the 2 people in front of me, i have to buy some time. #speaker : you #textstyle:italic

BANG! #audio: gunshot
BANG! #audio: gunshot

#image:black
  
i feel the blood draining out of my body, its a matter of time before i bleed out, atleast she has a chance to get away. #speaker : you #textstyle:italic
  
all i hear is ringing as 2 people pass by me and enter the bunker. i did all i could. #speaker : you #textstyle:italic
  
  -> prologue2
  
  
  =opendoor3
"im sorry about this. but its everyone for themselves out here." #speaker : ??? #emotion: them_neutral #layout : right

"please dont do this." #speaker : you #emotion: man_sad #layout : left 

its over. but i cant let this girl die. i have to do something. #speaker : you #textstyle:italic

i look on the desk drawer. the gun is our only chance of survival. #speaker : you #textstyle:italic #image:deskrevolver

i run and grab the gun, gripping it firmly between my hands. #speaker : you #textstyle:italic

"HEY STOP!" #speaker : ???  #emotion: them_neutral #layout : right #image : revolverpov

BANG!  #audio: revolvergunshot

BANG! #audio: gunshot

we shot eachother. i feel blood seeping from my skin, looking towards the body laying on the ground in front of me. #speaker : you #textstyle:italic
   
"oh god." #speaker : her #emotion: girl_sad #layout : right

i look at the girl as she stares down at me. #speaker : you #textstyle:italic

"NO, YOU CANT DIE!" #speaker : her #emotion: girl_angry #layout : right

"you need to survive, im done for." #speaker : you #emotion: man_sad #layout : left 

my eyes fade into darkness, as i hear screams fill the void of silence in the air. #speaker : you #textstyle:italic

   
->prologue3
  
  =opendoor4 
"im sorry about this. but its everyone for themselves out here." #speaker : ??? #emotion: them_neutral  #layout : right
   
theres nothing i can do, its over. #speaker : you #textstyle:italic
   
"im sorry." #speaker : you #emotion: man_annoyed #layout : left
   
[BANG!]  #audio: revolvergunshot #image :black
[BANG!]  #audio: revolvergunshot
   
->prologue4
  
  =dontopendoor1
  
"im not going to open that door." #speaker : you #emotion: man_neutral #layout : left
  
"what are we going to do then?! you dont even know if they are bad people!" #speaker : her  #emotion: girl_angry #layout : right
  
"im going to do what i have to." #speaker : you #emotion: man_neutral #layout : left
  
i pick up the gun lying down on the desk, aiming it at the closed door, ready to fire upon entry. #speaker : you #textstyle:italic #image:deskrevolver
  
CRASH! #audio :crash
 
"stay back! im armed!" #speaker : you #emotion: man_angry  #layout : left
 
i watch as the man draws a small caliber pistol from his jeans. #speaker : you #textstyle:italic #image : revolverpov

 
BANG! #audio: revolvergunshot
BANG! #audio: revolvergunshot

 
 "what did you do!? you murdered them!?" #speaker : her #emotion: girl_angry #layout : right
 
"i did what i had to. he was going to kill us." #speaker : you #emotion: man_neutral  #layout : left
 
"god damn it." #speaker : her #emotion: girl_sad #layout : right
 
"im going to repair this radio and call for help. let me take care of the bodies." #speaker : you #emotion: man_neutral #layout : left #image: radiorepairs

"we are going to make it out of here alive." #speaker : you #emotion: man_neutral #layout : left 
 
she nods, visibly disturbed by the 2 bodies lying dead on the ground. #speaker : you #textstyle:italic
 
"im sorry, but there was no other choice." #speaker : you #emotion: man_sad  #layout : left

  ->prologue1
  
  =dontopendoor2

"i know what we can do before they come in." #speaker : you #emotion: man_neutral #layout : left

"what?!" #speaker : her  #emotion: girl_angry #layout : right

 "we need to climb through the vent, i should be able to fit. we have to get out of here" #speaker : you  #emotion: man_neutral #layout : left #image:ventremoved

"are you serious?" #speaker : her  #emotion: girl_annoyed  #layout : right

"yes, go. now. they are going to get in any second." #speaker : you #emotion: man_neutral #layout : left

the girl and i squeeze through the vent. outside is a dusk, dilapidated town. #speaker : you #textstyle:italic #image:black

CRASH! #audio : crash

"theyre inside" #speaker : you #emotion: man_neutral #layout : left

"where do we go!?" #speaker : her #emotion: girl_annoyed #layout : right

"i dont know. but we have to run. i just dont know where." #speaker : you #emotion: man_neutral #layout : left

  ->prologue5
  
  =dontopendoor3

the gun is the only thing that can help us survive. #speaker : you #textstyle:italic

i grab the gun off the desk, looking at the girl as she sits in silence beside me. #speaker : you #textstyle:italic #image: deskrevolver

"what are you doing, there is no way you are going to be able to kill them!"  #speaker : her  #emotion: girl_angry #layout : right 

"what if they are good people?!" #speaker : her  #emotion: girl_angry #layout : right

"im sorry, but i have to try. this cant be it." #speaker : you  #emotion: man_neutral #layout : left

CRASH! #audio : crash

in front of me stands a man, gun in hand pointing at me. but i wont let him kill her. #speaker : you #textstyle:italic #image : gunpointed

"im sorry about this. but its everyone for themselves out here." #speaker : ??? #emotion: them_neutral  #layout : right

"please dont do this." #speaker : you  #emotion: man_annoyed #layout : left

[BANG!] #audio: revolvergunshot

[BANG!] #audio: gunshot

we shot eachother. i feel blood seeping from my skin, looking towards the body laying on the ground in front of me. #speaker : you #textstyle:italic #image:black
   
"oh god." #speaker : her  #emotion: girl_sad #layout : right

i look at the girl as she stares down at me. #speaker : you #textstyle:italic

"NO, YOU CANT DIE!." #speaker : her  #emotion: girl_angry #layout : right

"you need to survive, im done for." #speaker : you   #emotion: man_sad #layout : left

my eyes fade into darkness, as i hear screams fill the void of silence in the air. #speaker : you #textstyle:italic
 
->prologue3
  
=dontopendoor4

its over, we having nothing to protect ourselves with #speaker : you #textstyle:italic #image:doorshot2

 "im sorry, i shouldve done more to help us survive." #speaker : you  #emotion: man_annoyed #layout : left

[CRASH!] #audio : crash

"please, dont do this" #speaker : you  #emotion: man_annoyed #layout : left #image:gunpointed

"we havent done anything to you, we dont even have anything in here ourselves. please, just let us live." #speaker : her  #emotion: girl_sad #layout : right

"its us or you, we have to do this." #speaker : ??? emotion: them_ neutral #layout : right

BANG! #audio: gunshot #image:black
BANG! #audio: gunshot 


->prologue4

 
 
 
 
 =prologue1
#image: black 
 1 WEEK LATER.
 
we made it out alive. our call for help was answered with helping hands, a group of good people taking us in. #speaker : you #textstyle:italic   

the only thing that matters is that we are alive. who knows what couldve happened to us if we didnt have that gun. #speaker : you #textstyle:italic       
 
[THE END.] (GOOD ENDING)
#end : true
 -> END 
 
=prologue2
#image: black 
1 WEEK LATER.

im only alive because of him. because of his sacrifice, i was able to escape from those people and find help.  #speaker : her #textstyle:italic

i only think about what couldve happened if we had something to stop them with. #speaker : her #textstyle:italic

[THE END.] (NEUTRAL ENDING)
#end : true
->END
=prologue3
#image: black 

[the bunker lingers in silence, 4 bodies laying lifeless on the floor. in the end it came down to nothing.]

[2 people with no resources or anything to survive with,there was no possibility of survival for the remaining 2 girls.] 

[THE END.] (BAD ENDING 1)
#end : true
->END
=prologue4
#image: black 

[in the end there was nothing, 2 dead bodies lay on the cold floor of the bunker stripped of all its resources by the 2 killers.]


[THE END.] (TERRIBLE ENDING )
#end : true
->END
=prologue5
#image: black 

its been 1 day, there seems to be no life in this town, i dont know how we are going to find our way to help. #speaker : you #textstyle:italic

its just a couple days left until we run out of the water we found at a nearby fountain. this could be the end. #speaker : you #textstyle:italic

[THE END.] - (NUETRAL ENDING)
#end : true
->END



