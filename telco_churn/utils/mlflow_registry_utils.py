# Helper functions
import mlflow
from mlflow.utils.rest_utils import http_request
import json

def mlflow_call_endpoint(endpoint, method, body='{}'):
    def client():
        mlflow.tracking.client.MlflowClient()
        
    host_creds = client()._tracking_client.store.get_host_creds()
    host = host_creds.host
    token = host_creds.token   
    
      if method == 'GET':
            response = http_request(
              host_creds=host_creds, endpoint="/api/2.0/mlflow/{}".format(endpoint), method=method, params=json.loads(body))
        else:
            response = http_request(
              host_creds=host_creds, endpoint="/api/2.0/mlflow/{}".format(endpoint), method=method, json=json.loads(body))
        return response.json()