# goci-service-chart

#### Maintained by [@goci-io/prp-kubernetes](https://github.com/orgs/goci-io/teams/prp-kubernetes)

This chart is used to deploy applications with full configuration and ability to customize.


*More Documentation follows soon*


Have a look into the [`templates`](templates) folder and [`values.yaml`](values.yaml) file.


## Package
This package includes:

- Deployment  
- Secret  
- Service  
- Ingress (optional)  
- HorizontalPodAutoscaler (optional)
- PodDisruptionBudget (optional)  
- ServiceMonitor (optional)  

## Usage

To use this package you need to meet some prerequisites. Helm usually creates a namespace if it does not already exists. 
In our case we need to have an already setup and ready to use namespace. 

The deployment requires a service account named like the namespace itself and you may also need certain docker registry secrets and more. This all is provided by the [k8s-namespace-provisioning](https://github.com/goci-io/k8s-namespace-provisioning) module created by [GoCI.io](https://goci.io)

Install the module into the provisioned namespace:   
`helm install -n <namespace> stable/goci-service`

or locally:   
`helm install -n <namespace> ./`

You can overwrite any values from the [values.yaml](values.yaml)

#### Terraform

With [Terraform](https://www.terraform.io/) you can provision infrastructure into kubernetes clusters using the helm provider. 
Every release contains addtional terraform code. By adding your own module or providing a `terraform.tfvars` you can also deploy your helm release.
