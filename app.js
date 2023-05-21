const express = require('express');
const mysql = require('mysql');
const path = require('path');

const app = express();

// Create a MySQL connection
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '1234',
  database: 'bib'
});

// Connect to the database
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to the database: ' + err.stack);
    return;
  }
  console.log('Connected to the database.');
});

// Define a route to fetch the review of bookid 1
app.get('/review', (req, res) => {
  const bookId = 'bookId1';

  // Query the database for the review of bookid1
  connection.query('SELECT review FROM customer WHERE bookid = ?', [bookId], (err, rows) => {
    if (err) {
      res.send('Error fetching the review.');
      return;
    }

    if (rows.length === 0) {
      res.send('No review found for bookid1.');
      return;
    }

    const review = rows[0].review;
    res.send(review);
  });
});

// Define a route to serve the HTML file
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'review.html'));
});

// Start the server
const port = 3000;
app.listen(port, () => {
  console.log(`Server listening on port ${port}.`);
});