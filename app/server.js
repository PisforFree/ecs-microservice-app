// app/server.js
const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send("Hello from ECS Fargate microservice!");
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

// health endpoint (no auth, fast)
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'ok' });
});
