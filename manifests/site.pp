# With the current implementation looks for a %{::fqdn}.yaml file in the 
# hieradata/nodes directory and then falls back to common.yaml. 
#
node default {
    hiera_include('classes')
}
 
