# Ephemeral Debugger for Go Apps
This project allows you to execute and debug your code in a managed ephemeral environment. It manages the process of containerizing your app, setting up a debugger, and working with Quay and Openshift. All you have to do is click "Ephemeral Debugger" in the VSCode "Run and Debug" dialog and your code will be automagically set up in ephemeral with a remote debugger attached.

## Requirements
* [Bonfire](https://github.com/RedHatInsights/bonfire)
* [oc](https://docs.openshift.com/container-platform/4.2/cli_reference/openshift_cli/developer-cli-commands.html)

## Config
0. Reserve an ephemeral namespace with Bonfire and note the name
0. Copy `.vscode/example.tasks.json` to `.vscode/tasks.json`
0. Edit `.vscode/tasks.json` and replace the environment variable values with your info

## Usage

## Resources Consulted
* [Quay.io Guides](https://docs.quay.io/guides/)
* [Remote Debugging with Delve](https://golangforall.com/en/post/go-docker-delve-remote-debug.html)
* [Delve Installation](https://github.com/go-delve/delve/tree/master/Documentation/installation)
* [Go remote debug delve](https://github.com/antelman107/go-remote-debug-delve)

## Helpful Commands
```
#Describe the service and get the ingress URL
oc describe service ephemeral-debugger-service -n ephemeral-wjbumf

#Describe the pod and get details on status
oc describe pod ephemeral-debugger-pod -n ephemeral-ezprya

#Get a shell in the pod
oc exec ephemeral-debugger-pod -n ephemeral-ezprya -i -t -- bash

#Get pod logs
oc logs ephemeral-debugger-pod -n ephemeral-ezprya
```