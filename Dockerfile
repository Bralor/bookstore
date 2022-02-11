FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3 \
    python3-pip

# Install packages:
# - jupyter,
# - numpy,
# - pandas,
# - statsmodel,
# - matplotlib,
# - plotly,
# - seaborn,
# - sklearn,
# - tensorflow,
RUN pip3 install \
    jupyter \
    numpy \
    pandas \
    matplotlib \
    plotly \
    seaborn \
    sklearn \
    tensorflow

# Create a new system user
RUN useradd -ms /bin/bash jupyter

# Change to this new user
USER jupyter

# Set the container working directory to the user home folder
WORKDIR /home/jupyter

# Start the jupyter notebook
ENTRYPOINT ["jupyter", "notebook", "--ip=*"]

