const express = require('express');
const multer = require('multer');
const mysql = require('mysql2');
const path = require('path');

// Initialize Express app
const app = express();

// Middleware setup
app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));
app.use('/uploads', express.static('uploads')); // Serve uploaded files

// Set EJS as the view engine
app.set('view engine', 'ejs');

// Configure Multer for file uploads
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'public/images');
    },
    filename: (req, file, cb) => {
        cb(null, Date.now() + '-' + file.originalname);
    }
});
const upload = multer({ storage: storage });

// Create MySQL connection
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'c237_ga_nutrinourish'
});
connection.connect((err) => {
    if (err) {
        console.error('Error connecting to MySQL:', err);
        return;
    }
    console.log('Connected to MySQL database');
});

// Route handlers
app.get('/', (req, res) => {
    const articlesSql = 'SELECT * FROM articles';
    const recipesSql = 'SELECT * FROM recipe WHERE recipe_id <= 3';
    const mainSql = 'SELECT * FROM main';

    connection.query(articlesSql, (error, articlesResults) => {
        if (error) return handleError(res, error, 'Error Retrieving articles');

        connection.query(recipesSql, (error, recipesResults) => {
            if (error) return handleError(res, error, 'Error Retrieving recipes');

            connection.query(mainSql, (error, mainResults) => {
                if (error) return handleError(res, error, 'Error Retrieving main');

                res.render('index', { articles: articlesResults, recipes: recipesResults, main: mainResults });
            });
        });
    });
});

app.get('/recipe', (req, res) => {
    const articlesSql = 'SELECT * FROM articles';
    const recipesSql = 'SELECT * FROM recipe';

    connection.query(articlesSql, (error, articlesResults) => {
        if (error) return handleError(res, error, 'Error Retrieving articles');

        connection.query(recipesSql, (error, recipesResults) => {
            if (error) return handleError(res, error, 'Error Retrieving recipes');

            res.render('recipe', { articles: articlesResults, recipes: recipesResults });
        });
    });
});

app.get('/plans', (req, res) => {
    const mealPlansSql = 'SELECT * FROM meal_plan';

    connection.query(mealPlansSql, (error, mealplansResults) => {
        if (error) return handleError(res, error, 'Error Retrieving meal plans');

        res.render('planDetails', { meal_plans: mealplansResults });
    });
});

app.get('/meal-plan/:id/recipes', (req, res) => {
    const planId = req.params.id;
    if (!planId || isNaN(planId)) return res.status(400).send('Invalid plan ID');

    const mealPlanSql = 'SELECT * FROM meal_plan WHERE plan_id = ?';
    connection.query(mealPlanSql, [planId], (error, mealPlanResults) => {
        if (error) return handleError(res, error, 'Error Retrieving meal plan');
        if (mealPlanResults.length === 0) return res.status(404).send('Meal plan not found');

        const recipesSql = 'SELECT * FROM recipe WHERE plan_id = ?';
        connection.query(recipesSql, [planId], (error, recipesResults) => {
            if (error) return handleError(res, error, 'Error Retrieving recipes');

            res.render('mealplan', { meal_plan: mealPlanResults[0], recipes: recipesResults });
        });
    });
});

app.get('/share', (req, res) => {
    const reviewsSql = 'SELECT * FROM review';

    connection.query(reviewsSql, (error, reviewResults) => {
        if (error) return handleError(res, error, 'Error Retrieving reviews');
        res.render('share', { reviews: reviewResults });
    });
});

app.get('/review/new', (req, res) => {
    res.render('newReview');
});

app.post('/review/new', upload.single('image'), (req, res) => {
    const { caption, comment, rating } = req.body;
    const image = req.file ? req.file.filename : null;

    const sql = 'INSERT INTO review (image, caption, comment, rating) VALUES (?, ?, ?, ?)';
    const values = [image, caption, comment, rating];

    connection.query(sql, values, (error) => {
        if (error) return handleError(res, error, 'Error Creating Review');
        res.redirect('/share');
    });
});

app.get('/review/edit/:id', (req, res) => {
    const reviewId = req.params.id;
    const sql = 'SELECT * FROM review WHERE review_id = ?';
    connection.query(sql, [reviewId], (error, results) => {
        if (error) return handleError(res, error, 'Error Retrieving Review');
        res.render('editReview', { review: results[0] });
    });
});

app.post('/review/edit/:id', upload.single('image'), (req, res) => {
    const reviewId = req.params.id;
    const { caption, comment, rating } = req.body;
    const image = req.file ? req.file.filename : null;

    const sql = 'UPDATE review SET image = ?, caption = ?, comment = ?, rating = ? WHERE review_id = ?';
    const values = [image, caption, comment, rating, reviewId];

    connection.query(sql, values, (error) => {
        if (error) return handleError(res, error, 'Error Updating Review');
        res.redirect('/share');
    });
});


app.post('/review/delete/:id', (req, res) => {
    const reviewId = req.params.id;
    const sql = 'DELETE FROM review WHERE review_id = ?';
    connection.query(sql, [reviewId], (error) => {
        if (error) return handleError(res, error, 'Error Deleting Review');
        res.redirect('/share');
    });
});

