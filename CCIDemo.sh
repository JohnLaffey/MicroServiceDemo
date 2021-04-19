### start here

# DEBUG 1 gives you output of higher level commands (e.g. telepresence, kubectl)
if [ $DEBUG -ge 1 ]; then
    output_location=( "/dev/stdout" )
else
    output_location=( "/dev/null" )
fi

## Replace this with the IP of the copy of the service running in the cluster
export AMBASSADOR_SERVICE_IP=$your.service.ip 
# Verify that the test service is running in the cluster & capture test value
# Update this to test for your specific service
# Fails the pipeline if not present
output=`curl "-s " $AMBASSADOR_SERVICE_IP | grep 'green'`
    if [ -z "$output" ]; then
        echo "Test service is not running"
        exit 1
    fi

###########################################################
####  Verify telepresence list works           ####
###########################################################

output=`$TELEPRESENCE list | grep 'ready to intercept'`
verify_output_empty "${output}" false

# Update this with your service port
curl "-s " localhost:3000 > $output_location
if [[ "$?" != 0 ]]; then
    echo "Ensure you have a local version of your service running on port xxxx"
    exit
fi

###########################################################
####  Start Telepresence in the Build Environment      ####
###########################################################
$TELEPRESENCE connect > $output_location

## Update line below with your service name and port if not using the sample service
telepresence intercept dataprocessingservice --port 3000

#############################################################
####  Test local service value and compare againt remote ####
####  Need to strip tick marks off curl output           #### 
#############################################################

result=$(curl -s "http://localhost:3000/color")
result=$(echo $result | tr -d '///"')

# The else statement is for demo only; usually not used in a production pipeline
if $result != $output; then
    echo "Values do not match, stopping pipeline"
    exit 1
else
    echo "Values match; continuing pipeline"
fi


###################################################################
#### Steps to Install and Remove Telepresence dynamically 
#### The command is for Linux, see 
#### https://www.getambassador.io/docs/telepresence/latest/install/
#### for your specific Build Environment download
###################################################################

### Installation commands
# echo "Installing an old version of telepresence to /tmp/old_telepresence to verify it prompts for update"
# sudo curl -fL https://app.getambassador.io/download/tel2/linux/amd64/latest/telepresence -o /usr/local/bin/telepresence
# sudo chmod +x /usr/local/bin/telepresence

#### Removal Commands
#echo "Removing old version of telepresence: /tmp/old_telepresence"
# sudo rm /tmp/old_telepresence


