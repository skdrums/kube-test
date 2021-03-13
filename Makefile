.PHONY: set-config

set-config:
	gcloud config set account sora.token.kannaduki1009@gmail.com
	gcloud config set project apt-icon-304103
	kubectl config use-context gke_apt-icon-304103_asia-northeast1-a_cluster-1

#configmap:
#	kubectl create configmap envoy-config --from-file=envoy-config
