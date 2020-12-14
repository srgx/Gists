# Subtract vectors(arg1 - arg2)
proc subtractVectors {arg1 arg2} {

  set newX [expr {[lindex $arg1 0] - [lindex $arg2 0]}]
  set newY [expr {[lindex $arg1 1] - [lindex $arg2 1]}]
  
  return "$newX $newY"
  
}

# Scale vector
proc scaleVector {vector sc} {

  set newX [expr {[lindex $vector 0] * $sc}]
  set newY [expr {[lindex $vector 1] * $sc}]
  
  return "$newX $newY"
  
}

proc positionAfterTime {totalDisplacement totalTime currentTime} {
  
  # Time proportion
  set proportion [expr {$currentTime / $totalTime}]
  
  # Return new vector
  return [scaleVector $totalDisplacement $proportion]
  
}

# Move from a to b in time totalTime
set a "5 5"
set b "9 9"
set totalTime 200.

# Calculate total displacement
set totalDisplacement [subtractVectors $b $a]

# Current time
set currentTime 0

for {set i 0} {$i < 5} {incr i} {

    set displ [positionAfterTime $totalDisplacement $totalTime $currentTime]
    
    puts "Displacement after $currentTime seconds: ([lindex $displ 0],[lindex $displ 1])"
    
    if {$currentTime < 200} { set currentTime [expr {$currentTime + 50}] }
    
}
