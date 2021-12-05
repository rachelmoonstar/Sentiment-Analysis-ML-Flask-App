FROM python:3.7
MAINTAINER Rachel Moon <moonstar1270@gmail.com>

# Install build utilities
RUN apt-get update && \
    apt-get install -y protobuf-compiler python3-pil python3-lxml python3-pip python3-dev git && \
    apt-get -y upgrade

RUN cd $HOME && \
	git clone https://github.com/rachelmoonstar/Sentiment-Analysis-ML-Flask-App.git

#Install libraries
RUN cd $HOME/Sentiment-Analysis-ML-Flask-App && \
	pip3 install -r requirements.txt

RUN python3 $HOME/Sentiment-Analysis-ML-Flask-App/app.py


# expose ports
EXPOSE 5002

#Command
CMD ["python3", "/Sentiment-Analysis-ML-Flask-App/app.py", "serve"]

