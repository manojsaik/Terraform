If you mark a terraform resource as tainted , terraform will recreate the resource by performing destroy and create then taint will be removed. 

Usage : 

$terraform taint #resource.resource-name 

