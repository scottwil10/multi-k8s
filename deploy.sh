docker build -t scowil101/multi-client:latest -t scowil101/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t scowil101/multi-server:latest -t scowil101/multi-server:$SHA -f ./server/Dockerfle ./server
docker build -t scowil101/muti-worker:latest -t scowil101/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push scowil101/multi-client:latest
docker push scowil101/multi-server:latest
docker push scowil101/multi-worker:latest
docker push scowil101/multi-client:$SHA
docker push scowil101/multi-server:$SHA
docker push scowil101/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=scowil101/multi-server:$SHA
kubectl set image deployments/client-deployment client=scowil101/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=scowil101/multi-worker:$SHA

