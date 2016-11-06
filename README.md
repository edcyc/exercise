# exercise

Notice: AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY need to be filled in the cloud-automation.sh.

After git clone, use the following command to create a set of EC2 servers as Docker hosts to host Docker containers of Wordpress and MySQL. The security key pair and security group are created in the process, too. There is a ELB created and load balance incoming request to Wordpress applications.

cloud-automation.sh <app> <environment> <num_servers> <server_size>

Ex. cloud-automation.sh hello_world dev 2 t2.micro

cloud-automation.sh 

app and environment are used as the identifiers to isolate different deployments.

num_servers decides how many EC2 servers are created.

server_size decides which EC2 instance type is. 

Notice: the Ubuntu 14.04 image ami-a21529cc in the quick list doesn't support t1.micro but support t2 series due to the virtualization type hvm. 

Other configurations are in the cloud-automation.sh.

After the script is done, the elb_result.elb.dns_name shown in the last few messages is the DNS (ELB use DNS rather than IP) of the ELB to load balance to Wordpress applications. It is also in the generated file elb_dns.
