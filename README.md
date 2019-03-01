Garrett Darley: Gdarley


For this assignment I implemented the Lsystem with 4 classes: The turtle class which is a glorified mat4 of which
stores a mat4 of the cumulated transformations up to that point in the lsystem. The ExpansionRule class which is a
glorified string array that has a function to randomly return one of the strings it has stored in its array, giving equal chance to all entries to be returned. The DrawRule class, similar to the exapnsion rule class, is an array of 
possible mat4s, of which can randomly return one when called. The Lsystem class is the last class that ties all of 
these other classes together. In the Lsystem class there is an axiom that is given on construction, along with 
filling two maps, one of character to expansionRule and one of character to DrawRule. In the expand function, we
expand the axiom with the with the map of characters to expansion rules, and we do this n times, dictated by the int 
taken in by the function. We also have the drawMatrices fuction of which returns all of the transformation matrices 
for the objects that we will draw. This works similarly to how it was described in lecture in that it keeps a stack 
of turtles. At the start we create a turtle of which has an identity matrix as its matrix, and for every characters 
that isn't F or a bracked we go to the DrawRule map and get the corresponding transformation matrix represented by 
that letter and multiply our current turtle's matrix by it. When we hit an open bracket we push a turtle on to the 
stack of turtles with all current transformations up to that point. When we hit a closed bracket we pop a turtle off 
of the stack and our current turtles transformation matrix becomes that of the turtle we just popped. When we see an 
F we append the current turtles transformation matrix to our output list of mat4s, and we just continue this till we 
reach the end of the axiom we are iterating over. I then store this array of mat4s in main as seen at line 61 of 
main. Since I can't send a mat4 to the instanceshader I then break each mat4 into 4 column vectors and that is what 
the three nested for loops are doing in main. I then send these column vectors to the shader in the same way that the 
base code sent info to the instance shader,and the shader recombines that columns into a mat4 and applies the 
transform to its respective geometry. 
The GUI simply changes the number of iterations that the expand is called and the angle parameter refers to a scalar 
that is multiplied to the angle transformations of my drawRules, so it either increases or decreases the total angle 
of all the possible rotation transformations. The coloring of the model is a gradient based of dot of the normal and
 a light vec, of which is also used to create a basic lambert shader.