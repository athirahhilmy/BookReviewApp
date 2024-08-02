const express = require('express');
const mysql = require('mysql2');
const multer = require('multer');
const app = express();

// set up multer for file uploads
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'public/images'); // directory to save uploaded files
    },
    filename: (req, file, cb) => {
        cb(null, file.originalname); 
    }
});

const upload = multer({ storage: storage });

// Create MySQL connection
const connection = mysql.createConnection({
    host: 'sql.freedb.tech',
    user: 'freedb_athbookreview',
    password: 'THz6WNPJ@udtJ9y',
    database: 'freedb_athbookreview'
});

connection.connect((err) => {
    if (err) {
        console.error('Error connecting to MySQL:', err);
        return;
    }
    console.log('Connected to MySQL database');
});

// Set up view engine
app.set('view engine', 'ejs');
// enable static files
app.use(express.static('public'));
// Define routes
// enable form processing
app.use(express.urlencoded({ extended: false }));

app.get('/', (req, res) => {
    const sql = 'SELECT * FROM books';
    // fetch data from MySQL
    connection.query(sql, (error, results) => {
        if (error) {
            console.error('Database query error:', error.message);
            return res.status(500).send('Error Retrieving books');
        }
        // render HTML page with data
        res.render('index', { books: results });
    });
});

app.get('/books/:id', (req, res) => {
    // extract the book ID from the request parameters
    const bookid = req.params.id;
    const sql = 'SELECT * FROM books WHERE bookid = ?';
    // fetch data from MySQL based on book ID
    connection.query(sql, [bookid], (error, results) => {
        if (error) {
            console.error('Database query error:', error.message);
            return res.status(500).send('Error Retrieving books by ID');
        }
        // check if any book with the given ID was found
        if (results.length > 0) {
            // render HTML page with the book data
            res.render('bookInfo', { books: results[0] });
        } else {
            // if no book with the given ID was found, render a 404 page or handle it accordingly
            res.status(404).send('Book not found');
        }
    });
});

app.get('/addBooks', (req, res) => {
    res.render('addBooks');
});

app.post('/addBooks', upload.single('image'), (req, res) => {
    // extract product data from the request body
    const {name, author, summary, rating, review} = req.body;
    let image;
    if (req.file){
        image = req.file.filename;
    } else {
        image=null;
    }
    const sql= 'INSERT INTO books (name, author, summary, rating, review, image) VALUES (?,?,?,?,?,?)';
    // insert the new product into the database
    connection.query( sql, [name, author, summary, rating, review, image], (error, results) => {
        if (error){
            // handle any error that occurs during the database operation
            console.error("Error adding product:", error);
            res.status(500).send('Error adding book');
        } else {
            // send a success response
            res.redirect('/');
        }
    });
});

app.get('/updateBooks/:id',upload.single('image'), (req, res) => {
    const bookid = req.params.id;
    const sql = 'SELECT * FROM books WHERE bookid = ?';
    // fetch data from MySQL based on book ID
    connection.query(sql, [bookid], (error, results) => {
        if (error) {
            console.error('Database query error:', error.message);
            return res.status(500).send('Error Retrieving books by ID');
        }
        // check if any book with the given ID was found
        if (results.length > 0) {
            // render HTML page with the book data
            res.render('updateBooks', { books: results[0] });
        } else {
            // if no book with the given ID was found, render a 404 page or handle it accordingly
            res.status(404).send('Book not found');
        }
    });
});

app.post('/updateBooks/:id', upload.single('image'), (req, res) => {
    const bookid = req.params.id;
    // extract book data from the request body
    const { name, author, summary, rating, review } = req.body;
    let image = req.body.currentImage; // retrieve current image filename
    if (req.file) { // set image to be new image filename
        image = req.file.filename; // set image to be new image filename
    }
    const sql = 'UPDATE books SET name = ?, author = ?, summary = ?, rating=?, review=?, image =? WHERE bookid = ?';

    // update the book in the database
    connection.query(sql, [name, author, summary, rating, review, image, bookid], (error, results) => {
        if (error) {
            // handle any error that occurs during the database operation
            console.error('Error updating book:', error);
            res.status(500).send('Error updating book');
        } else {
            // send a success response
            res.redirect('/');
        }
    });
});

app.get('/deleteBooks/:id', (req, res) => {
    const bookid = req.params.id;
    const sql = 'DELETE FROM books WHERE bookid = ?';
    connection.query(sql, [bookid], (error, results) => {
        if (error) {
            // handle any error that occurs during the database operation
            console.error('Database deleting book:', error);
            return res.status(500).send('Error deleting book');
        } else {
            // send a success response
            res.redirect('/');
        }
    });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
