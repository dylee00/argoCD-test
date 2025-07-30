#argoCD 설치
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

#argoCD admin password 확인
kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d;echo

#k8s서버포트포워딩
kubectl port-forward svc/argocd-server -n argocd 8080:443

#server에 public key가 등록된 머신에서 ssh-L을 이용해 argoCD 관리자 페이지 접속, ingress없이 접속 가능
ssh -L [my-port]:localhost:[server-port] user@remote-server.com
