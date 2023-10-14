import express from "express";
import { getAllCustomers, selectAndVeiwCustomer, transferMoney } from "./db.js";

import cors from "cors";
const app = express();
app.use(cors());

app.get("/customers", async (req, res) => {
  const allCustomers = await getAllCustomers();
  res.send(allCustomers);
});

app.get("/customers/:id", async (req, res) => {
  const customerId = req.params.id;
  const customer = await selectAndVeiwCustomer(customerId);
  res.send(customer);
});

app.get("/transfermoney/:sender/:receiver/:money", async (req, res) => {
  const result = await transferMoney(
    req.params.sender,
    req.params.receiver,
    req.params.money
  );
  res.send(result);
});

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send("Something broke!");
});

app.listen(4000, () => {
  console.log("Server is listening on port 4000");
});
