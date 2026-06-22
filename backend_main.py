from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

# =========================
# 🧠 Request Model
# =========================
class FarmRequest(BaseModel):
    user_id: str
    farm_type: str
    count: int

# =========================
# 🤖 AI Core (Startup Version)
# =========================
@app.post("/api/v1/analyze")
def analyze(req: FarmRequest):

    base_profit = req.count * 10000

    shi_bonus = req.count * 2500  # سود پروتئین SHI
    cost_reduction = req.count * 1200

    future_profit = base_profit + shi_bonus - cost_reduction

    return {
        "user_id": req.user_id,
        "farm_type": req.farm_type,

        "current_profit": base_profit,
        "future_profit_with_SHI": future_profit,

        "shi_impact": {
            "protein_replacement": "SHI",
            "profit_increase_percent": 18,
            "cost_reduction_percent": 12
        },

        "market_status": "high_opportunity",

        "recommendation": "ورود به استفاده از پروتئین SHI بسیار سودآور است"
    }

# =========================
# 🟢 Health Check
# =========================
@app.get("/")
def root():
    return {
        "status": "FarmWise Startup API Running",
        "version": "2.0.0",
        "mode": "production"
    }
