# rmsf_min.tcl
# Read RMSF values from a text file and store them in the beta field.

# Path to RMSF file
set rmsf_file "C:/Users/PeyC/Downloads/RMSF.txt"

# Read RMSF values into a list
set f [open $rmsf_file r]
set rmsf_list {}
while {[gets $f line] >= 0} {
    scan $line "%*d %f" val
    lappend rmsf_list $val
}
close $f

# Assign RMSF values to C-alpha atoms
set sel [atomselect top "name CA"]
$sel set beta $rmsf_list
$sel update

puts "RMSF values assigned to beta. Use Coloring Method Beta"
