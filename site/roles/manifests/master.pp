class roles::master() {
# Here we include all of the profiles that make up a Puppet master
# for now it’s just the base (the SOE) but we will probably add more later
include profiles::base
}

