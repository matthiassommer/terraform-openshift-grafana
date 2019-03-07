.PHONY: init
init:
	terraform init
	terraform get

.PHONY: plan
plan:
	terraform plan

.PHONY: apply
apply:
	terraform apply

.PHONY: deploy
deploy-grafana:
	oc rollout latest grafana -n grafana-test-project

.PHONY: create
create:
	oc apply -f grafana_deployment.yaml
	oc apply -f grafana_service.yaml
	oc create -f route.json