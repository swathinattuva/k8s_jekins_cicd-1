# Clone the repository
git clone https://github.com/PrasadTelasula/k8s_jekins_cicd.git

# Build Docker images locally
docker build -t my_jenkins .

# Create a Docker volume
docker volume create jenkins_home

# Run Jenkins Container
docker run -d --name my_jenkins -P -v jenkins_home:/var/jenkins_home:z -t my_jenkins

# Configure git
# Configure terraform
# Configure AWS

