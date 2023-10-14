import mysql from "mysql2";
import dotenv from "dotenv";
dotenv.config();
var pool = mysql
  .createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE,
  })
  .promise();

export async function getAllCustomers() {
  const [result] = await pool.query(`SELECT * FROM customer`);
  return result;
}

// export async function selectAndVeiwCustomer(id) {
//   const [result] = await pool.query(`SELECT * FROM customer WHERE id = ${id}`);
//   return result;
// }
export async function selectAndVeiwCustomer(id) {
  try {
    const sql = "SELECT * FROM customer WHERE id = ?";
    const [rows] = await pool.execute(sql, [id]);
    console.log(rows);

    if (rows.length === 0) {
      return null; // No customer found
    }

    return rows[0]; // Return the first (and presumably only) customer
  } catch (error) {
    console.error("Error: ", error);
    throw error; // Propagate the error for handling in the caller
  }
}

export async function transferMoney(id1, id2, amount) {
  const [result] = await pool.query(
    `SELECT * FROM transfers`,
    `UPDATE customer SET curr_balance = curr_balance - ${amount} WHERE id = ${id1}`,
    `UPDATE customer SET curr_balance = curr_balance + ${amount} WHERE id = ${id2}`
  );
  return result;
}
