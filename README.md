# Atlassian SDK Development
Testing atlassian-sdk plugin development for Jira and Confluence

## Building the image
```
docker build --tag atlassian-sdk ./
```

## Running the SDK
Run a standalone version of an atlassian product, specifying the version if you want
```
docker run -it --name atlassian-sdk --volume $(pwd)/:/opt/atlas -p 2990:2990 atlassian-sdk:latest atlas-run-standalone --product jira --version 9.12.17
```
(Optional) before stopping the container, create a new plugin if you haven't already, [link to tutorial](https://developer.atlassian.com/server/framework/atlassian-sdk/create-a-helloworld-plugin-project/)
```
docker exec -it atlassian-sdk bash
root@12734a689654:/opt/atlassian-plugin-sdk# cd /opt/atlas
root@12734a689654:/opt/atlassian-plugin-sdk# atlas-create-jira-plugin
```
Run with atlas-debug - move to the folder of the plugin you are developing and run:
```
docker run -it --name atlassian-sdk --volume $(pwd)/:/opt/atlas -p 2990:2990 -p 5005:5005 atlassian-sdk:latest /bin/sh -c 'cd /opt/atlas; atlas-debug --product jira --version 9.12.17'
```

