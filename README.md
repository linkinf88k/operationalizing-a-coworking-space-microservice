# Coworking Space Service Extension
The Coworking Space Service is a set of APIs that enables users to request one-time tokens and administrators to authorize access to a coworking space. This service follows a microservice pattern and the APIs are split into distinct services that can be deployed and managed independently of one another.

## 1: Set Up a Postgres Database with Helm Chart
Pre-requisites:
- Have Kubernetes cluster ready.
- Have `kubectl` installed and configured to interact with your cluster.
- Have Helm installed.

Instructions:
1. Install Helm:
   ```bash
   curl -LO https://get.helm.sh/helm-v3.12.2-linux-amd64.tar.gz
   ```
2. Add the Bitnami Helm Repository:
    ```bash
   helm repo add bitnami https://charts.bitnami.com/bitnami
   helm repo update
   ```
3. Install the PostgreSQL Chart:
   ```bash
   helm install my-postgres bitnami/postgresql
   ```
4. Verify the Installation:
   ```bash
   helm list
   kubectl get pods
   ```
5. Get the PostgreSQL Connection Details:
   ```bash
   export POSTGRES_PASSWORD=$(kubectl get secret --namespace default my-postgres-postgresql -o jsonpath="{.data.postgres-password}" | base64 --decode)
   ```
## 2: Local Testing of Analytics Application**

*   Navigate to the **analytics/** directory.
*   Install requirements for the analytics application.  
    

<table><tbody><tr><td><code>python -m pip install --upgrade pip</code><br><code>pip install -r analytics/requirements.txt</code></td></tr></tbody></table>

*   Run the analytics application locally:

<table><tbody><tr><td><code>DB_USERNAME=postgres DB_PASSWORD=rJ6lPsG58r python analytics/app.py</code></td></tr></tbody></table>


*   Test the application using curl commands.

<table><tbody><tr><td><code>curl http://127.0.0.1:5153/api/reports/daily_usage</code><br><code>curl http://127.0.0.1:5153/api/reports/user_visits</code></td></tr></tbody></table>


Saving costs:
Implement Autoscaling:
Utilize Kubernetes Horizontal Pod Autoscaling (HPA) to automatically adjust the number of replicas based on resource metrics. This helps scale resources up during peak demand and down during low demand, optimizing costs.

Rightsize Resources:
Regularly review and adjust resource allocations for your Kubernetes pods based on actual usage. Avoid overprovisioning, and set resource limits and requests appropriately.

Alerts on Costly Resources:
Set up alerts based on cost thresholds to be notified when spending exceeds predefined limits. This allows for proactive cost management.

Remember to monitor your application's resource usage and adjust your instance types based on evolving requirements.
