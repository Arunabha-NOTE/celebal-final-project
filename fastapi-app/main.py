from fastapi import FastAPI
import uvicorn
import os

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello from FastAPI!"}

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8080))
    print(f"Listening on port {port}")
    uvicorn.run(app, host="0.0.0.0", port=port)
