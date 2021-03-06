# Sentinel test suite. Copyright (C) 2014 Salvatore Sanfilippo antirez@gmail.com
# This softare is released under the BSD License. See the COPYING file for
# more information.

cd tests/sentinel
source ../instances.tcl

proc main {} {
    parse_options
    spawn_instance sentinel $::sentinel_base_port $::instances_count
    spawn_instance redis $::redis_base_port $::instances_count
    run_tests
    cleanup
}

if {[catch main e]} {
    puts $::errorInfo
    cleanup
}
