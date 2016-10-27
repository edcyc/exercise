# Install Ansible
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install -y --force-yes ansible

export AWS_ACCESS_KEY_ID="AKIAIV6UZV76B5HTQVNA"
export AWS_SECRET_ACCESS_KEY="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"
export AWS_REGION="ap-northeast-1"
export AWS_ZONE="ap-northeast-1a"
export AWS_URL="https://ec2.ap-northeast-1.amazonaws.com"
export EC2_IMAGE="ami-a21529cc"

export APP=${1:-hello_world}
export ENVIRONMENT=${2:-dev}
export NUM_SERVERS=${3:-2}
# For Ubuntu 14.04 image ami-a21529cc. t1.micro is not supported due to the virtualization type hvm
export SERVER_SIZE=${4:-t2.micro}

# To avoid the known host list issue
export ANSIBLE_HOST_KEY_CHECKING=False

sudo apt-get install python-pip
# For Ansible ec2 module
sudo pip install boto

cp -f hosts.template hosts

ansible-playbook --timeout=600 -i hosts -vvvv site.yml