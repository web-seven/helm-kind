<p align="center">
	<img src="https://cncf-branding.netlify.app/img/projects/helm/icon/color/helm-icon-color.svg" height="100" alt="helm logo"/>
	<img src="https://d33wubrfki0l68.cloudfront.net/d0c94836ab5b896f29728f3c4798054539303799/9f948/logo/logo.png" height="100" alt="github logo"/>
</p>

# helm-kind
![Helm3 supported](https://img.shields.io/badge/Helm%203-supported-green)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/web-seven/helm-kind)


`helm-kind` is a [helm](https://github.com/kubernetes/helm) plugin that allows you to create Kubernetes cluster locally using [Kind](https://kind.sigs.k8s.io/), with local directory nounted to cluster host filesystem, eg. for local development

## Pre-requisites
1. Plugin require latest version of [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation) to be installed.

## Installation

Install the stable version:
```shell
$ helm plugin install https://github.com/web-seven/helm-kind.git
```

## Usage

```shell
# Create cluster
$ helm kind

# Delete cluster 
$ kind delete cluster
```

