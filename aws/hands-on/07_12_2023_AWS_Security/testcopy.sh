for x in {1..200}
do
        output=$(curl -s http://elbwaf-843140320.us-east-1.elb.amazonaws.com/ | grep h1)
        echo $x - $output
        sleep 0.1
done