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

.PHONY: create-route
create-route:
	oc apply -f route.json