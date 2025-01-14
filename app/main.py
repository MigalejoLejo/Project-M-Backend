# from fastapi import FastAPI

# app = FastAPI()


# @app.get("/")
# def read_root():
#     return {"message": "Welcome to my  API!"}


# @app.get("/items/{item_id}")
# def read_item(item_id: int, q: str = None):
#     return {"item_id": item_id, "query": q}


# @app.post("/items/")
# def create_item(name: str, price: float, in_stock: bool):
#     return {
#         "name": name,
#         "price": price,
#         "in_stock": in_stock,
#         "message": "Item created successfully!"
#     }


from fastapi import FastAPI, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer
from jose import JWTError, jwt
import requests
from typing import Optional

# Define the Keycloak server configuration
KEYCLOAK_URL = "http://localhost:8080/realms/project-m/protocol/openid-connect/certs"
CLIENT_ID = "backend-app"  # This should match your client_id in Keycloak

# OAuth2PasswordBearer is used to extract the token from the Authorization header
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")

app = FastAPI()

# Function to get the public key from Keycloak for verifying the JWT token


def get_keycloak_public_key():
    try:
        # Get the public key from Keycloak's JWKS endpoint
        response = requests.get(KEYCLOAK_URL)
        response.raise_for_status()
        return response.json()['keys'][0]['public_key']
    except requests.exceptions.RequestException as e:
        raise HTTPException(
            status_code=500, detail="Keycloak server unreachable")

# Function to verify the JWT token


def verify_token(token: str):
    try:
        public_key = get_keycloak_public_key()
        # Decode and verify the JWT token
        payload = jwt.decode("token", public_key, algorithms=[
                             "RS256"], audience=CLIENT_ID)
        return payload
    except JWTError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid token",
            headers={"WWW-Authenticate": "Bearer"},
        )

# Dependency that will extract the token and verify it


def get_current_user(token: str = Depends(oauth2_scheme)):
    return verify_token(token)


@app.get("/")
def read_root(current_user: dict = Depends(get_current_user)):
    return {"message": "Welcome to my dockerized API!"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Optional[str] = None, current_user: dict = Depends(get_current_user)):
    return {"item_id": item_id, "query": q}


@app.post("/items/")
def create_item(name: str, price: float, in_stock: bool, current_user: dict = Depends(get_current_user)):
    return {
        "name": name,
        "price": price,
        "in_stock": in_stock,
        "message": "Item created successfully!"
    }
