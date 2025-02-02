ARG BASE_IMAGE=eclipse-temurin:17-noble
FROM $BASE_IMAGE

# Install dependencies
RUN apt-get update && apt-get install -y default-jdk maven

# Download and extract the Atlassian Plugin SDK
RUN wget -O atlassian-plugin-sdk.tgz https://marketplace.atlassian.com/download/plugins/atlassian-plugin-sdk-tgz \
    && tar -xzf atlassian-plugin-sdk.tgz -C /opt \
    && mv /opt/atlassian-plugin-sdk-* /opt/atlassian-plugin-sdk \
    && rm atlassian-plugin-sdk.tgz

# Set up environment variables
ENV ATL_PLUGIN_SDK_HOME=/opt/atlassian-plugin-sdk
ENV PATH=$ATL_PLUGIN_SDK_HOME/bin:$PATH

# Set the working directory
WORKDIR /opt/atlassian-plugin-sdk

CMD ["atlas-debug"]
