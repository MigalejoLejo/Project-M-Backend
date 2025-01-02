from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"message": "Welcome to my dockerized API!"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "query": q}


@app.post("/items/")
def create_item(name: str, price: float, in_stock: bool):
    return {
        "name": name,
        "price": price,
        "in_stock": in_stock,
        "message": "Item created successfully!"
    }