app.get('/about', (req, res) => {
    const aboutSql = 'SELECT * FROM about ORDER BY FIELD(section, "Our Story", "Our Mission", "Community", "Announcements")';

    connection.query(aboutSql, (error, results) => {
        if (error) return handleError(res, error, 'Error Retrieving About Us content');

        const aboutContent = results.reduce((acc, row) => {
            acc[row.section] = acc[row.section] || [];
            acc[row.section].push(row);
            return acc;
        }, {});

        res.render('about', { about: aboutContent });
    });
});

app.get('/recipe/:id', (req, res) => {
    const recipeId = req.params.id;
    const sql = 'SELECT * FROM recipe WHERE recipe_id = ?';
    connection.query(sql, [recipeId], (error, results) => {
        if (error) return handleError(res, error, 'Error retrieving recipe');
        if (results.length > 0) {
            res.render('recipe-id', { recipe: results[0] });
        } else {
            res.status(404).send('Recipe not found');
        }
    });
});

app.get('/editRecipe/:id', (req, res) => {
    const recipeId = req.params.id;
    const sql = 'SELECT * FROM recipe WHERE recipe_id = ?';
    connection.query(sql, [recipeId], (error, results) => {
        if (error) return handleError(res, error, 'Error retrieving recipe for editing');
        if (results.length > 0) {
            res.render('editRecipe', { recipe: results[0] });
        } else {
            res.status(404).send('Recipe not found');
        }
    });
});

app.post('/editRecipe/:id', upload.single('recipe_img'), (req, res) => {
    const recipeId = req.params.id;
    const { name, rating,ingredients, calories, link, protein, carbs, fiber, created_by } = req.body;
    const recipe_img = req.file ? req.file.filename : null;

    const sql = 'UPDATE recipe SET name = ?, rating = ?, ingredients = ?, calories = ?, link = ?, recipe_img = ?, protein = ?, carbs = ?, fiber = ?, created_by = ? WHERE recipe_id = ?';
    const values = [name, rating, ingredients, calories, link, recipe_img, protein, carbs, fiber, created_by, recipeId];

    connection.query(sql, values, (error) => {
        if (error) return handleError(res, error, 'Error updating recipe');
        res.redirect(`/recipe/${recipeId}`);
    });
});

app.post('/deleteRecipe/:id', (req, res) => {
    const recipeId = req.params.id;
    const sql = 'DELETE FROM recipe WHERE recipe_id = ?';
    connection.query(sql, [recipeId], (error) => {
        if (error) return handleError(res, error, 'Error deleting recipe');
        res.redirect('/recipe');
    });
});

app.get('/addRecipe', (req, res) => {
    const currentDate = new Date().toISOString().split('T')[0]; // Gets YYYY-MM-DD format
    res.render('addRecipe', { currentDate });
});


app.post('/addRecipe', upload.single('recipe_img'), (req, res) => {
    const { name, ingredients, calories, protein, carbs, fiber, link, created_by, rating } = req.body;
    const recipe_img = req.file ? req.file.filename : null;

    console.log('Form Data:', req.body); // Log the form data to check if rating is present

    // Corrected SQL query with all placeholders
    const query = 'INSERT INTO recipe (name, ingredients, calories, protein, carbs, fiber, link, recipe_img, created_by, rating) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
    const values = [name, ingredients, calories, protein, carbs, fiber, link, recipe_img, created_by, rating];

    connection.query(query, values, (err) => {
        if (err) {
            console.error('Database Error:', err); // Log error details
            return handleError(res, err, 'Server error');
        }
        res.redirect('/recipe'); // Redirect after successful insertion
    });
});

app.get('/update-plan/:id', (req, res) => {
    const recipeId = req.params.id;
    if (!recipeId || isNaN(recipeId)) return res.status(400).send('Invalid recipe ID');

    const recipeSql = 'SELECT * FROM recipe WHERE recipe_id = ?';
    const mealPlanSql = 'SELECT * FROM meal_plan';

    connection.query(recipeSql, [recipeId], (error, recipeResults) => {
        if (error) return handleError(res, error, 'Error Retrieving recipe');
        if (recipeResults.length === 0) return res.status(404).send('Recipe not found');

        connection.query(mealPlanSql, (error, mealPlanResults) => {
            if (error) return handleError(res, error, 'Error Retrieving meal plans');

            res.render('updatePlan', { recipe: recipeResults[0], meal_plans: mealPlanResults });
        });
    });
});

app.post('/update-plan/:id', (req, res) => {
    const recipeId = req.params.id;
    const planId = req.body.plan_id;

    const query = 'UPDATE recipe SET plan_id = ? WHERE recipe_id = ?';
    connection.query(query, [planId, recipeId], (error) => {
        if (error) return handleError(res, error, 'Error updating plan_id');
        res.redirect('/plans');
    });
});

app.post('/removePlan/:id', (req, res) => {
    const recipeId = req.params.id;

    const query = 'UPDATE recipe SET plan_id = NULL WHERE recipe_id = ?';
    connection.query(query, [recipeId], (error) => {
        if (error) return handleError(res, error, 'Error removing plan_id');
        res.redirect('/plans');
    });
});

// Error handler
function handleError(res, error, message) {
    console.error(message, error.message);
    return res.status(500).send(message);
}

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
