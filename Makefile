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

.PHONY: create-route
create-route:
	oc apply -f terraform/route.json