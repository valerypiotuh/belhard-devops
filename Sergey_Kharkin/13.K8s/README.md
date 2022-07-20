Деплой из образа со своего репозитория. При создании образа копирую кастомный index.html

helm list
NAME  	NAMESPACE	REVISION	UPDATED                                	STATUS  	CHART       	APP VERSION
nginx2	default  	1       	2022-07-19 18:46:54.497164458 +0300 MSK	deployed	nginx2-0.1.0	1.16.0 

Крутятся два экземпляра:

kubectl get pods -n default
NAME                            READY   STATUS    RESTARTS   AGE
k8s-nginx-app-99cf7c7d4-4mx2w   1/1     Running   0          18h
k8s-nginx-app-99cf7c7d4-n22lv   1/1     Running   0          18h
my-nginx                        2/2     Running   0          19h
serg-dep-5d66dd849-24xbj        1/1     Running   0          18h
serg-dep-5d66dd849-7sznp        1/1     Running   0          18h
serg-dep-5d66dd849-kksjl        1/1     Running   0          18h
serg-dep-5d66dd849-l7gt8        1/1     Running   0          18h


kubectl --namespace default port-forward k8s-nginx-app-99cf7c7d4-4mx2w 8095:80
Forwarding from 127.0.0.1:8095 -> 80
Forwarding from [::1]:8095 -> 80
Handling connection for 8095

